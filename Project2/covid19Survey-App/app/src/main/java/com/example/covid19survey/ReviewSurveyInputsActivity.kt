package com.example.covid19survey

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.*

class ReviewSurveyInputsActivity : AppCompatActivity() {

    private lateinit var nameTv: TextView
    private lateinit var cityTv: TextView
    private lateinit var birthDateTv: TextView
    private lateinit var genderTv: TextView
    private lateinit var vaccineTypeTv: TextView
    private lateinit var sideEffectsTv: TextView

    private lateinit var submitButton: Button
    private var message: String = "Survey Submitted Successfully!"
    private val duration = Toast.LENGTH_LONG

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_review_survey_inputs)

        submitButton = findViewById(R.id.submitSurveyButton)
        nameTv = findViewById(R.id.nameTextView)
        cityTv = findViewById(R.id.cityTextView)
        birthDateTv = findViewById(R.id.birthDateTextView)
        genderTv = findViewById(R.id.genderTextView)
        vaccineTypeTv = findViewById(R.id.vaccineTypeTextView)
        sideEffectsTv = findViewById(R.id.sideEffectsTextView)


        // Survey result is in this comma separated string
        val surveyResult = intent.getStringExtra(EXTRA_MESSAGE)
        Log.i(surveyResult, "Result of the survey: $surveyResult")

        val surveyResults: Array<String>
        if (surveyResult != null) {
            surveyResults = surveyResult.split(",").toTypedArray()
            nameTv.text = surveyResults[0]
            cityTv.text = surveyResults[1]
            birthDateTv.text = surveyResults[2]
            genderTv.text = surveyResults[3]
            vaccineTypeTv.text = surveyResults[4]
            sideEffectsTv.text = surveyResults[5]
        }

        submitButton.setOnClickListener {
            // Display success message
            val toast = Toast.makeText(applicationContext, message, duration)
            toast.show()

            // Redirect to starting point
            val intent = Intent(this, MainActivity::class.java).apply {
                putExtra(EXTRA_MESSAGE, "")
            }
            startActivity(intent)
        }

    }
}