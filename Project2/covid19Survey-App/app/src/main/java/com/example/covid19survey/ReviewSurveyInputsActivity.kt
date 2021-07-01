package com.example.covid19survey

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.view.ViewGroup
import android.widget.*

class ReviewSurveyInputsActivity : AppCompatActivity() {

    private lateinit var listView: ListView

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_review_survey_inputs)

        listView = findViewById<ListView>(R.id.reviewSurveyInputsView)

        // Survey result is in this comma separated string
        val message = intent.getStringExtra(EXTRA_MESSAGE)
        val surveyResults: Array<String>
        if (message != null) {
            surveyResults = message.split(",").toTypedArray()
            val adapter = ArrayAdapter(this, android.R.layout.simple_expandable_list_item_1, surveyResults)
            listView.adapter = adapter
        }

        val surveyResult = intent.getStringExtra(EXTRA_MESSAGE)
        Log.i(surveyResult, "Result of the survey: $surveyResult")

    }
}