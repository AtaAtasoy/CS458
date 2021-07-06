package com.example.covid19survey

import android.content.Intent
import android.os.Build
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.Button
import android.widget.EditText
import android.widget.Toast
import androidx.annotation.RequiresApi
import java.time.LocalDate
import java.util.*

private val LONG_MONTHS = arrayOf(1, 3, 5, 7, 8, 10, 12)
private val SHORT_MONTHS = arrayOf(4, 6, 9, 11)

class BirthDateActivity : AppCompatActivity(), InputValidator {

    private lateinit var birthDateTv: EditText
    private lateinit var nextButton: Button
    private var errorMsg: String = ""
    private val duration = Toast.LENGTH_SHORT

    @RequiresApi(Build.VERSION_CODES.O)
    override fun isValid(str: String): Boolean{
        if (str.isEmpty()){
            errorMsg = "Field cannot be empty"
            return false
        }
        if (!str.matches(Regex("[0-9]{2}[.|/][0-9]{2}[.|/][0-9]{4}"))) {
            errorMsg = "Date must be in form of dd/mm/yyyy or dd.mm.yyyy"
            return false
        }

        // Getting integer values of the date
        val day = "${str[0]}${str[1]}".toInt()
        val month = "${str[3]}${str[4]}".toInt()
        val year = str.substring(str.length - 4).toInt()
        Log.i("Day Month Year", "$day $month $year")

        // Day, month or year cannot be 0
        if ( day == 0 || month == 0 || year == 0) {
            Log.i("Invalid Date 1", "$year, $month, $day")
            errorMsg = "Invalid Date"
            return false
        }

        // Handling February
        if (month == 2) {
            if (year % 4 != 0) {
                if (day > 28) {
                    Log.i("Invalid Date 2", "$year, $month, $day")
                    errorMsg = "Invalid Date"
                    return false
                }
            }
            else {
                if (day > 29) {
                    Log.i("Invalid Date 3", "$year, $month, $day")
                    errorMsg = "Invalid Date"
                    return false
                }
            }
        }

        // Handling Day Inputs based on the length of the month
        if (LONG_MONTHS.contains(month) && day > 31) {
            Log.i("Invalid Date 4", "$year, $month, $day")
            errorMsg = "Invalid Date"
            return false
        }

        if (SHORT_MONTHS.contains(month) && day > 30) {
            Log.i("Invalid Date 5", "$year, $month, $day")
            errorMsg = "Invalid Date"
            return false
        }

        // Handling Month Input
        if (month > 12) {
            Log.i("Invalid Date 6", "$year, $month, $day")
            errorMsg = "Invalid Date"
            return false
        }

        val currentYear = LocalDate.now().year
        val currentMonth = LocalDate.now().monthValue
        val currentDay = LocalDate.now().dayOfMonth
        if ( year > currentYear) {
            Log.i("Invalid Date 7", "$year, $month, $day")
            errorMsg = "Invalid Date"
            return false
        }
        if ( year == currentYear && month > currentMonth) {
            Log.i("Invalid Date 8", "$year, $month, $day")
            errorMsg = "Invalid Date"
            return false
        }
        if ( year == currentYear && month == currentMonth && day > currentDay) {
                Log.i("Invalid Date 9", "$year, $month, $day")
                errorMsg = "Invalid Date"
                return false
        }
        return true
    }

    @RequiresApi(Build.VERSION_CODES.O)
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_birth_date)

        val message = intent.getStringExtra(EXTRA_MESSAGE)

        birthDateTv = findViewById(R.id.birthDateEditText)
        nextButton = findViewById(R.id.birthDateNextButton)

        nextButton.setOnClickListener {
            val birthDate = birthDateTv.text.toString()
            val currentSurveyResult = "$message,Date of Birth: $birthDate"
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