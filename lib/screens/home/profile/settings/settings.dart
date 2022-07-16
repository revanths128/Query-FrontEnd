import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:queryy/components/header2.dart';
import 'package:queryy/components/size_config.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:queryy/models/user_model/database.dart';
import '../../../../components/text.dart';

class Setting extends StatefulWidget {
  static String id = "setting";

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool status = false, loadData = true;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Header2(text: "Settings"),
            Padding(
              padding: EdgeInsets.only(left: getProportionateScreenWidth(20), right: getProportionateScreenWidth(20), top: getProportionateScreenHeight(20)),
              child: Column(
                children: [
                  Transform.scale(
                    scale: 1.08,
                    child: ListTileSwitch(
                      value: status,
                      leading: Icon(Icons.notifications),
                      onChanged: (value) async{
                        if(mounted){
                          setState(() {
                            status = value;
                          });
                        }
                      },
                      switchActiveColor: Colors.blueAccent,
                      switchType: SwitchType.material,
                      title: TextWidget(
                        text:
                        "Notifications",
                        fontSize: 16.0,
                        colorType: Colors.black,
                        fontWeight: FontWeight.w600, textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
