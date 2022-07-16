
import 'package:flutter/material.dart';
import 'package:queryy/components/constants.dart';

import 'package:queryy/components/size_config.dart';
import 'package:queryy/components/text.dart';
import 'package:queryy/screens/authenticate/register/register_form.dart';

class Register extends StatelessWidget {
  static String id = "Register";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Register"),
          backgroundColor: kPrimaryColor,
        ),
        body: SizedBox(
          width: double.infinity,
          child: Padding(
            padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.04), // 4%
                  TextWidget(
                    text: "Register",
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenWidth(26),
                    colorType: Colors.black,
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.01),
                  TextWidget(
                    text: "Complete your details",
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w400,
                    fontSize: getProportionateScreenWidth(15),
                    colorType: Colors.black,
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.04),
                  SignUpForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}