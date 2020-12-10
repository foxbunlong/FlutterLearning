package com.concung.demoflutterintegration

import android.content.Intent
import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import io.flutter.embedding.android.FlutterActivity
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        setupUIEvents()
    }

    private fun setupUIEvents() {
        btnGotoFlutter.setOnClickListener {
            startActivity(
                FlutterActivity.createDefaultIntent(this)
            )
        }

        btnGotoFlutterCached.setOnClickListener {
            startActivity(
                // Faster launch
                FlutterActivity
                    .withCachedEngine("my_engine_id")
                    .build(this)
            )
        }

        btnGotoPager.setOnClickListener {
            val intent = Intent(this@MainActivity, PagerActivity::class.java)
            startActivity(intent)
        }
    }
}