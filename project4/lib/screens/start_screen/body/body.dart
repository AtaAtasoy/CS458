import 'package:flutter/material.dart';
import 'package:project4/screens/sign_in/sign_in_screen.dart';
import 'package:project4/screens/sign_up/sign_up_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: (20)),
          child: SingleChildScrollView(
            child: Column(
              children: [

                SizedBox(height: 150,),
                ElevatedButton(
                  onPressed: () {Navigator.pushNamed(context, SignInScreen.routeName);}, 
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF00a79B),
                    textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
        
                  ),),
                  child: Text('Sign In')),

                  SizedBox(height: 50,),

                  ElevatedButton(
                  onPressed: () {Navigator.pushNamed(context, SignUpScreen.routeName);}, 

                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF00a79B),
                    textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
        
                  ),),
                  child: Text('Sign Up')),

                
             
                
                
                
              ],
            ),
          ),
        ),
      ),
    );
  } }