import 'package:flutter/material.dart';
import 'package:queryy/components/profile_menu.dart';
import '../../authenticate/welcome/welcome.dart';
import 'settings/settings.dart';
import 'help/helpCenter.dart';
import 'my_account/my_account.dart';


class Profile extends StatefulWidget {
  static String id = "profile";

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ProfileMenu(
            text: "My Account",
            icon: Icons.account_circle_rounded,
            press: (){
              Navigator.pushNamed(context, MyAccount.id);
            },
          ),
          ProfileMenu(
            text: "Settings",
            icon: Icons.settings,
            press: (){
              Navigator.pushNamed(context, Setting.id);
            },
          ),
          ProfileMenu(
            text: "Help Center",
            icon: Icons.help_outline,
            press: (){
              Navigator.pushNamed(context, Contact.id);
            },
          ),
          ProfileMenu(
            text: "Log Out",
            icon: Icons.logout,
            press: ()async{
              Navigator.pushNamedAndRemoveUntil(context, Welcome.id, (route) => false);
            },
          ),
        ],

      ),
    );
  }
}
