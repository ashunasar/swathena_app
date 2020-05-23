import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swetnaapp/Screens/loginScreen.dart';
import 'package:swetnaapp/Screens/registerScreen.dart';

class Login_Register_Screen extends StatelessWidget {
  String action = 'Register';

  List<String> des = ['Change starts here', 'Welcome Back'];

  Login_Register_Screen(this.action);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 16.0),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                alignment: Alignment.topLeft,
                icon: FaIcon(
                  FontAwesomeIcons.arrowLeft,
                  color: Colors.black,
                  size: 20.0,
                ),
              ),
            ),
            Expanded(
              child: Image.asset(
                'assets/images/6.jpeg',
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 10),
              child: Text(
                action == 'Sign Up' ? des[0] : des[1],
                textAlign: TextAlign.center,
                style: GoogleFonts.anaheim(
                  fontSize: 40,
                  color: Color(0xFFFAF3EC2),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20, right: 40, left: 40),
              child: Text(
                'Save your progress to access your personal trainning program!',
                textAlign: TextAlign.center,
                style: GoogleFonts.abel(
                  fontSize: 16,
                ),
              ),
            ),
            Divider(
              thickness: 1,
              endIndent: 100,
              indent: 100,
            ),
            Text(
              action == 'Sign Up' ? 'Sign up with' : 'Sign in with',
              textAlign: TextAlign.center,
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 15),
              child: FlatButton(
                padding: EdgeInsets.all(14.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    if (action == 'Sign Up')
                      return registerScreen();
                    else
                      return loginScreen();
                  }));
                },
                color: Color(0xFFFAF3EC2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.mail_outline,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Email',
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              'OR',
              textAlign: TextAlign.center,
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 15),
              child: RaisedButton(
                elevation: 4,
                padding: EdgeInsets.all(14.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                onPressed: () {},
                color: Colors.blueAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FaIcon(
                      FontAwesomeIcons.facebookF,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Facebook',
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 15),
              child: OutlineButton(
                padding: EdgeInsets.all(14.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                onPressed: () {},
                color: Colors.blueAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SvgPicture.asset(
                      'assets/images/google_icon.svg',
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Google',
                      style: GoogleFonts.lato(
                        color: Colors.blueAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: action == 'Sign Up'
                      ? 'Already have an Account - '
                      : 'Don\'t have an Account - ',
                  style: TextStyle(
                    color: Color(0xFFFAF3EC2),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: action == 'Sign Up' ? 'Sign In' : 'Sign Up',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    action == 'Sign In'
                                        ? registerScreen()
                                        : loginScreen())),
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold),
                    ),
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
