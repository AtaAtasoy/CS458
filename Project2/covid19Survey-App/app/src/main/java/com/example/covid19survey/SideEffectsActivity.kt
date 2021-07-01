package com.example.covid19survey

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.Button
import android.widget.EditText
import android.widget.Toast

class SideEffectsActivity : AppCompatActivity(), InputValidator {

    private lateinit var sideEffectsTv: EditText
    private lateinit var finishButton: Button
    private var errorMsg: String = ""
    private val duration = Toast.LENGTH_SHORT

    override fun isValid(str: String): Boolean {
        // Cannot be empty
        if (str.isEmpty()) {
            errorMsg = "Field cannot be empty"
            return false
        }
        return true
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_side_effects)

        val message = intent.getStringExtra(EXTRA_MESSAGE)

        sideEffectsTv = findViewById(R.id.sideEffectsEditText)
        finishButton = findViewById(R.id.sideEffectsFinishButton)

        finishButton.setOnClickListener {
            val sideEffects = sideEffectsTv.text.toString()
            val currentSurveyResult = "$message, Side Effects: $sideEffects"
            Log.i(currentSurveyResult, "Survey data: $currentSurveyResult")

            if (isValid(sideEffects)){
                val intent = Intent(this, ReviewSurveyInputsActivity::class.java).apply {
                    putExtra(EXTRA_MESSAGE, currentSurveyResult)
                }
                startActivity(intent)
            } else {
                val toast = Toast.makeText(applicationContext, errorMsg, duration)
                toast.show()
            }
        }
    }
}