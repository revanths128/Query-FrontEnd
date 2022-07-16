import 'package:flutter/material.dart';
import 'screens/wrapper.dart';
import 'package:queryy/screens/authenticate/login/forgot_password.dart';
import 'package:queryy/screens/authenticate/login/login.dart';
import 'package:queryy/screens/authenticate/register/register.dart';
import 'package:queryy/screens/authenticate/welcome/welcome.dart';
import 'package:queryy/screens/home/add/add.dart';
import 'package:queryy/screens/home/home/home.dart';
import 'package:queryy/screens/home/notification/notification.dart';
import 'package:queryy/screens/home/profile/help/helpCenter.dart';
import 'package:queryy/screens/home/profile/my_account/edit_profile.dart';
import 'package:queryy/screens/home/profile/my_account/my_account.dart';
import 'package:queryy/screens/home/profile/profile.dart';
import 'package:queryy/screens/home/profile/settings/settings.dart';
import 'package:queryy/screens/services/auth.dart';
import 'package:queryy/screens/start.dart';
import 'package:queryy/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'components/search.dart';
import 'models/user_model/user_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Wrapper(),
      routes: {
        Welcome.id: (context) => Welcome(),
        Login.id: (context) => Login(),
        Register.id: (context) => Register(),
        ForgotPassword.id: (context) => ForgotPassword(),
        Home.id: (context) => Home(),
        Ask.id: (context) => Ask(),
        Contact.id: (context) => Contact(),
        MyAccount.id: (context) => MyAccount(),
        Profile.id: (context) => Profile(),
        Setting.id: (context) => Setting(),
        Start.id: (context) => Start(),
        Search.id: (context) => Search(),
        EditProfile.id: (context) => EditProfile(),
        NotificationAlert.id: (context) => NotificationAlert(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
