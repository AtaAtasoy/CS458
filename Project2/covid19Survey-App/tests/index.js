const utils = require("./utils.js")

/** 
 * Case 1: Testing the Full Name Field
 * Case 1.1: Full name should start with an alphabetic character.
 * Case 1.1.1: Cannot start with leading spaces
 * Case 1.1.2: Cannot start with numericals or speacial characters
 * Case 1.2: Full name can only contain alphabetic characters and space in between words
 * Case 1.3: Full name cannot be empty
 * */
function testNameField() {
    utils.testLeadingSpaces()
    .then(() => console.log("CASE 1.1.1 SUCCESSFUL"))
    .then(() => utils.testAlphabeticStart())
    .then(() => console.log("CASE 1.1.2 SUCCESSFUL"))
    .then(() => utils.testContainsOnlyAlphabetic())
    .then(()=> console.log("CASE 1.2 SUCCESSFUL"))
    .then(() => utils.testEmptyField())
    .then(() => console.log("CASE 1.3 SUCCESSFUL")) 
    .catch((err) => console.log(err))   
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
 function testBirthDateField() {
    utils.navigateToBirthDate()
    // .then(() => utils.testFutureDate())
    // .then(()=> console.log("CASE 2.1 SUCCESSFUL"))
    .then(() => utils.testInvalidBirthDate())
    .then(()=> console.log("CASE 2.2 SUCCESSFUL"))
    // .then(() => utils.testLongMonthInvalidDay())
    // .then(()=> console.log("CASE 2.3.1 SUCCESSFUL"))
    // .then(() => utils.testShortMonthInvalidDay())
    // .then(()=> console.log("CASE 2.3.2 SUCCESSFUL"))
    // .then(() => utils.testNonLeapYearInvalidDay())
    // .then(()=> console.log("CASE 2.4 SUCCESSFUL"))
    // .then(() => utils.testInvalidMonth())
    // .then(()=> console.log("CASE 2.5 SUCCESSFUL"))
    // .then(() => utils.testZeroValues())
    // .then(()=> console.log("CASE 2.6 SUCCESSFUL"))
    .catch((err) => console.log(err))
}

/**
 * Case 3: Testing the Vaccine Selection Page
 * Case 3.1: Biontech selected
 * Case 3.2: Sinovac selected
 */
function testVaccineTypes() {
    utils.enterValidName()
    .then(() => utils.enterValidCity())
    .then(() => utils.enterValidGender())
}


/**
 * Case 4: Testing the Side Effects Field
 * Case 4.1: Side effects field cannot contain more than 1000 characters
 */

function testSideEffectsField() {

}

/**
 * Case 5: Submit button should appear when every field has valid input
 */
function testSubmitButtonAppears () {

}

//testNameField();
testBirthDateField();