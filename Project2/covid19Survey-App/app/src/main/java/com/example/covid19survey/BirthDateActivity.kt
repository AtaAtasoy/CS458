package com.example.covid19survey

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.Button
import android.widget.EditText
import android.widget.Toast

class BirthDateActivity : AppCompatActivity(), InputValidator {

    private lateinit var birthDateTv: EditText
    private lateinit var nextButton: Button
    private var errorMsg: String = ""
    private val duration = Toast.LENGTH_SHORT

    override fun isValid(str: String): Boolean{
        if (str.isEmpty()){
            errorMsg = "Field cannot be empty"
            return false
        }
        return true
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_birth_date)

        val message = intent.getStringExtra(EXTRA_MESSAGE)

        birthDateTv = findViewById(R.id.birthDateEditText)
        nextButton = findViewById(R.id.birthDateNextButton)

        nextButton.setOnClickListener {
            val birthDate = birthDateTv.text.toString()
            val currentSurveyResult = "$message, Date of Birth: $birthDate"
            if (isValid(birthDate)){
                Log.i(currentSurveyResult, "Survey data: $currentSurveyResult")
                val intent = Intent(this, GenderActivity::class.java).apply {
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