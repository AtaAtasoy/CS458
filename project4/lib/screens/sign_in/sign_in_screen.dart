import 'package:flutter/material.dart';
import 'package:project4/screens/form_screen/form_screen.dart';
import 'package:project4/utils/authentication.dart';

class SignInScreen extends StatefulWidget {
  static String routeName = "/sign_in";
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool validCredentials = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00a79B),
        title: Text("Sign In"),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Container(
            height: 300,
          //   decoration: BoxDecoration(
          //       //image: DecorationImage(image: AssetImage('virus.jpeg'))),
          ),
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
                          decoration: InputDecoration(hintText: 'Username'),
                          controller: usernameController,
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
                        ))),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                height: 60,
                child: ElevatedButton(
                  key: Key('signIn-button'),
                  onPressed: () {
                    _isValidInput();
                    if (validCredentials) {
                      Navigator.pushNamed(context, FormScreen.routeName);
                    } 
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(0, 167, 155, 1.0)),
                  child: Text(
                    'SIGN IN',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'SignUp');
            },
            child: Center(
              child: RichText(
                text: TextSpan(
                    text: 'Don\'t have an account?',
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'SIGN UP',
                        style: TextStyle(
                            color: Colors.teal, fontWeight: FontWeight.bold),
                      )
                    ]),
              ),
            ),
          ),
          if (!validCredentials) Text("Invalid Credentials", textAlign: TextAlign.center)
        ],
      ),
    );
  }

  _isValidInput() {
    setState(() {
      validCredentials =
          signIn(usernameController.text, passwordController.text);
    });
  }
}
