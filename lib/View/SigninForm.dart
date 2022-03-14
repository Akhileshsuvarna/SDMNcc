import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sdmncc/Controllers/Themes.dart';
import 'package:sdmncc/Route/Routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _success=false;
  String? _userEmail;
  String? email;
  String? password;
  String? conform_password;
  bool remember = false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }
  void _register() async {
    final User? user = (await
    _auth.createUserWithEmailAndPassword(
      email: _idController.text,
      password: _passwordController.text,
    )
    ).user;
    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
      });
    } else {
      setState(() {
        _success = true;
      });
    }
  }
  Future signIn({required String email,required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      print(e);
      return e.message;

    }
  }
  Future signUp({required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
  void _signInWithEmailAndPassword() async {
    try {
      final User? user = (await _auth.signInWithEmailAndPassword(
        email: _idController.text,
        password: _passwordController.text,
      )).user;
      if (user != null) {
        setState(() {
          _success = true;
          _userEmail = user.email;
        });
      } else {
        setState(() {
          _success = false;
        });
      }
    }catch(error){
      print('error:$error');
    }

  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 40),
          buildEmailFormField(),
          const SizedBox(height: 30),
          buildPasswordFormField(),
          // SizedBox(height: 30),
          // buildConformPassFormField(),
          // FormError(errors: errors),
          const SizedBox(height: 80),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: TextButton(
              style: TextButton.styleFrom(
                shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                primary: Colors.white,
                backgroundColor: Themes.grey,
              ),
              onPressed: (){
                // if (_formKey.currentState.validate()) {
                //   _register();
                // _signInWithEmailAndPassword();
                // }
                // Get.toNamed(Routes.HOME);
                signIn(email: _idController.text, password: _passwordController.text)
                    .then((result) {
                  if (result == null) {
                    Get.toNamed(Routes.HOME);
                  } else {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text(
                        result,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ));
                  }
                });
              },
              child: const Text(
                'Continue',
                style: TextStyle(
                  fontSize:18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      controller: _passwordController,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        // if (value.isNotEmpty) {
        //   removeError(error: kPassNullError);
        // } else if (value.length >= 8) {
        //   removeError(error: kShortPassError);
        // }
        // password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "Enter Password";
        } else if (value.length < 8) {
          return "Your password Contains minimum 6 words";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.lock),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: _idController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        // if (value.isNotEmpty) {
        //   removeError(error: kEmailNullError);
        // } else if (emailValidatorRegExp.hasMatch(value)) {
        //   removeError(error: kInvalidEmailError);
        // }
        // return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          // addError(error: kEmailNullError);
          return "Please enter ID";
        }
          // else if (!emailValidatorRegExp.hasMatch(value)) {
        //   // addError(error: kInvalidEmailError);
        //   return "";
        // }
        return null;
      },
      decoration: InputDecoration(
        labelText: "ID",
        hintText: "Enter your ID",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.perm_identity),
      ),
    );
  }
}