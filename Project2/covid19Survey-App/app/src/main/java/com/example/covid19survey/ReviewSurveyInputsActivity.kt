package com.example.covid19survey

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log

class ReviewSurveyInputsActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_review_survey_inputs)

        val surveyResult = intent.getStringExtra(EXTRA_MESSAGE)
        Log.i(surveyResult, "Result of the survey: $surveyResult")
    }

}