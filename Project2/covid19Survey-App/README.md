# Project 2 - MOBILE TEST AUTOMATION WITH APPIUM

## Report

[link](https://docs.google.com/document/d/1oAke395yUdtRImRBgVgQsuZqAdqIvPyuDhl9dZNsn-o/edit?usp=sharing)

## Requirements

### Kotlin, Android Studio

The App was developed using Kotlin and testen on an Android Virtual Device (AVD). Android Studio takes care of such dependencies after its installation. Download Android Studio [here](https://developer.android.com/studio?gclid=CjwKCAjw_o-HBhAsEiwANqYhpyad33coelXz2-gj2MyfeJvCyGlFMmxQLgioQw8YO-qSXNiSaOEp1xoCCDYQAvD_BwE&gclsrc=aw.ds)

### Node & Appium

[Download Nodejs](https://nodejs.org/en/download/)

```bash
$npm install -g appium
```

### Other dependencies

```bash
$npm install
```

### Run the program

Build & Launch the App from Android Studio. Choose Pixel 4a with Android v11 as your device.
Change your directory to `tests`

```bash
appium # Launch the appium server
```

```bash
node index.js # Start the app from another terminal
```

### Notes

The output of the test cases will be in `output.log` under the `tests` directory.
