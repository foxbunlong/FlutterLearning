package com.concung.demoflutterintegration.adapters

import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentManager
import androidx.fragment.app.FragmentPagerAdapter
import com.concung.demoflutterintegration.fragments.NativeAndroidFragment
import io.flutter.embedding.android.FlutterFragment
import io.flutter.embedding.android.FlutterView

class MyPagerAdapter(sfm: FragmentManager) :
    FragmentPagerAdapter(sfm, BEHAVIOR_RESUME_ONLY_CURRENT_FRAGMENT) {

    var mFragment: FlutterFragment? = null

    override fun getCount(): Int {
        return 3
    }

    override fun getItem(position: Int): Fragment {
        when (position) {
            0 -> {
                return NativeAndroidFragment()
            }
            1 -> {
                mFragment = FlutterFragment.withNewEngine()
                    .shouldAttachEngineToActivity(false)
                    .build()
                return mFragment as FlutterFragment
            }
            2 -> {
                mFragment = FlutterFragment.withCachedEngine("my_engine_id")
                    .shouldAttachEngineToActivity(false)
                    .build()
                return mFragment as FlutterFragment
            }
            else -> {
                return NativeAndroidFragment()
            }
        }
    }
}