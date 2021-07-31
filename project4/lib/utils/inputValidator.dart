bool validateNameInput(fullName) {
  RegExp fullNameRegex = RegExp(r'[a-zA-Z][a-zA-Z ]+');

  return fullNameRegex.hasMatch(fullName);
}

bool validateEmailInput(email) {
  Pattern pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";

  RegExp regex = new RegExp(pattern.toString());
  if (!regex.hasMatch(email) || email == null)
    return false;
  else
    return true;
}

// Username & Password is 8-20 Characters long
// no _ or . at the beginning
// no __ or _. or ._ or .. inside 
// Allowed Characters: [a-zA-Z0-9._]
// no _ or . at the end

bool validateUserCredentials(input) {
  RegExp usernameRegex =
      RegExp(r'^(?=.{8,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$');

  return usernameRegex.hasMatch(input);
}
