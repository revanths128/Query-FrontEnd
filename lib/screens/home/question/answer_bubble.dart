
import 'package:flutter/material.dart';
import 'package:queryy/components/ButtonComponent.dart';
import 'package:queryy/components/QuestionRequest.dart';
import 'package:queryy/components/constants.dart';
import 'package:queryy/components/size_config.dart';
import 'package:queryy/components/text.dart';
import 'package:queryy/models/answer_model/database.dart';
import 'package:queryy/models/question_model/database.dart';
import 'package:queryy/models/user_model/database.dart';
import 'package:queryy/screens/home/add/bullet_list.dart';

class AnswerBubble extends StatefulWidget {
  AnswerBubble({required this.aid});

  final List<dynamic> aid;

  @override
  _AnswerBubbleState createState() => _AnswerBubbleState();
}

class _AnswerBubbleState extends State<AnswerBubble> {
  var answers = [];
  var subAnswers = [];
  bool loadAnswer = true;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: answers.length,
            itemBuilder: (BuildContext context, int index) => AnswerMessage(
              name: answers[index][0][1],
              aid: answers[index][0][4],
              answer: answers[index][0][2],
              count: answers[index][0][3],
              subQuestionsAnswers: answers[index][1],
              userId: answers[index][0][0],
            )
        )
    );
  }
}

class AnswerMessage extends StatefulWidget {
  AnswerMessage(
      {required this.name,
        required this.answer,
        required this.aid,
        required this.count,
        this.subQuestionsAnswers, required this.userId});

  final String name;
  final String answer;
  final String aid;
  final String count;
  final String userId;
  final dynamic subQuestionsAnswers;

  @override
  State<AnswerMessage> createState() => _AnswerMessageState();
}

class _AnswerMessageState extends State<AnswerMessage> {
  bool showData = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: getProportionateScreenHeight(10)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.only(
              left: getProportionateScreenWidth(20),
              right: getProportionateScreenWidth(20),
              top: getProportionateScreenHeight(20),
              bottom: getProportionateScreenHeight(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                  text: 'Answered by ${widget.name}',
                  fontWeight: FontWeight.w100,
                  fontSize: 15,
                  colorType: Colors.black,
                  textAlign: TextAlign.left),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              TextWidget(
                  text: widget.answer,
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                  colorType: Colors.black,
                  textAlign: TextAlign.left),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showData = !showData;
                      });
                    },
                    child: TextWidget(
                        text: "Follow-up Questions(${widget.count})",
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                        colorType: kPrimaryColor,
                        textAlign: TextAlign.left),
                  ),
                  ButtonComponent(
                      text: "Report",
                      press: () {

                      },
                      buttonWidth: 60,
                      buttonHeight: 30,
                      fontSizeLength: 14,
                      borderColor: Colors.red,
                      backColor: Colors.white,
                      textColor: Colors.red),
                ],
              ),
              showData
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: widget.subQuestionsAnswers.length,
                    itemBuilder: (BuildContext context,
                        int index) =>
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: getProportionateScreenHeight(20),),
                            TextWidget(
                                text: "Asked by ${widget.subQuestionsAnswers[index][0]}",
                                fontWeight: FontWeight.w100,
                                fontSize: 15,
                                colorType: Colors.black,
                                textAlign: TextAlign.left),
                            SizedBox(height: getProportionateScreenHeight(10),),
                            TextWidget(
                                text: widget
                                    .subQuestionsAnswers[index][1],
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                colorType: Colors.black,
                                textAlign: TextAlign.left),
                            SizedBox(height: getProportionateScreenHeight(10),),
                            TextWidget(
                                text: widget
                                    .subQuestionsAnswers[index][2],
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                                colorType: Colors.black,
                                textAlign: TextAlign.left),
                          ],
                        ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(20),),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        constraints: BoxConstraints(
                          maxHeight: getProportionateScreenHeight(700),
                        ),
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => Modal(
                          aid: widget.aid,
                          userId: widget.userId,
                        ),
                      );
                    },
                    child: TextWidget(
                        text: "Request a follow-up question",
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                        colorType: kPrimaryColor,
                        textAlign: TextAlign.left),
                  )
                ],
              )
                  : SizedBox(
                height: 0,
                width: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class Modal extends StatefulWidget {
  const Modal({required this.aid, required this.userId});
  final String aid;
  final String userId;

  @override
  _ModalState createState() => _ModalState();
}

class _ModalState extends State<Modal> {

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: getProportionateScreenHeight(20), left: getProportionateScreenWidth(20), right: getProportionateScreenWidth(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: getProportionateScreenWidth(370),
            height: getProportionateScreenHeight(170),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: TextWidget(
                    text: "Important",
                    fontSize: 16.0,
                    colorType: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                ),
                BulletList([
                  "Make sure you don't repeat the question others asked",
                  "This question will not be public, it will only notified to the person who answered main question. From there, he can either accept or deny your question"
                ]),
              ],
            ),
            decoration: BoxDecoration(
              color: Color(0xFFebf0ff),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(50),
          ),
          TextWidget(
            text: "Request your follow-up question here: ",
            fontSize: 16.0,
            colorType: Colors.black,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.justify,
          ),
          SizedBox(
            height: 10.0,
          ),
          QuestionRequest(
            controller: controller,
            onChange: (value) {},
            height: getProportionateScreenHeight(120),
            width: getProportionateScreenWidth(370),
            maxLines: 7,
            text: 'Type your question here...',
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ButtonComponent(
                text: "Add",
                buttonWidth: 50.0,
                buttonHeight: 30.0,
                fontSizeLength: 15.0,
                textColor: Colors.white,
                borderColor: Colors.transparent,
                backColor: kPrimaryColor,
                press: () async {
                    Navigator.pop(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}



