import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:queryy/models/user_model/user_model.dart';
import 'package:queryy/screens/authenticate/welcome/welcome.dart';
import 'package:queryy/screens/start.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Welcome();
  }
}
