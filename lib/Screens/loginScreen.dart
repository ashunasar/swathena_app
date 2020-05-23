import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swetnaapp/Screens/forgot_password.dart';
import 'package:swetnaapp/Screens/registerScreen.dart';

import 'mainDashBoard.dart';

class loginScreen extends StatefulWidget {
  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  TextEditingController LemailController;
  TextEditingController LpassController;

  // Progress Dialog
  ProgressDialog pr;

  // function to toast message
  // ignore: non_constant_identifier_names
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
  // end function to toast message

  // codes to send request to server
  Map data;
  List userData;
  Future getData() async {
    await pr.show();
    if (LemailController.text != '' || LpassController.text != '') {
      http.Response response = await http.get(
          "http://phpstack-250897-1281769.cloudwaysapps.com/signup/login.php?usermail=${LemailController.text}&userpass=${LpassController.text}");
      data = json.decode(response.body);
      setState(() {
        userData = data["data"];
        String message = userData[0]['message'].toString();
        if (message == "success") {
          Future<bool> email() async {
            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            return await preferences.setString("email", LemailController.text);
          }

          email();
          pr.hide();
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => mainDashBoard()));
        } else {
          toast_msg(message);
          pr.hide();
        }
      });
    } else {
      toast_msg("All Feilds Should Not be Empty");
      await pr.hide();
    }
  }
  // end codes to send request to server

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
                      'Sign In',
                      style: GoogleFonts.openSans(
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 40, right: 20),
                    child: Text(
                      'Sign in to your registered account',
                      style: GoogleFonts.openSans(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 150, left: 20, right: 20),
                    child: TextField(
                      controller: LemailController,
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
                      controller: LpassController,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.vpn_key),
                        hintText: 'Password',
                        contentPadding: EdgeInsets.all(15.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, top: 20),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                forgot_password()));
                      },
                      child: Text(
                        'Forgot Password?',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFFFFFC967),
                        ),
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
                            text: 'Don\'t have Account - ',
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
                                              registerScreen())),
                                text: 'Sign Up',
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
    LemailController = new TextEditingController();
    LpassController = new TextEditingController();
  }

  @override
  void dispose() {
    LemailController.dispose();
    LpassController.dispose();
    super.dispose();
  }
}
