package com.example.covid19survey

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.Button
import android.widget.EditText

class SideEffectsActivity : AppCompatActivity() {

    lateinit var sideEffectsTv: EditText
    lateinit var finishButton: Button

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_side_effects)

        val message = intent.getStringExtra(EXTRA_MESSAGE)

        sideEffectsTv = findViewById(R.id.sideEffectsEditText)
        finishButton = findViewById(R.id.sideEffectsFinishButton)

        finishButton.setOnClickListener {
            val sideEffects = sideEffectsTv.text.toString()
            val currentSurveyResult = "$message, $sideEffects"
            Log.i(currentSurveyResult, "Survey data: $currentSurveyResult")
            val intent = Intent(this, ReviewSurveyInputsActivity::class.java).apply {
                putExtra(EXTRA_MESSAGE, currentSurveyResult)
            }
            startActivity(intent)
        }
    }
}