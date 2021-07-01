package com.example.covid19survey

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.*

class ReviewSurveyInputsActivity : AppCompatActivity() {

    private lateinit var listView: ListView
    private lateinit var submitButton: Button
    private var message: String = "Survey Submitted Successfully!"
    private val duration = Toast.LENGTH_LONG

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_review_survey_inputs)

        listView = findViewById<ListView>(R.id.reviewSurveyInputsView)
        submitButton = findViewById(R.id.submitSurveyButton)

        // Survey result is in this comma separated string
        val surveyResult = intent.getStringExtra(EXTRA_MESSAGE)
        Log.i(surveyResult, "Result of the survey: $surveyResult")

        val surveyResults: Array<String>
        if (surveyResult != null) {
            surveyResults = surveyResult.split(",").toTypedArray()
            val adapter = ArrayAdapter(this, android.R.layout.simple_expandable_list_item_1,
                surveyResults)
            listView.adapter = adapter
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