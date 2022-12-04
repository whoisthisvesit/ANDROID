import 'package:flutter/material.dart';

class MyStatelessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter Stateless Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("A Simple App Stateless Widget")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text('Name: Narender Keswani',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0)),
            ),
            Align(
              alignment: Alignment.center,
              child: Text('Roll No: 24',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0)),
            ),
            Align(
              alignment: Alignment.center,
              child: Text('DivL B',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0)),
            ),
            Align(
              alignment: Alignment.center,
              child: Text('Department: MCA',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0)),
            ),
          ],
        ),
      ),
    );
  }
}
