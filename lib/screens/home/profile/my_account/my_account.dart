
import 'package:flutter/material.dart';
import 'package:queryy/components/constants.dart';
import 'package:queryy/components/header2.dart';
import 'package:queryy/components/question_answer.dart';
import 'package:queryy/components/question_message.dart';
import 'package:queryy/components/size_config.dart';
import 'package:queryy/components/text.dart';
import 'package:queryy/models/user_model/user_model.dart';
import 'package:queryy/screens/home/profile/my_account/edit_profile.dart';
import '../../../../components/ButtonComponent.dart';
import '../../question/question.dart';

class MyAccount extends StatefulWidget {
  static String id = "my_account";
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          body:Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Header2(text: "Profile"),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: getProportionateScreenWidth(115),
                height: getProportionateScreenHeight(115),
                child: CircleAvatar(
                  backgroundImage:
                  AssetImage("assets/images/profile.jpg"),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: getProportionateScreenWidth(20),
                    right: getProportionateScreenWidth(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: "Your Info",
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          colorType: Colors.black,
                          textAlign: TextAlign.left,
                        ),
                        ButtonComponent(
                          text: "Edit",
                          buttonWidth: getProportionateScreenWidth(50),
                          buttonHeight: getProportionateScreenHeight(30),
                          fontSizeLength: 15.0,
                          textColor: Colors.white,
                          borderColor: Colors.transparent,
                          backColor: kPrimaryColor,
                          press: () {
                            Navigator.pushNamed(context, EditProfile.id);
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        TextWidget(
                          text: "Name: ",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          colorType: Colors.black,
                          textAlign: TextAlign.left,
                        ),
                        TextWidget(
                          text: "Rev",
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          colorType: Colors.black,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        TextWidget(
                          text: "Designation: ",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          colorType: Colors.black,
                          textAlign: TextAlign.left,
                        ),
                        TextWidget(
                          text: "designation",
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          colorType: Colors.black,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        TextWidget(
                          text: "Department: ",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          colorType: Colors.black,
                          textAlign: TextAlign.left,
                        ),
                        TextWidget(
                          text: "CS",
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          colorType: Colors.black,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        TextWidget(
                          text: "Joined: ",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          colorType: Colors.black,
                          textAlign: TextAlign.left,
                        ),
                        TextWidget(
                          text: "20/20/20",
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          colorType: Colors.black,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                child: AppBar(
                  backgroundColor: Colors.white,
                  bottom: TabBar(
                    labelColor: Color(0xff0558bb),
                    unselectedLabelColor: Colors.black38,
                    indicatorColor: Color(0xff0558bb),
                    isScrollable: true,
                    tabs: [
                      Tab(
                        text: "Questions Asked()",
                      ),
                      Tab(
                        text: "Questions Answered()",
                      ),
                      Tab(
                        text: "Requests Sent()",
                      ),
                      Tab(
                        text:
                        "Requests Received()",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RequestBubble extends StatelessWidget {
  const RequestBubble(
      {required this.question, required this.qid, required this.check});

  final String question;
  final String qid;
  final int check;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.only(
              left: getProportionateScreenWidth(20),
              right: getProportionateScreenWidth(20),
              top: getProportionateScreenHeight(10),
              bottom: getProportionateScreenHeight(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(
                fontSize: 15,
                colorType: Colors.black,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.left,
                text: question,
              ),
              check == 0
                  ? TextWidget(
                fontSize: 15,
                colorType: Colors.yellow,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.left,
                text: "Pending",
              )
                  : check == 1
                  ? TextWidget(
                fontSize: 15,
                colorType: Colors.green,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.left,
                text: "Accepted",
              )
                  : TextWidget(
                fontSize: 15,
                colorType: Colors.red,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.left,
                text: "Denied",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
