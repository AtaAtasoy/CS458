/**
 * 
 * async function navigateToBirthDate(client) {
    //const client = await wdio.remote(opts)

    // Sending keys
    const field = await client.$("android.widget.EditText");
    await field.setValue("Ata Atasoy");

    // Clicking a button
    const button = await client.$("android.widget.Button");
    await button.click();

    // Sending keys
    await field.setValue("Trabzon");

    // Clicking a button
    await button.click();
    return client
}

 */

const wdio = require("webdriverio")
const assert = require("assert");


const opts = {
    path: '/wd/hub',
    port: 4723,
    capabilities: {
        platformName: "Android",
        platformVersion: "11",
        deviceName: "Pixel_4a_API_30",
        app: "../app/build/outputs/apk/debug/app-debug.apk",
        appPackage: "com.example.covid19survey",
        appActivity: "MainActivity",
        automationName: "UiAutomator2"
    }
};


async function testInvalidBirthDate() {
    const client = await wdio.remote(opts)

    // Skip the name page
    const nameField = await client.$("android.widget.EditText");
    await nameField.setValue("Ata Atasoy")
    const nameSubmitButton = await client.$("android.widget.Button");
    await nameSubmitButton.click();

    client.setImplicitTimeout(3000);

    // Skip the city page
    const cityField = await client.$("android.widget.EditText")
    await cityField.setValue("Trabzon");
    const citySubmitButton = await client.$("android.widget.Button");
    await citySubmitButton.click();

    client.setImplicitTimeout(3000);

    // Send date input
    const dateField = await client.$("android.widget.EditText")
    await dateField.setValue("14-02-2000")
    const dateSendButton = await client.$("android.widget.Button")
    await dateSendButton.click();

    client.setImplicitTimeout(2000);

    var toastMessage = await client.$('//android.widget.Toast')
    var value = await toastMessage.getAttribute("text")

    await client.deleteSession();
    return assert.strictEqual(value, "Date must be in form of dd/mm/yyyy or dd.mm.yyyy")
}

async function testFutureDate() {
    const client = await wdio.remote(opts)

    // Skip the name page
    const nameField = await client.$("android.widget.EditText");
    await nameField.setValue("Ata Atasoy")
    const nameSubmitButton = await client.$("android.widget.Button");
    await nameSubmitButton.click();

    client.setImplicitTimeout(3000);

    // Skip the city page
    const cityField = await client.$("android.widget.EditText")
    await cityField.setValue("Trabzon");
    const citySubmitButton = await client.$("android.widget.Button");
    await citySubmitButton.click();

    client.setImplicitTimeout(3000);

    // Send date input
    const dateField = await client.$("android.widget.EditText")
    await dateField.setValue("14.02.2050")
    const dateSendButton = await client.$("android.widget.Button")
    await dateSendButton.click();

    client.setImplicitTimeout(2000);

    var toastMessage = await client.$('//android.widget.Toast')
    var value = await toastMessage.getAttribute("text")

    await client.deleteSession();
    return assert.strictEqual(value, "Invalid Date")
}

async function testNonLeapYearInvalidDay() {
    const client = await wdio.remote(opts)

    // Skip the name page
    const nameField = await client.$("android.widget.EditText");
    await nameField.setValue("Ata Atasoy")
    const nameSubmitButton = await client.$("android.widget.Button");
    await nameSubmitButton.click();

    client.setImplicitTimeout(3000);

    // Skip the city page
    const cityField = await client.$("android.widget.EditText")
    await cityField.setValue("Trabzon");
    const citySubmitButton = await client.$("android.widget.Button");
    await citySubmitButton.click();

    client.setImplicitTimeout(3000);

    // Send date input
    const dateField = await client.$("android.widget.EditText")
    await dateField.setValue("29.02.2021")
    const dateSendButton = await client.$("android.widget.Button")
    await dateSendButton.click();

    client.setImplicitTimeout(2000);

    var toastMessage = await client.$('//android.widget.Toast')
    var value = await toastMessage.getAttribute("text")

    await client.deleteSession();
    return assert.strictEqual(value, "Invalid Date")
}

async function testLongMonthInvalidDay() {
    const client = await wdio.remote(opts)

    // Skip the name page
    const nameField = await client.$("android.widget.EditText");
    await nameField.setValue("Ata Atasoy")
    const nameSubmitButton = await client.$("android.widget.Button");
    await nameSubmitButton.click();

    client.setImplicitTimeout(3000);

    // Skip the city page
    const cityField = await client.$("android.widget.EditText")
    await cityField.setValue("Trabzon");
    const citySubmitButton = await client.$("android.widget.Button");
    await citySubmitButton.click();

    client.setImplicitTimeout(3000);

    // Send date input
    const dateField = await client.$("android.widget.EditText")
    await dateField.setValue("32.03.2021")
    const dateSendButton = await client.$("android.widget.Button")
    await dateSendButton.click();

    client.setImplicitTimeout(2000);

    var toastMessage = await client.$('//android.widget.Toast')
    var value = await toastMessage.getAttribute("text")

    await client.deleteSession();
    return assert.strictEqual(value, "Invalid Date")
}

async function testShortMonthInvalidDay() {
    const client = await wdio.remote(opts)

    // Skip the name page
    const nameField = await client.$("android.widget.EditText");
    await nameField.setValue("Ata Atasoy")
    const nameSubmitButton = await client.$("android.widget.Button");
    await nameSubmitButton.click();

    client.setImplicitTimeout(3000);

    // Skip the city page
    const cityField = await client.$("android.widget.EditText")
    await cityField.setValue("Trabzon");
    const citySubmitButton = await client.$("android.widget.Button");
    await citySubmitButton.click();

    client.setImplicitTimeout(3000);

    // Send date input
    const dateField = await client.$("android.widget.EditText")
    await dateField.setValue("31.04.2021")
    const dateSendButton = await client.$("android.widget.Button")
    await dateSendButton.click();

    client.setImplicitTimeout(2000);

    var toastMessage = await client.$('//android.widget.Toast')
    var value = await toastMessage.getAttribute("text")

    await client.deleteSession();
    return assert.strictEqual(value, "Invalid Date")
}

async function testInvalidMonth() {
    const client = await wdio.remote(opts)

    // Skip the name page
    const nameField = await client.$("android.widget.EditText");
    await nameField.setValue("Ata Atasoy")
    const nameSubmitButton = await client.$("android.widget.Button");
    await nameSubmitButton.click();

    client.setImplicitTimeout(3000);

    // Skip the city page
    const cityField = await client.$("android.widget.EditText")
    await cityField.setValue("Trabzon");
    const citySubmitButton = await client.$("android.widget.Button");
    await citySubmitButton.click();

    client.setImplicitTimeout(3000);

    // Send date input
    const dateField = await client.$("android.widget.EditText")
    await dateField.setValue("30.13.2021")
    const dateSendButton = await client.$("android.widget.Button")
    await dateSendButton.click();

    client.setImplicitTimeout(2000);

    var toastMessage = await client.$('//android.widget.Toast')
    var value = await toastMessage.getAttribute("text")

    await client.deleteSession();
    return assert.strictEqual(value, "Invalid Date")
}

async function testZeroValues() {
    const client = await wdio.remote(opts)

    // Skip the name page
    const nameField = await client.$("android.widget.EditText");
    await nameField.setValue("Ata Atasoy")
    const nameSubmitButton = await client.$("android.widget.Button");
    await nameSubmitButton.click();

    client.setImplicitTimeout(3000);

    // Skip the city page
    const cityField = await client.$("android.widget.EditText")
    await cityField.setValue("Trabzon");
    const citySubmitButton = await client.$("android.widget.Button");
    await citySubmitButton.click();

    client.setImplicitTimeout(3000);

    // Send date input
    const dateField = await client.$("android.widget.EditText")
    await dateField.setValue("00.00.0000")
    const dateSendButton = await client.$("android.widget.Button")
    await dateSendButton.click();

    client.setImplicitTimeout(2000);

    var toastMessage = await client.$('//android.widget.Toast')
    var value = await toastMessage.getAttribute("text")

    await client.deleteSession();
    return assert.strictEqual(value, "Invalid Date")
}

module.exports = {testInvalidBirthDate, testFutureDate, testNonLeapYearInvalidDay, 
                    testLongMonthInvalidDay, testShortMonthInvalidDay, testInvalidMonth, testZeroValues}