import 'package:flutter/material.dart';
import 'package:queryy/components/ButtonComponent.dart';
import 'package:queryy/components/constants.dart';
import 'package:queryy/components/size_config.dart';
import 'package:queryy/screens/authenticate/components/build_form_field.dart';
import 'package:queryy/screens/authenticate/components/form_error.dart';
import 'package:queryy/screens/authenticate/components/keyboard.dart';
import 'package:queryy/screens/authenticate/login/forgot_password.dart';
import 'package:queryy/screens/services/auth.dart';

import '../../start.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(30)),
          BuildFormField(
            obscure: false,
            onSave: (value){

            },
            validate: (value) {

            },
            onChange: (value) {

            },
            label: "Email",
            hint: 'Enter your email',
            image: 'assets/icons/Mail.svg',
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          BuildFormField(
            obscure: true,
            onSave: (newValue) {

            },
            validate: (value) {

            },
            onChange: (value) {

            },
            label: "Password",
            hint: "Enter your password",
            image: "assets/icons/Lock.svg",
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, ForgotPassword.id),
                child: Text(
                  "Forgot Password",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: kPrimaryColor),
                ),
              )
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          ButtonComponent(
            text: "Login",
            press: () async {
                  Navigator.pushNamed(context, Start.id);
              },
            buttonWidth: 350,
            fontSizeLength: 20,
            buttonHeight: 50,
            textColor: Colors.white,
            borderColor: Colors.transparent,
            backColor: kPrimaryColor,
          ),
        ],
      ),
    );
  }
}
