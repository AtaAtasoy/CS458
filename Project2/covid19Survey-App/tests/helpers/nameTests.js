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


module.exports = { testEmptyField, testContainsOnlyAlphabetic, testAlphabeticStart, testLeadingSpaces}