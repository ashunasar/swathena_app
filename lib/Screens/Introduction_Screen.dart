import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'onBoardScreen.dart';

class Introduction_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Hero(
                      tag: 'SplashtoLogo',
                      child: Image(
                        image: AssetImage('assets/images/8.jpeg'),
                      ),
                    ),
                  ),
                  Text(
                    'Get fitter, stronger, and embrace a \nhealthier lifestyle',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.abel(
                      fontSize: 18,
                      color: Color(0xFFF7F7F7F),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: 20, left: 30, right: 30, bottom: 30),
                    child: FlatButton(
                      padding: EdgeInsets.all(14.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                onBoardScreen()));
                      },
                      color: Color(0xFFFAF3EC2),
                      child: Text(
                        'Get Started',
                        style: GoogleFonts.lato(
                          color: Color(0xFFFEDECF2),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
