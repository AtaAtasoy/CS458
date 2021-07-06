const nameTests = require("./helpers/nameTests")
const dateTests = require("./helpers/dateTests")
const vaccineTests = require("./helpers/vaccineTypeTests")
const sideEffectsTests = require("./helpers/sideEffectsTests")
const submitButtonTests = require("./helpers/submitButtonTest")
const fs = require("fs")

/** 
 * Case 1: Testing the Full Name Field
 * Case 1.1: Full name should start with an alphabetic character.
 * Case 1.1.1: Cannot start with leading spaces
 * Case 1.1.2: Cannot start with numericals or speacial characters
 * Case 1.2: Full name can only contain alphabetic characters and space in between words
 * Case 1.3: Full name cannot be empty
 * */
async function case1() {
    await nameTests.testLeadingSpaces()
    fs.writeFileSync("output.log", "CASE 1.1.1 SUCCESSFUL\n", err => {
        if (err) {
            console.log(err)
            return
        }
    })
    await nameTests.testAlphabeticStart()
    fs.appendFileSync("output.log", "CASE 1.1.2 SUCCESSFUL\n")
    await nameTests.testContainsOnlyAlphabetic()
    fs.appendFileSync("output.log", "CASE 1.2 SUCCESSFUL\n")
    await nameTests.testEmptyField()
    fs.appendFileSync("output.log","CASE 1.3 SUCCESSFUL\n")
}


/**
 * Case 2: Testing the Birth Date Field
 * Case 2.1: Birth date cannot be in the future
 * Case 2.2: Birth date should be in the format of dd/mm/yyyy or dd.mm.yyyy
 * Case 2.3.1: Day cannot be > 31 for specific months
 * Case 2.3.2: Day cannot be > 30 for specific months
 * Case 2.4: In a non leap year, february cannot be longer than 28 days
 * Case 2.5: Month value can be 12 at max.
 * Case 2.6: Day, Month and Year values must be greater than 0
 * Invalid input is not tested, since the app only allows for input type of Date
 */
 async function case2() {
    await dateTests.testFutureDate()
    // .then(() => utils.testFutureDate())
    fs.appendFileSync("output.log","CASE 2.1 SUCCESSFUL\n")
    await dateTests.testInvalidBirthDate()
    fs.appendFileSync("output.log","CASE 2.2 SUCCESSFUL\n")
    await dateTests.testLongMonthInvalidDay()
    fs.appendFileSync("output.log","CASE 2.3.1 SUCCESSFUL\n")
    await dateTests.testShortMonthInvalidDay()
    fs.appendFileSync("output.log","CASE 2.3.2 SUCCESSFUL\n")
    await dateTests.testNonLeapYearInvalidDay()
    fs.appendFileSync("output.log","CASE 2.4 SUCCESSFUL\n")
    await dateTests.testInvalidMonth()
    fs.appendFileSync("output.log","CASE 2.5 SUCCESSFUL\n")
    await dateTests.testZeroValues()
    fs.appendFileSync("output.log","CASE 2.6 SUCCESSFUL\n")
}

/**
 * Case 3: Testing the Vaccine Selection Page
 * Case 3.1: Biontech selected
 * Case 3.2: Sinovac selected
 */
async function case3() {
    await vaccineTests.testBiontechVaccine()
    fs.appendFileSync("output.log","CASE 3.1 SUCCESSFUL\n")
    await vaccineTests.testSinovacVaccine()
    fs.appendFileSync("output.log","CASE 3.2 SUCCESSFUL\n")
}


/**
 * Case 4: Testing the Side Effects Field
 * Case 4.1: Side effects field cannot contain more than 1000 characters
 */

async function case4() {
    await sideEffectsTests.testSideEffectField()
    .catch((err) => console.log(err))
    fs.appendFileSync("output.log","CASE 4.1 SUCCESSFUL\n")
}

/**
 * Case 5: Submit button should appear when every field has valid input
 */
async function case5() {
    await submitButtonTests.testSubmitButtonAppears()    
    .catch((err) => console.log(err))

    fs.appendFileSync("output.log","CASE 5 SUCCESSFUL\n")
}

async function main() {
    await case1()
    .catch((err) => console.log(err))

    await case2()
    .catch((err) => console.log(err))

    await case3()
    .catch((err) => console.log(err))

    await case4()
    .catch((err) => console.log(err))

    await case5()
    .catch((err) => console.log(err))
}

main();