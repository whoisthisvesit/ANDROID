import 'package:flutter/material.dart';
import 'package:prac11/stateful.dart';
import 'package:prac11/stateless.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Example of Stateless & Stateful'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text(
                  'Example of Stateless Widget',
                  style: TextStyle(fontSize: 20.0),
                ),
                color: Colors.blueAccent,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyStatelessApp()),
                  );
                },
              ),
              RaisedButton(
                child: Text(
                  'Example of Stateful Widget',
                  style: TextStyle(fontSize: 20.0),
                ),
                color: Colors.blueAccent,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyStateFulApp()),
                  );
                },
              ),
              Text('Developed by Narender Keswani',
                  textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
