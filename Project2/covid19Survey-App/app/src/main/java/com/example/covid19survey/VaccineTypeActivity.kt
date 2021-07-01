package com.example.covid19survey

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.Button
import android.widget.EditText
import android.widget.RadioButton

class VaccineTypeActivity : AppCompatActivity() {

    private lateinit var biontechButton: RadioButton
    private lateinit var nextButton: Button

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_vaccine_type)

        val message = intent.getStringExtra(EXTRA_MESSAGE)

        biontechButton = findViewById(R.id.biontechButton)
        nextButton = findViewById(R.id.vaccineTypeNextButton)

        nextButton.setOnClickListener {
            val vaccineType = if (biontechButton.isChecked) "Biontech" else "Sinovac"
            val currentSurveyResult = "$message, Vaccine Type: $vaccineType"
            Log.i(currentSurveyResult, "Survey data: $currentSurveyResult")
            val intent = Intent(this, SideEffectsActivity::class.java).apply {
                putExtra(EXTRA_MESSAGE, currentSurveyResult)
            }
            startActivity(intent)
        }
    }
}