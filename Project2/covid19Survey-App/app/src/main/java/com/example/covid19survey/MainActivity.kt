package com.example.covid19survey

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.Button
import android.widget.EditText

const val EXTRA_MESSAGE = "SURVEY_RESULT_STRING"


class MainActivity : AppCompatActivity() {

    lateinit var nameTv: EditText
    lateinit var submitButton: Button

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        nameTv = findViewById(R.id.nameEditText)
        submitButton = findViewById(R.id.nextButton)
        title = "Covid-19 Survey"

        submitButton.setOnClickListener {
            val name = nameTv.text.toString()
            Log.i(name, "Name is $name")
            val intent = Intent(this, CityActivity::class.java).apply {
                putExtra(EXTRA_MESSAGE, name)
            }
            startActivity(intent)
        }
    }
}