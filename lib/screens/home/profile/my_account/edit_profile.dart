import 'dart:io';
import 'package:flutter/material.dart';
import 'package:queryy/components/ButtonComponent.dart';
import 'package:queryy/components/constants.dart';
import 'package:queryy/components/header2.dart';
import 'package:queryy/components/profile_pic.dart';
import 'package:queryy/components/size_config.dart';
import 'package:queryy/components/text.dart';
import 'package:queryy/models/user_model/database.dart';
import 'package:queryy/screens/authenticate/components/build_form_field.dart';
import 'package:queryy/screens/authenticate/components/form_error.dart';
import 'package:queryy/screens/authenticate/components/keyboard.dart';
import 'package:queryy/screens/authenticate/register/drop_down_widget.dart';
import 'package:queryy/screens/home/profile/my_account/my_account.dart';

class EditProfile extends StatefulWidget {
  static String id = "edit_profile";

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final List<String> designationRoles = [
    'Student',
    'Teacher',
  ];
  TextEditingController username = TextEditingController();
  final List<String> departments = [
    'Computer Science and Engineering',
    'Information Science and Engineering',
  ];


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Header2(text: "Edit Profile"),
                SizedBox(height: SizeConfig.screenHeight * 0.08), // 4%
                TextWidget(
                  text: "Edit Profile",
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.bold,
                  fontSize: getProportionateScreenWidth(26),
                  colorType: Colors.black,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.01),
                TextWidget(
                  text: "Edit your details",
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w400,
                  fontSize: getProportionateScreenWidth(15),
                  colorType: Colors.black,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Form(
                  child: Padding(
                    padding: EdgeInsets.only(left: getProportionateScreenWidth(20), right: getProportionateScreenWidth(20)),
                    child: Column(
                      children: [
                        ProfilePic(
                          onPress: () async {
                            setState(() {

                            });
                          },
                        image: CircleAvatar(
                            backgroundImage: AssetImage(
                                "assets/images/profile.jpg"),
                          )
                        ),
                        SizedBox(height: getProportionateScreenHeight(30)),
                        BuildFormField(
                          controller: username,
                          obscure: false,
                          onSave: (value) {},
                          validate: (value) {
                            if (value!.isEmpty) {

                              return "";
                            }
                            return null;
                          },
                          onChange: (value) {

                          },
                          label: "Username",
                          hint: 'Enter your name',
                          image: 'assets/icons/User.svg',
                        ),
                        SizedBox(height: getProportionateScreenHeight(30)),
                        DropDownWidget(
                          value: null,
                          hintText: 'Select your designation',
                          validate: (value) {

                          },
                          designationRoles: designationRoles,
                          onChange: (value) {
                            setState(() {

                            });
                          },
                          label: 'Designation',
                        ),
                        SizedBox(height: getProportionateScreenHeight(30)),
                        DropDownWidget(
                          value: null,
                          hintText: 'Select your department',
                          validate: (value) {
                            if (value == null) {

                            }
                          },
                          designationRoles: departments,
                          onChange: (value) {
                            setState(() {

                            });
                          },
                          label: 'Department',
                        ),
                        SizedBox(height: getProportionateScreenHeight(30)),
                        SizedBox(height: getProportionateScreenHeight(30)),
                        ButtonComponent(
                          text: "Edit",
                          press: () {
                              Navigator.pushNamed(context, MyAccount.id);
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
                  ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}
