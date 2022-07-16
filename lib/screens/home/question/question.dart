
import 'package:flutter/material.dart';
import 'package:queryy/components/header2.dart';
import 'package:queryy/components/size_config.dart';
import 'package:queryy/components/text.dart';
import 'package:queryy/screens/home/question/question_bubble.dart';
import 'answer_bubble.dart';

class Question extends StatefulWidget {

  Question({required this.qid, required this.mainQ});

  final String qid;
  final bool mainQ;

  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  var question = "", aid = [], count = "", askedName = "", asked = "", mainQid = "";
  bool loadQuestion = true;


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Header2(
              text: '',
            ),
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                QuestionBubble(
                  qid: mainQid,
                  name: askedName,
                  question: question,
                  uid: asked,
                ),
                Padding(
                  padding: EdgeInsets.only(left: getProportionateScreenWidth(20), top: getProportionateScreenHeight(12)),
                  child: SizedBox(
                    height: getProportionateScreenHeight(30),
                    child: TextWidget(
                      textAlign: TextAlign.left,
                      text: '$count answers',
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      colorType: Colors.black,
                    ),
                  ),
                ),
                AnswerBubble(aid: aid),
              ],
            )
            ),
          ],
        ),
      ),
    );
  }
}
