import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_register_sceen.dart';

class onBoardScreen extends StatefulWidget {
  @override
  _onBoardScreenState createState() => _onBoardScreenState();
}

class _onBoardScreenState extends State<onBoardScreen> {
  PageController pageController;
  int currentIndex = 0;

  List<String> pageImage = [
    'assets/images/3.jpeg',
    'assets/images/4.jpeg',
    'assets/images/5.jpeg'
  ];
  List<String> mainText = ['Your Yoga', 'Your Health', 'Learn to Relax'];
  List<String> desText = [
    'Does Hydroderum Work',
    'Recommended You To Use After Before Breast Enhancement',
    'The Health Benefits Of Sunglasses'
  ];

  @override
  void initState() {
    super.initState();
    pageController =
        PageController(initialPage: 0, keepPage: true, viewportFraction: 0.9);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: pageImage.length,
                itemBuilder: (context, int currentInx) {
                  return pageViewElement(pageImage[currentInx],
                      mainText[currentInx], desText[currentInx]);
                },
                controller: pageController,
                onPageChanged: (int page) {
                  setState(() {
                    currentIndex = page;
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildIndicator(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 15),
              child: FlatButton(
                padding: EdgeInsets.all(14.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          Login_Register_Screen('Sign Up')));
                },
                color: Color(0xFFFAF3EC2),
                child: Text(
                  'Create Account',
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Already have an Account - ',
                  style: TextStyle(
                    color: Color(0xFFFAF3EC2),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  Login_Register_Screen('Sign In')));
                        },
                      text: 'Sign In',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
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

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 8,
      width: isActive ? 30 : 8,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < pageImage.length; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }
}

class pageViewElement extends StatelessWidget {
  String asset, mainText, desText;

  pageViewElement(this.asset, this.mainText, this.desText);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Image.asset(
              asset,
              fit: BoxFit.contain,
            ),
//            child: SvgPicture.asset(
//              asset,
//              fit: BoxFit.contain,
//            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 10),
            child: Text(
              mainText,
              textAlign: TextAlign.center,
              style: GoogleFonts.anaheim(
                fontSize: 40,
              ),
            ),
          ),
          SizedBox(
            width: 250,
            child: Text(
              desText,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
