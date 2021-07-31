import 'package:flutter_test/flutter_test.dart';
import 'package:project4/utils/authentication.dart';

void main() {
  group('Authentication Utils', () {
    test('Should not signup and existing user', () {
      var username = "ataatasoy";
      var password = "ataatasoy";
      var email = "ataatasoy@email.com";

      bool b1 = signUp(username, password, email);
      expect(b1, false);
    });

    test('Should not login with invalid username', () {
      var invalidUsername = "notausername";
      var invalidPassword = "notapassword";
      var validCredential = "ataatasoy";

      bool b1 = signIn(invalidUsername, validCredential);
      bool b2 = signIn(validCredential, invalidPassword);
      expect(b1, false);
      expect(b2, false);
    });
    test('Should signin with valid credentials', () {
      var validCredential = "ataatasoy";
      bool b1 = signIn(validCredential, validCredential);
      expect(b1, true);
    });
    test('Should signup with valid credentials', () {
      var username = "hataatasoy";
      var password = "hataatasoy";
      var email = "hataatasoy@email.com";

      bool b1 = signUp(username, password, email);
      expect(b1, true);
    });
  });
}
