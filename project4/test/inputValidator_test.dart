import 'package:flutter_test/flutter_test.dart';
import 'package:project4/utils/inputValidator.dart';

// Username & Password is 8-20 Characters long
// no _ or . at the beginning
// no __ or _. or ._ or .. inside
// Allowed Characters: [a-zA-Z0-9._]
// no _ or . at the end
void main() {
  group('User Credentials Validator Tests', () {
    test('Username & Password is 8-20 Characters long', () {
      String s1 = "ata";
      String s2 =
          "ataatasoyataatasoyataatasoyataatasoyataatasoyataatasoyataatasoyataatasoyataatasoy";
      bool b1 = validateUserCredentials(s1);
      bool b2 = validateUserCredentials(s2);

      expect(b1, false);
      expect(b2, false);
    });
    test('no _ or . at the beginning', () {
      String s1 = ".ataatasoy";
      String s2 = "_ataatasoy";
      bool b1 = validateUserCredentials(s1);
      bool b2 = validateUserCredentials(s2);

      expect(b1, false);
      expect(b2, false);
    });
    test('no __ or _. or ._ or .. inside', () {
      String s1 = "ata__atasoy";
      String s2 = "ata._atasoy";
      String s3 = "ata_.atasoy";
      String s4 = "ata..atasoy";

      bool b1 = validateUserCredentials(s1);
      bool b2 = validateUserCredentials(s2);
      bool b3 = validateUserCredentials(s3);
      bool b4 = validateUserCredentials(s4);

      expect(b1, false);
      expect(b2, false);
      expect(b3, false);
      expect(b4, false);
    });
    test('Allowed Characters: [a-zA-Z0-9._]', () {
      String s1 = "ata.atas0y";
      String s2 = "ata_at4soy";

      bool b1 = validateUserCredentials(s1);
      bool b2 = validateUserCredentials(s2);

      expect(b1, true);
      expect(b2, true);
    });
    test('no _ or . at the end', () {
      String s1 = "ataatasoy.";
      String s2 = "ataatasoy_";

      bool b1 = validateUserCredentials(s1);
      bool b2 = validateUserCredentials(s2);

      expect(b1, false);
      expect(b2, false);
    });
  });
  group('Email Input Tests', () {
    test('should not be empty', () {
      String s1 = "";

      bool b1 = validateEmailInput(s1);

      expect(b1, false);
    });
    test(
        'should be in the form of <alphanumeric.-_>@<alphanumeric>.<alphanumeric>',
        () {
      String s1 = "valid-9email*?@email.com";
      String s2 = "444@email.com";
      String s3 = "444@444_co44m_.com";
      String s4 = "????????_.+*^";

      bool b1 = validateEmailInput(s1);
      bool b2 = validateEmailInput(s2);
      bool b3 = validateEmailInput(s3);
      bool b4 = validateEmailInput(s4);

      expect(b1, true);
      expect(b2, true);
      expect(b3, false);
      expect(b4, false);
    });
  });
  group('Name Validator Tests', () {
    test('Cannot contain special characters', () {
      String s1 = "Ata ?? Atasoy";
      bool b1 = validateNameInput(s1);
      expect(b1, false);
    });

    test('Cannot start with leading spaces', () {
      String s1 = " Ata Atasoy";
      bool b1 = validateNameInput(s1);
      expect(b1, false);
    });

    test('Cannot contain numbers', () {
      String s1 = "Ata 4Atasoy";
      bool b1 = validateNameInput(s1);
      expect(b1, false);
    });
  });
}
