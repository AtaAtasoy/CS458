package com.example.covid19survey

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.Button
import android.widget.EditText
import android.widget.Toast

const val EXTRA_MESSAGE = "SURVEY_RESULT_STRING"


class MainActivity : AppCompatActivity() {

    private lateinit var nameTv: EditText
    private lateinit var submitButton: Button
    private var errorMsg: String = ""

    private fun isValid(fullName: String): Boolean {
        // Cannot be empty
        if (fullName.isEmpty()) {
            errorMsg = "Field cannot be empty"
            return false
        }
        // Should contain alphabets and spaces only
        // Pattern forces user to start with an alphabetic character
        if (!fullName.matches(Regex("[a-zA-Z][a-zA-Z ]+"))){
            errorMsg = "Name should only contain alphabetic characters and spaces"
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
            // Validate input
            if (isValid(name)){
                Log.i(name, "Name is $name")
                val intent = Intent(this, CityActivity::class.java).apply {
                    putExtra(EXTRA_MESSAGE, "Name: $name")
                }
                startActivity(intent)
            } else {
                val duration = Toast.LENGTH_SHORT
                val toast = Toast.makeText(applicationContext, errorMsg, duration)
                toast.show()
            }
        }
    }
}