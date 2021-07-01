package com.example.covid19survey

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.Button
import android.widget.EditText

class CityActivity : AppCompatActivity() {

    private lateinit var cityTv: EditText
    private lateinit var nextButton: Button


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_city)

        val message = intent.getStringExtra(EXTRA_MESSAGE)

        cityTv = findViewById(R.id.cityEditText)
        nextButton = findViewById(R.id.cityNextButton)

        nextButton.setOnClickListener {
            val city = cityTv.text.toString()
            val currentSurveyResult = "$message, City: $city"
            Log.i(currentSurveyResult, "Survey data: $currentSurveyResult")
            val intent = Intent(this, BirthDateActivity::class.java).apply {
                putExtra(EXTRA_MESSAGE, currentSurveyResult)
            }
            startActivity(intent)
        }
    }
}