import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swetnaapp/Screens/loginScreen.dart';

import 'mainDashBoard.dart';

class registerScreen extends StatefulWidget {
  @override
  _registerScreenState createState() => _registerScreenState();
}

class _registerScreenState extends State<registerScreen> {
  TextEditingController RemailController;
  TextEditingController RpassController;
  TextEditingController RnameController;

  // Progress Dialog
  ProgressDialog pr;

  void toast_msg(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  Map data;
  List userData;

  Future getData() async {
    await pr.show();
    if (RemailController.text != '' ||
        RpassController.text != '' ||
        RnameController.text != '') {
      if (RpassController.text.length >= 8) {
        http.Response response = await http.get(
            "http://phpstack-250897-1281769.cloudwaysapps.com/signup/index.php?username=${RnameController.text}&usermail=${RemailController.text}&userpass=${RpassController.text}");
        data = json.decode(response.body);
        setState(() {
          userData = data["data"];
          String message = userData[0]['message'].toString();
          if (message != "Email Already Registered") {
            Future<bool> email() async {
              SharedPreferences preferences =
                  await SharedPreferences.getInstance();
              return await preferences.setString(
                  "email", RemailController.text);
            }

            email();
            pr.hide();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => mainDashBoard()));
          } else {
            pr.hide();
            toast_msg(message);
          }
        });
      } else {
        pr.hide();
        toast_msg("Password should be between 8-15 characters");
      }
    } else {
      pr.hide();
      toast_msg("All Feilds Should Not be Empty");
    }
  }

  @override
  Widget build(BuildContext context) {
    pr = ProgressDialog(context);
    pr.style(
        message: 'Please Wait...',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: TextStyle(
            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: -50,
            left: -50,
            child: Image.asset(
              'assets/images/9.jpeg',
              fit: BoxFit.fitWidth,
              width: 500.0,
            ),
          ),
          Container(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 80, left: 20, right: 20),
                    child: Text(
                      'Create Account',
                      style: GoogleFonts.openSans(
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 40, right: 20),
                    child: Text(
                      'Register with your valid e-mail address',
                      style: GoogleFonts.openSans(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 150, left: 20, right: 20),
                    child: TextField(
                      controller: RnameController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: 'Name',
                        contentPadding: EdgeInsets.all(15.0),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: TextField(
                      controller: RemailController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.mail_outline),
                        hintText: 'Email',
                        contentPadding: EdgeInsets.all(15.0),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: TextField(
                      controller: RpassController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.vpn_key),
                        hintText: 'Password',
                        contentPadding: EdgeInsets.all(15.0),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FloatingActionButton(
                          child: FaIcon(
                            FontAwesomeIcons.arrowRight,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            getData();
                          },
                          backgroundColor: Color(0xFFF5910c1),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: 10,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Already have an Account - ',
                            style: GoogleFonts.openSans(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              loginScreen())),
                                text: 'Sign In',
                                style: GoogleFonts.openSans(
                                  color: Color(0xFFFFFC967),
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    RemailController = new TextEditingController();
    RpassController = new TextEditingController();
    RnameController = new TextEditingController();
  }

  @override
  void dispose() {
    RemailController.dispose();
    RnameController.dispose();
    RnameController.dispose();
    super.dispose();
  }
}
