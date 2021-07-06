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

async function testSubmitButtonAppears() {
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

    // Skip birth date page
    const birthDateField = await client.$("android.widget.EditText")
    await birthDateField.setValue("14.02.2000");
    const birthDateSubmitButton = await client.$("android.widget.Button");
    await birthDateSubmitButton.click();

    client.setImplicitTimeout(3000);

    // Skip gender page
    const genderField = await client.$("android.widget.EditText")
    await genderField.setValue("Male");
    const genderSubmitButton = await client.$("android.widget.Button");
    await genderSubmitButton.click();

    await client.setImplicitTimeout(3000);

    // Choose Biontech 
    const biontechButton = await client.$("(//*[contains(@class,'RadioButton')])[2]")
    biontechButton.click()
    const vaccineSubmitButton = await client.$("android.widget.Button");
    await vaccineSubmitButton.click()

    await client.setImplicitTimeout(3000);

    // Skip side effects page
    const sideEffectsField = await client.$("android.widget.EditText")
    await sideEffectsField.setValue("None");
    const sideEffectsSubmitButton = await client.$("android.widget.Button");
    await sideEffectsSubmitButton.click();

    await client.setImplicitTimeout(3000);

    // Check if Vaccine Type is Listed as Biontech
    const submitSurveyButton = await client.$("android.widget.Button")
    const submitButtonText = await submitSurveyButton.getText()

    console.log(submitButtonText)
    await client.setImplicitTimeout(3000);

    await client.deleteSession()
    return assert.strictEqual(submitButtonText, "SUBMIT")
}

module.exports = {testSubmitButtonAppears}