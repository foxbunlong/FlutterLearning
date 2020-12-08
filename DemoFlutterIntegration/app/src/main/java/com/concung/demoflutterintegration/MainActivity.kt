package com.concung.demoflutterintegration

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
//                    FlutterActivity.createDefaultIntent(this)
                    // Faster launch
                    FlutterActivity
                            .withCachedEngine("my_engine_id")
                            .build(this)
            )
        }
    }
}