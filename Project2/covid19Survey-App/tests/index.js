const wdio = require("webdriverio")
const assert = require("assert")

const opts = {
    path: '/wd/hub',
    port: 4723,
    capabilities: {
        platformName: "Android",
        platformVersion: "11",
        deviceName: "Emulator Pixel_3a_API_30_x86",
        app: "../app/build/outputs/apk/debug/app-debug.apk",
        appPackage: "com.example.covid19survey",
        appActivity: "MainActivity",
        automationName: "UiAutomator2"
    }
};

async function main () {
    const client = await wdio.remote(opts);

    // Sending keys
    const field = await client.$("android.widget.EditText");
    await field.setValue("Hello World");

    // Clicking a button
    const button = await client.$("android.widget.Button");
    button.click();

    const value = await field.getText();
    assert.strictEqual(value,"Hello World");

    await client.deleteSession();
}


/**
 * Only the Side Effects field can be empty.
 * This function will be used to test whether a field is empty.
 *  */ 
async function testEmptyField() {

}

/** 
 * Testing the Full Name Field
 * Case 1.1: Full name should start with an alphabetic character.
 * Case 1.2: Full name can only contain alphabetic characters and space in between words
 * */ 
async function testAlphabeticStart() {

}

/**
 * Testing the City Field
 * Case 2.1: City name should only contain alphabetic characters and spaces in between words
 */
async function testContainsOnlyAlphabetic() {

}


/**
 * Testing the Birth Date Field
 * Case 3.1: Birth date cannot be in the future
 * Invalid input is not tested, since the app only allows for input type of Date
 */
async function invalidBirthDate() {

}

/**
 * Testing the Gender Field
 * Case 4.1: Gender name cannot start with leading spaces
 */
async function testLeadingSpaces(){

}

/**
 * Testing the full app.
 * Case 5: Submit button should appear when each field contains valid input.
 */
async function testSubmitButtonAppears(){

}


main();