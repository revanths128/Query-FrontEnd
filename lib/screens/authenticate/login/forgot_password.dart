import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:queryy/components/ButtonComponent.dart';
import 'package:queryy/components/constants.dart';
import 'package:queryy/components/size_config.dart';
import 'package:queryy/components/text.dart';
import 'package:queryy/screens/authenticate/components/build_form_field.dart';
import 'no_account.dart';

class ForgotPassword extends StatelessWidget {
  static String id = "forgot_password";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Forgot Password"),
          backgroundColor: kPrimaryColor,
        ),
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.04),
                  Text(
                    "Forgot Password",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(28),
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.01),
                  TextWidget(
                    text:
                    "Please enter your email and we will send \nyou a link to return to your account",
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w400,
                    fontSize: getProportionateScreenWidth(15),
                    colorType: Colors.black,
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.1),
                  ForgotPassForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          BuildFormField(
              obscure: false,
              onChange: (value) {

              },
              onSave: (newValue){

              },
              validate: (value) {

              },
              label: "Email",
              hint: "Enter your email",
              image: "assets/icons/Mail.svg"),
          SizedBox(height: getProportionateScreenHeight(30)),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          ButtonComponent(
            text: "Continue",
            press: () async{
                Navigator.pop(context);
            },
            buttonWidth: 350,
            fontSizeLength: getProportionateScreenWidth(18),
            buttonHeight: 50,
            textColor: Colors.white,
            borderColor: Colors.transparent,
            backColor: kPrimaryColor,
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          NoAccountText(),
        ],
      ),
    );
  }
}
