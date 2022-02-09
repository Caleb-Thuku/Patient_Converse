import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/HomePage/home_page.dart';
import 'package:flutter_auth/Screens/Login/components/background.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/text_field_container.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Body extends StatelessWidget {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
 /* const Body({
    Key key,
  }) : super(key: key);
*/


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),

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
              text: "LOGIN",
              press: () async {
                await FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: emailController.text,
                  password: passwordController.text,
                );
                var user = FirebaseAuth.instance.currentUser;
                if(user == null){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                }
                else{
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HomePage();
                      },
                    ),
                  );
                }
              }
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
