
import 'package:flutter/material.dart';
import 'package:queryy/components/ButtonComponent.dart';
import 'package:queryy/components/constants.dart';
import 'package:queryy/components/size_config.dart';
import 'package:queryy/components/text.dart';
import 'package:queryy/models/user_model/database.dart';

import '../../../components/modal.dart';

class Answer extends StatefulWidget {
  static String id = "answer";

  @override
  _AnswerState createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {

  var questions = [];
  bool loadData = true;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (BuildContext context, int index) => QuestionBubble(question: "what is ds", qid: "1", uid: "11", func: (){

        },),
      )
    );
  }
}

class QuestionBubble extends StatefulWidget {
  QuestionBubble({required this.question, required this.qid, required this.uid, required this.func});
  final String qid;
  final String question;
  final String uid;
  final void Function() func;

  @override
  State<QuestionBubble> createState() => _QuestionBubbleState();
}

class _QuestionBubbleState extends State<QuestionBubble> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        height: getProportionateScreenHeight(120),
        child: Padding(
          padding: EdgeInsets.only(
              left: getProportionateScreenWidth(20),
              right: getProportionateScreenWidth(20),
              top: getProportionateScreenHeight(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                  text: widget.question,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  colorType: Colors.black,
                  textAlign: TextAlign.left),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonComponent(
                      text: "Answer",
                      press: () {
                        showModalBottomSheet(
                          constraints: BoxConstraints(
                            maxHeight: getProportionateScreenHeight(700),
                          ),
                          isScrollControlled: true,
                          context: context,
                          builder: (context) => Modal(
                            qid: widget.qid,
                            question: widget.question,
                            mainA: true,
                            userId: widget.uid,
                          ),
                        );
                        widget.func();
                      },
                      buttonWidth: 60,
                      buttonHeight: 30,
                      fontSizeLength: 14,
                      borderColor: Colors.green,
                      backColor: Colors.white,
                      textColor: Colors.green),
                  ButtonComponent(
                      text: "Report",
                      press: () async{
                        widget.func();
                      },
                      buttonWidth: 60,
                      buttonHeight: 30,
                      fontSizeLength: 14,
                      borderColor: Colors.red,
                      backColor: Colors.white,
                      textColor: Colors.red),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
