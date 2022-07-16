import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:queryy/components/ButtonComponent.dart';
import 'package:queryy/components/constants.dart';
import 'package:queryy/components/profile_pic.dart';
import 'package:queryy/components/size_config.dart';
import 'package:queryy/screens/authenticate/components/build_form_field.dart';
import 'package:queryy/screens/authenticate/components/form_error.dart';
import 'package:queryy/screens/authenticate/components/keyboard.dart';
import 'package:queryy/screens/authenticate/register/drop_down_widget.dart';
import 'package:queryy/screens/services/auth.dart';

import '../../start.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  final List<String?> errors = [];
  final List<String> designationRoles = [
    'Student',
    'Teacher',
  ];

  final List<String> departments = [
    'Computer Science and Engineering',
    'Information Science and Engineering',
  ];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          ProfilePic(
              onPress: () async {

              },
              image:CircleAvatar(
                backgroundImage: AssetImage("assets/images/profile.jpg"),
              )
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          BuildFormField(
            obscure: false,
            onSave: (newValue) {

            },
            validate: (value) {

            },
            onChange: (value) {

            },
            label: "Username",
            hint: 'Enter your name',
            image: 'assets/icons/User.svg',
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          BuildFormField(
            obscure: false,
            onSave: (newValue) {

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
            onSave: (newValue){

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
          BuildFormField(
            obscure: true,
            onSave: (newValue) => {

            },
            validate: (value) {

            },
            onChange: (value) {

            },
            label: "Confirm Password",
            hint: "Re-enter your password",
            image: "assets/icons/Lock.svg",
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          DropDownWidget(
            hintText: 'Select your designation',
            validate: (value) {

            },
            designationRoles: designationRoles,
            onChange: (value) {

            },
            label: 'Designation',
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          DropDownWidget(
            hintText: 'Select your department',
            validate: (value) {

            },
            designationRoles: departments,
            onChange: (value) {

            },
            label: 'Department',
          ),
          SizedBox(height: getProportionateScreenHeight(30)),

          SizedBox(height: getProportionateScreenHeight(30)),
          ButtonComponent(
            text: "Register",
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
          SizedBox(height: getProportionateScreenHeight(30)),
        ],
      ),
    );
  }
}

