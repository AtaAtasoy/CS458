package com.example.covid19survey

interface InputValidator {
    fun isValid(str: String): Boolean
}