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

async function testEmptyField() {
    const client = await wdio.remote(opts);

    // Sending keys
    const field = await client.$("android.widget.EditText");

    // Clicking a button
    const button = await client.$("android.widget.Button");
    await button.click();

    client.setImplicitTimeout(5000);

    var toastMessage = await client.$('//android.widget.Toast')
    var value = await toastMessage.getAttribute("text")


    await client.deleteSession();
    return assert.strictEqual(value, "Field cannot be empty")
}

async function testAlphabeticStart() {
    const client = await wdio.remote(opts);

    // Sending keys
    const field = await client.$("android.widget.EditText");
    await field.setValue("999Ata Atasoy");

    // Clicking a button
    const button = await client.$("android.widget.Button");
    await button.click();

    client.setImplicitTimeout(5000);

    var toastMessage = await client.$('//android.widget.Toast')
    var value = await toastMessage.getAttribute("text")


    await client.deleteSession();
    return assert.strictEqual(value, "Name should only contain alphabetic characters and spaces" + 
                                        " and start with an alphabetic character")
}


async function testLeadingSpaces() {
    const client = await wdio.remote(opts);

    // Sending keys
    const field = await client.$("android.widget.EditText");
    await field.setValue("  Ata Atasoy");

    // Clicking a button
    const button = await client.$("android.widget.Button");
    await button.click();

    client.setImplicitTimeout(5000);

    var toastMessage = await client.$('//android.widget.Toast')
    var value = await toastMessage.getAttribute("text")


    await client.deleteSession();
    return assert.strictEqual(value, "Name should only contain alphabetic characters and spaces" + 
                                        " and start with an alphabetic character")
}


async function testContainsOnlyAlphabetic() {
    const client = await wdio.remote(opts);

    // Sending keys
    const field = await client.$("android.widget.EditText");
    await field.setValue("Ata-Atasoy? Test.");

    // Clicking a button
    const button = await client.$("android.widget.Button");
    await button.click();

    client.setImplicitTimeout(5000);

    var toastMessage = await client.$('//android.widget.Toast')
    var value = await toastMessage.getAttribute("text")


    await client.deleteSession();
    return assert.strictEqual(value, "Name should only contain alphabetic characters and spaces" + 
                                        " and start with an alphabetic character")
}


async function testInvalidBirthDate() {
    const client = await wdio.remote(opts)

    // Sending keys
    const field = await client.$("android.widget.EditText");
    await field.setValue("14-02-2000");

    // Clicking a button
    const button = await client.$("android.widget.Button");
    await button.click();

    client.setImplicitTimeout(5000);

    var toastMessage = await client.$('//android.widget.Toast')
    var value = await toastMessage.getAttribute("text")

    return assert.strictEqual(value, "Date must be in form of dd/mm/yyyy or dd.mm.yyyy")
}

async function testFutureDate() {
    const client = await wdio.remote(opts);

    // Sending keys
    const field = await client.$("android.widget.EditText");
    await field.setValue("14.02.2031");

    // Clicking a button
    const button = await client.$("android.widget.Button");
    await button.click();

    client.setImplicitTimeout(5000);

    var toastMessage = await client.$('//android.widget.Toast')
    var value = await toastMessage.getAttribute("text")

    client.setImplicitTimeout(5000);

    return assert.strictEqual(value, "Invalid Date")
}

async function testNonLeapYearInvalidDay() {
    const client = await wdio.remote(opts);

    // Sending keys
    const field = await client.$("android.widget.EditText");
    await field.setValue("28-02-2001");

    // Clicking a button
    const button = await client.$("android.widget.Button");
    await button.click();

    client.setImplicitTimeout(5000);

    var toastMessage = await client.$('//android.widget.Toast')
    var value = await toastMessage.getAttribute("text")

    client.setImplicitTimeout(5000);

    return assert.strictEqual(value, "Invalid Date")
}

async function testLongMonthInvalidDay() {
    const client = await wdio.remote(opts);

    // Sending keys
    const field = await client.$("android.widget.EditText");
    await field.setValue("32-03-2000");

    // Clicking a button
    const button = await client.$("android.widget.Button");
    await button.click();

    client.setImplicitTimeout(5000);

    var toastMessage = await client.$('//android.widget.Toast')
    var value = await toastMessage.getAttribute("text")

    client.setImplicitTimeout(5000);

    return assert.strictEqual(value, "Invalid Date")
}

async function testShortMonthInvalidDay() {
    const client = await wdio.remote(opts);

    // Sending keys
    const field = await client.$("android.widget.EditText");
    await field.setValue("31-04-2000");

    // Clicking a button
    const button = await client.$("android.widget.Button");
    await button.click();

    client.setImplicitTimeout(5000);

    var toastMessage = await client.$('//android.widget.Toast')
    var value = await toastMessage.getAttribute("text")

    client.setImplicitTimeout(5000);

    return assert.strictEqual(value, "Invalid Date")
}

async function testInvalidMonth() {
    const client = await wdio.remote(opts);

    // Sending keys
    const field = await client.$("android.widget.EditText");
    await field.setValue("14.15.2000");

    // Clicking a button
    const button = await client.$("android.widget.Button");
    await button.click();

    client.setImplicitTimeout(5000);

    var toastMessage = await client.$('//android.widget.Toast')
    var value = await toastMessage.getAttribute("text")

    client.setImplicitTimeout(5000);

    return assert.strictEqual(value, "Invalid Date")
} 

async function testZeroValues() {
    const client = await wdio.remote(opts);

    // Sending keys
    const field = await client.$("android.widget.EditText");
    await field.setValue("0.15.2000");

    // Clicking a button
    const button = await client.$("android.widget.Button");
    await button.click();

    client.setImplicitTimeout(5000);

    var toastMessage = await client.$('//android.widget.Toast')
    var value = await toastMessage.getAttribute("text")
    
    client.setImplicitTimeout(5000);
    assert.strictEqual(value, "Invalid Date")

    await field.setValue("10.00.2000");
    await button.click();
    client.setImplicitTimeout(5000);
    assert.strictEqual(value, "Invalid Date")


    await field.setValue("10.10.0000");
    await button.click();
    client.setImplicitTimeout(5000);
    
    await client.deleteSession();
    return assert.strictEqual(value, "Invalid Date")
}


async function enterValidInputs() {
    navigateToCity()
    .then(() => navigateToBirthDate())
    .then(() => navigateToGender())
    .then(() => enterValidGender())
    .then(() => chooseVaccine())
    .then(() => enterValidSideEffects())
    //.then() click submit
}


// Navigation Order: Name, City, Date of Birth, Gender, Vaccine, Side Effects, Review

async function navigateToCity() {
    const client = await wdio.remote(opts)

    // Sending keys
    const field = await client.$("android.widget.EditText");
    await field.setValue("Ata Atasoy");

    // Clicking a button
    const button = await client.$("android.widget.Button");
    await button.click();
}

async function navigateToBirthDate(client) {
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

async function navigateToGender() {
    const client = await wdio.remote(opts)

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

    // Sending keys
    await field.setValue("14.02.2000");

    // Clicking a button
    await button.click();
}

async function navigateToVaccineType() {
    const client = await wdio.remote(opts)

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

    // Sending keys
    await field.setValue("14.02.2000");

    // Clicking a button
    await button.click();

    // Sending keys
    await field.setValue("male");

    // Clicking a button
    await button.click();
}

async function navigateToSideEffects(vaccineName) {
    const client = await wdio.remote(opts)

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
    // Sending keys
    await field.setValue("14.02.2000");

    // Clicking a button
    await button.click();

    // Sending keys    
    await field.setValue("male");
    // Clicking a button
    await button.click();

}

async function navigateToReview() {
    navigateToSideEffects();

    // Sending keys
    const field = await client.$("android.widget.EditText");
    await field.setValue("Mild shoulder pain");

    // Clicking a button
    const button = await client.$("android.widget.Button");
    await button.click();
}


module.exports = { testEmptyField, testContainsOnlyAlphabetic, testAlphabeticStart, testLeadingSpaces, testInvalidBirthDate,
                    testNonLeapYearInvalidDay, testLongMonthInvalidDay, testShortMonthInvalidDay, testInvalidMonth, testFutureDate, testZeroValues
                    ,navigateToCity, navigateToBirthDate, navigateToGender, navigateToVaccineType, navigateToSideEffects, navigateToReview}