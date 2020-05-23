import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swetnaapp/Screens/mainDashBoard.dart';

import 'Screens/Introduction_Screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: SplashScreen(),
      ),
    ),
  ));
}

class SplashScreen extends StatefulWidget {
  SharedPreferences sharedPreferences;
//  Future<String> email() async {
//    SharedPreferences preferences = await SharedPreferences.getInstance();
//    return await preferences.getString("email");
//  }

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  void email() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var email = await preferences.getString("email");
    print(email);
    if (email != null) {
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 10),
              pageBuilder: (_, __, ___) => mainDashBoard()));
    }
  }

  @override
  void initState() {
    super.initState();
    email();
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
            context,
            PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 1500),
                pageBuilder: (_, __, ___) => Introduction_Screen()));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Hero(
              tag: 'SplashtoLogo',
              child: Image(
                image: AssetImage('assets/images/8.jpeg'),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              height: 100,
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation(Colors.purple),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
