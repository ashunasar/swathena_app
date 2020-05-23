import 'package:flutter/material.dart';

class mainDashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fitness'),
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Amit Dubey"),
                accountEmail: Text("amit@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                ),
                decoration: BoxDecoration(color: Colors.blueAccent),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text("Item 1"),
                      leading: Icon(Icons.arrow_forward),
                    ),
                    ListTile(
                      title: Text("Item 2"),
                      leading: Icon(Icons.arrow_forward),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Container(),
        ),
      ),
    );
  }
}
