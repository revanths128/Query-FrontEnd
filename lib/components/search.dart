
import 'package:flutter/material.dart';
import 'package:queryy/components/QuestionRequest.dart';
import 'package:queryy/components/constants.dart';
import 'package:queryy/components/question_message.dart';
import 'package:queryy/components/size_config.dart';
import 'icon_widget.dart';

class Search extends StatefulWidget {
  static String id = "search";

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
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
            Container(
              decoration: BoxDecoration(color: kPrimaryColor),
              height: getProportionateScreenHeight(50),
              child: Padding(
                padding: EdgeInsets.only(
                    left: getProportionateScreenWidth(10),
                    right: getProportionateScreenWidth(20)),
                child: Row(
                  children: [
                    IconWidget(
                        icons: Icons.arrow_back_ios,
                        onPress: () {
                          Navigator.pop(context);
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


