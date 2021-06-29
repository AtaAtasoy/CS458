package com.example.covid19survey

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.Button
import android.widget.EditText

class GenderActivity : AppCompatActivity() {

    lateinit var genderTv: EditText
    lateinit var nextButton: Button

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_gender)

        val message = intent.getStringExtra(EXTRA_MESSAGE)

        genderTv = findViewById(R.id.genderEditText)
        nextButton = findViewById(R.id.genderNextButton)

        nextButton.setOnClickListener {
            val gender = genderTv.text.toString()
            val currentSurveyResult = "$message, $gender"
            Log.i(currentSurveyResult, "Survey data: $currentSurveyResult")
            val intent = Intent(this, VaccineTypeActivity::class.java).apply {
                putExtra(EXTRA_MESSAGE, "$currentSurveyResult")
            }
            startActivity(intent)
        }
    }
}