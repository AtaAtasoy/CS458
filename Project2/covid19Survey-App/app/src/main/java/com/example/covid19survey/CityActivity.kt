package com.example.covid19survey

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.Button
import android.widget.EditText
import android.widget.Toast

class CityActivity : AppCompatActivity(), InputValidator {

    private lateinit var cityTv: EditText
    private lateinit var nextButton: Button
    private var errorMsg = ""
    private val duration = Toast.LENGTH_SHORT

    override fun isValid(str: String): Boolean {
        // Cannot be empty
        if (str.isEmpty()) {
            errorMsg = "Field cannot be empty"
            return false
        }
        // Should contain alphabets and spaces only
        // Pattern forces user to start with an alphabetic character
        if (!str.matches(Regex("[a-zA-Z][a-zA-Z ]+"))){
            errorMsg = "Name should only contain alphabetic characters and spaces"
            return false
        }
        return true
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_city)

        val message = intent.getStringExtra(EXTRA_MESSAGE)

        cityTv = findViewById(R.id.cityEditText)
        nextButton = findViewById(R.id.cityNextButton)

        nextButton.setOnClickListener {
            val city = cityTv.text.toString()
            val currentSurveyResult = "$message,City: $city"

            if (isValid(city)){
                Log.i(currentSurveyResult, "Survey data: $currentSurveyResult")
                val intent = Intent(this, BirthDateActivity::class.java).apply {
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