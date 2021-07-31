import 'package:flutter/material.dart';
import 'package:project4/screens/sign_in/sign_in_screen.dart';
import 'package:project4/utils/authentication.dart';
import 'package:project4/utils/inputValidator.dart';

class SignUpScreen extends StatefulWidget {
  static String routeName = "/sign_up";
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  bool userNotExists = true;
  bool validCredentials = true;
  bool validEmail = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00a79B),
        title: Text("Sign Up"),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                IconButton(icon: Icon(Icons.person), onPressed: null),
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(right: 20, left: 10),
                        child: TextField(
                          controller: usernameController,
                          decoration: InputDecoration(hintText: 'Username'),
                        )))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                IconButton(icon: Icon(Icons.lock), onPressed: null),
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(right: 20, left: 10),
                        child: TextField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: InputDecoration(hintText: 'Password'),
                        )))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                IconButton(icon: Icon(Icons.mail), onPressed: null),
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(right: 20, left: 10),
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(hintText: 'Email'),
                        )))
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Radio(value: null, groupValue: null, onChanged: null),
                RichText(
                    text: TextSpan(
                        text: 'I have accepted the',
                        style: TextStyle(color: Colors.black),
                        children: [
                      TextSpan(
                          text: 'Terms & Condition',
                          style: TextStyle(
                              color: Colors.teal, fontWeight: FontWeight.bold))
                    ]))
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    _isValidInput();
                    if (validCredentials && validEmail && userNotExists) {
                      Navigator.pushNamed(context, SignInScreen.routeName);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(0, 167, 155, 1.0)),
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
          if (!userNotExists)
            Text("User already exists!", textAlign: TextAlign.center),
          if (!validCredentials)
            Text(
                "Username & Password is 8-20 Characters long.\n No _ or . at the beginning.\n no __ or _. or ._ or .. inside.\nAllowed Characters: [a-zA-Z0-9._].\nno _ or . at the end",
                textAlign: TextAlign.center),
          if (!validEmail)
            Text("Invalid email address!", textAlign: TextAlign.center)
        ],
      ),
    );
  }

  _isValidInput() {
    setState(() {
      validEmail = validateEmailInput(emailController.text);
      validCredentials = validateUserCredentials(usernameController.text) &&
          validateUserCredentials(passwordController.text);
    });
    if (validEmail && validCredentials) {
      setState(() {
        userNotExists = signUp(usernameController.text, passwordController.text,
            emailController.text);
      });
    }
  }
}

@override
Widget build(BuildContext context) {
  return Container(
    height: 200,
    decoration:
        BoxDecoration(image: DecorationImage(image: AssetImage('virus.jpeg'))),
    child: Positioned(
        child: Stack(
      children: <Widget>[
        Positioned(
            top: 20,
            child: Row(
              children: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                Text(
                  'Back',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )
              ],
            )),
        Positioned(
          bottom: 20,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Create New Account',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
        )
      ],
    )),
  );
}
