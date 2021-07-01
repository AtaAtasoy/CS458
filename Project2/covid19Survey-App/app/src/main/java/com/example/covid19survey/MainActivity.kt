package com.example.covid19survey

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.Button
import android.widget.EditText
import android.widget.Toast

const val EXTRA_MESSAGE = "SURVEY_RESULT_STRING"


class MainActivity : AppCompatActivity(), InputValidator {

    private lateinit var nameTv: EditText
    private lateinit var submitButton: Button
    private var errorMsg: String = ""
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
            errorMsg = "Name should only contain alphabetic characters and spaces and " +
                    "start with an alphabetic character"
            return false
        }
        return true
    }


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        nameTv = findViewById(R.id.nameEditText)
        submitButton = findViewById(R.id.nextButton)

        submitButton.setOnClickListener {
            val name = nameTv.text.toString()
            Log.i(name, "Name is $name")

            // Validate input
            if (isValid(name)){
                val intent = Intent(this, CityActivity::class.java).apply {
                    putExtra(EXTRA_MESSAGE, "Name: $name")
                }
                startActivity(intent)
            } else {
                val toast = Toast.makeText(applicationContext, errorMsg, duration)
                toast.show()
            }
        }
    }
}