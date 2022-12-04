import 'package:flutter/material.dart';

class MyStateFulApp extends StatefulWidget {
  @override
  _MyStateFulApp createState() => _MyStateFulApp();
}

class _MyStateFulApp extends State<MyStateFulApp> {
  Color _containerColor = Colors.yellow;

  void changeColor() {
    setState(() {
      if (_containerColor == Colors.yellow) {
        _containerColor = Colors.red;
        return;
      }
      _containerColor = Colors.yellow;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Stateful Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: _containerColor,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("A Simple App Stateful Widget")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 120.0,
                height: 100.0,
                child: RaisedButton(
                  child: Text(
                    'Click to change color',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  onPressed: changeColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
