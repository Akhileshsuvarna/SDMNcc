import 'package:flutter/material.dart';
import 'package:sdmncc/View/SigninForm.dart';
// import 'package:sdmncc/Controllers/SizeConfig.dart';
import 'package:sdmncc/View/SocialCard.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding:
            EdgeInsets.symmetric(horizontal:20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Text(
                    "Welcome",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ), SizedBox(height: 10),
                  Text(
                    "Sign in to Proceed",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height:08),
                  SignForm(),
                  SizedBox(height:08),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     SocalCard(
                  //       icon: Icons.golf_course,
                  //       press: () {},
                  //     ),
                  //     SocalCard(
                  //       icon: Icons.facebook,
                  //       press: () {},
                  //     ),
                  //     SocalCard(
                  //       icon: Icons.mail_outline,
                  //       press: () {},
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(height:20),
                  // NoAccountText(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}