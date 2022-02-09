import 'package:flutter/material.dart';
import 'package:flutter_auth/components/text_field_container.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Signup/components/background.dart';
import 'package:flutter_auth/Screens/Signup/components/or_divider.dart';
import 'package:flutter_auth/Screens/Signup/components/social_icon.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Body extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),

          TextFieldContainer(
            child: TextField(
                cursorColor: kPrimaryColor,
                controller: emailController,
                onChanged: (value) {},
                decoration: InputDecoration(
                  icon: Icon(Icons.person, color: kPrimaryColor),
                  border: InputBorder.none,
                  hintText: 'Email Address',
                ),
                ),
              ),
            TextFieldContainer(
              child: TextField(
                cursorColor: kPrimaryColor,
                obscureText: true,
                controller: passwordController,
                onChanged: (value) {},
                decoration: InputDecoration(
                  icon: Icon(Icons.person, color: kPrimaryColor),
                  border: InputBorder.none,
                  hintText: 'Password',
                ),
              ),
            ),

            RoundedButton(
              text: "SIGNUP",
              press: () async {
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: emailController.text,
                  password: passwordController.text,
                );
             //   setState(({}));
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginScreen();
                        },
                      ),
                    );
                  },
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginScreen();
                        },
                      ),
                    );
                  },
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginScreen();
                        },
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
