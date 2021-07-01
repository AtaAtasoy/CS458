package com.example.covid19survey

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.Button
import android.widget.EditText
import android.widget.Toast

class GenderActivity : AppCompatActivity(), InputValidator {

    private lateinit var genderTv: EditText
    private lateinit var nextButton: Button
    private var errorMsg: String = ""
    private val duration = Toast.LENGTH_SHORT

    override fun isValid(str: String): Boolean {
        // Cannot be empty
        if (str.isEmpty()) {
            errorMsg = "Field cannot be empty"
            return false
        }
        // Should contain alphabets and spaces only
        // Pattern accepts anything but leading spaces
        if (!str.matches(Regex("[^ ]+"))){
            errorMsg = "Field cannot start with spaces"
            return false
        }
        return true
    }


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_gender)

        val message = intent.getStringExtra(EXTRA_MESSAGE)

        genderTv = findViewById(R.id.genderEditText)
        nextButton = findViewById(R.id.genderNextButton)

        nextButton.setOnClickListener {
            val gender = genderTv.text.toString()
            val currentSurveyResult = "$message, Gender: $gender"
            Log.i(currentSurveyResult, "Survey data: $currentSurveyResult")
            if (isValid(gender)){
                val intent = Intent(this, VaccineTypeActivity::class.java).apply {
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