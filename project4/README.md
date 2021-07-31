# Project4 - Unit Testing

![Coverage](./coverage_badge.svg?sanitize=true)

The Project was implemented using and tested using Flutter.

The code coverage was calculated using Flutter's own test library.

The script on `index.js` was used to generate the coveradge badge above.

The line coverage file is at `coverage/lcov.info`

## Instructions to Run the App/Tests

```bash
flutter pub get # Install dependencies
flutter test --coverage # Runs all the tests and outputs the line coverage
flutter run # Runs the app
```

## Generate LCOV HTML

```bash
brew install lcov # On Mac, probably "sudo apt-get lcov" on linux.
genhtml -o coverage coverage/lcov.info # Generates the HTML
open coverage/index.html # Opens the HTML file on your default browser
```

## Generate the Badge

```bash
yarn install 
node index.js
```
