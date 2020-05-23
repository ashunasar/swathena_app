import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BMIquestions extends StatefulWidget {
  @override
  _BMIquestionsState createState() => _BMIquestionsState();
}

class _BMIquestionsState extends State<BMIquestions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      'Gender',
                      style: GoogleFonts.openSans(
                        fontSize: 30,
                      ),
                    ),
                    Container(
                        child: MultiSelectChip(['Male', 'Female', 'Others']))
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      'Height',
                      style: GoogleFonts.openSans(
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 150,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: TextField(
//                        controller: LemailController,
                              decoration: InputDecoration(
                                hintText: 'Height',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(15.0),
                              ),
                            ),
                          ),
                        ),
                        Container(child: MultiSelectChip(['cms', 'ft & in'])),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MultiSelectChip extends StatefulWidget {
  final List<String> choiceList;

  MultiSelectChip(this.choiceList);

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  String selectedChoice;

  _buildChoiceList() {
    List<Widget> choices = List();

    widget.choiceList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(10.0),
        child: ChoiceChip(
          selectedColor: Colors.blueAccent,
          labelStyle: GoogleFonts.lato(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
          ),
          label: Text(item),
          padding: EdgeInsets.only(left: 10, right: 10),
          selected: selectedChoice == item,
          onSelected: (selected) {
            setState(() {
              selectedChoice = item;
            });
          },
        ),
      ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _buildChoiceList(),
    );
  }
}
