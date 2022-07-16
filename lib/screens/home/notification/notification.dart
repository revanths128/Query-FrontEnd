
import 'package:flutter/material.dart';
import 'package:queryy/components/ButtonComponent.dart';
import 'package:queryy/components/constants.dart';
import 'package:queryy/components/modal.dart';
import 'package:queryy/components/size_config.dart';
import 'package:queryy/components/text.dart';
import 'package:queryy/models/user_model/database.dart';
import 'package:queryy/screens/home/notification/answer_sub_question.dart';

class NotificationAlert extends StatefulWidget {
  static String id = "notification";

  @override
  _NotificationAlertState createState() => _NotificationAlertState();
}

class _NotificationAlertState extends State<NotificationAlert> {
  bool isNotify = false, loadData = true;
  var questions = [], report;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (BuildContext context, int index) => Question(
          question: "what is ds",
          qid: '1',
          uid1: "12",
          uid2: "11",
          mainAid: "1",
          func: () {
            setState(() {

            });
          },
        ),
      ),
    );
  }
}

class Question extends StatefulWidget {
  const Question({
    required this.question,
    required this.qid,
    required this.uid1,
    required this.uid2,
    required this.mainAid,
    required this.func,
  });

  final String question;
  final String qid;
  final String uid1;
  final String uid2;
  final String mainAid;
  final void Function() func;

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.only(
              left: getProportionateScreenWidth(20),
              right: getProportionateScreenWidth(20),
              top: getProportionateScreenHeight(10),
              bottom: getProportionateScreenHeight(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                fontSize: 15,
                colorType: Colors.black,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.left,
                text: widget.question,
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonComponent(
                      text: "Accept",
                      press: () async {

                      },
                      buttonWidth: 50,
                      buttonHeight: 30,
                      fontSizeLength: 12,
                      borderColor: Colors.green,
                      backColor: Colors.white,
                      textColor: Colors.green),
                  SizedBox(
                    width: getProportionateScreenWidth(10),
                  ),
                  ButtonComponent(
                      text: "Deny",
                      press: () async {
                        widget.func();
                      },
                      buttonWidth: 50,
                      buttonHeight: 30,
                      fontSizeLength: 12,
                      borderColor: Colors.red,
                      backColor: Colors.white,
                      textColor: Colors.red),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
