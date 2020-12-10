package com.concung.demoflutterintegration

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import com.concung.demoflutterintegration.adapters.MyPagerAdapter
import kotlinx.android.synthetic.main.activity_pager.*

class PagerActivity : AppCompatActivity() {

    var pagerAdapter: MyPagerAdapter? = null
    var currentPage: Int = 0

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_pager)

        setupUI()
        setupUIEvents()
    }

    private fun setupUI() {
        pagerAdapter = MyPagerAdapter(supportFragmentManager)
        viewPager.adapter = pagerAdapter
    }

    private fun setupUIEvents() {
        btnPrevious.setOnClickListener {
            if (currentPage > 0) {
                currentPage--
            }
            viewPager.currentItem = currentPage
        }

        btnNext.setOnClickListener {
            if (currentPage < 2) {
                currentPage++
            }
            viewPager.currentItem = currentPage
        }
    }
}