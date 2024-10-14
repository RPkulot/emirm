import 'package:eirmuplb/database/user_info_database.dart';
import 'package:eirmuplb/home.dart';
import 'package:eirmuplb/reusable_widgets/reusable_widget.dart';
import 'package:eirmuplb/signup.dart';
import 'package:eirmuplb/utils/colors_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'database/asset_database.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  var registrationCheck;

  void initState() {
    FlutterNativeSplash.remove();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/emir.png"),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 20,
                ),
                signInSignUpButton(context, true, () async {
                  var userCount = await EIRMUserInfoDatabase.instance.tableIsEmpty();
                  print(userCount);
                  if (userCount! > 0){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeRoute()));
                  } else {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()));
                  }
                }),
                SizedBox(height: 30,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
