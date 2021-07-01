package com.example.covid19survey

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.Button
import android.widget.EditText

class BirthDateActivity : AppCompatActivity() {

    private lateinit var birthDateTv: EditText
    private lateinit var nextButton: Button

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_birth_date)

        val message = intent.getStringExtra(EXTRA_MESSAGE)

        birthDateTv = findViewById(R.id.birthDateEditText)
        nextButton = findViewById(R.id.birthDateNextButton)

        nextButton.setOnClickListener {
            val birthDate = birthDateTv.text.toString()
            val currentSurveyResult = "$message, Date of Birth: $birthDate"
            Log.i(currentSurveyResult, "Survey data: $currentSurveyResult")
            val intent = Intent(this, GenderActivity::class.java).apply {
                putExtra(EXTRA_MESSAGE, currentSurveyResult)
            }
            startActivity(intent)
        }
    }
}