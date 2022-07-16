import 'dart:math';
import 'package:flutter/material.dart';
import 'package:queryy/components/question_answer.dart';
import 'package:queryy/components/size_config.dart';
import '../question/question.dart';

class Home extends StatefulWidget {
  static String id = "home";

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var questionAnswers = [];
  bool loadData = true;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:ListView.builder(
        itemCount: questionAnswers.length,
        itemBuilder: (BuildContext context, int index) => QuestionAnswer(
          qid: "11",
          question: "whats is ds",
          askName:"rev",
          answer: "bodi",
          answerName: "darshan",
          aid: "13",
          func: (){
            setState(() {

            });
          },
        ),
      )
    );
  }
}

class QuestionAnswer extends StatelessWidget {
  QuestionAnswer(
      {required this.question,
        required this.qid,
        required this.askName,
        required this.answerName,
        required this.answer, required this.aid, required this.func});
  final String question;
  final String qid;
  final String aid;
  final String askName;
  final String answerName;
  final String answer;
  final void Function() func;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: getProportionateScreenHeight(20)),
      child: Column(
        children: [
          QuestionAnswerBubble(
            func: func,
            id: qid,
            contText: question,
            txt: "Asked by $askName",
            onPress: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Question(qid: qid, mainQ: true,)));
            },
            check: true,
            isHome: true,
          ),
          QuestionAnswerBubble(
            func: func,
            id: aid,
            contText: answer,
            txt: "Answered by $answerName",
            onPress: () {},
            check: false,
            isHome: true,
          )
        ],
      ),
    );
  }
}
