
import 'package:flutter/material.dart';
import 'package:queryy/components/ButtonComponent.dart';
import 'package:queryy/components/QuestionRequest.dart';
import 'package:queryy/components/constants.dart';
import 'package:queryy/components/size_config.dart';
import 'package:queryy/components/text.dart';
import 'package:queryy/models/answer_model/database.dart';
import 'package:queryy/models/question_model/database.dart';
import 'package:queryy/models/user_model/database.dart';

class Modal extends StatefulWidget {
  Modal({required this.question, required this.qid, required this.mainA, required this.userId});
  final String qid;
  final String question;
  final bool mainA;
  final String userId;

  @override
  State<Modal> createState() => _ModalState();
}

class _ModalState extends State<Modal> {

  TextEditingController controller = TextEditingController();
  String answer = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 30.0, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
                text: widget.question,
                fontWeight: FontWeight.w600,
                fontSize: 15,
                colorType: Colors.black,
                textAlign: TextAlign.left),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            QuestionRequest(
                height: 330,
                width: getProportionateScreenWidth(370),
                text: "Type your answer here...",
                maxLines: 100,
                onChange: (value) {

                },
                controller: controller),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonComponent(
                  text: "Post",
                  press: () async {
                    Navigator.pop(context);
                  },
                  buttonWidth: 50,
                  buttonHeight: 30,
                  fontSizeLength: 15,
                  textColor: Colors.white,
                  borderColor: Colors.transparent,
                  backColor: kPrimaryColor,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
