import 'package:flutter/material.dart';
import 'dart:math' as Math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
bool showFront = true;
class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Transform(
              transform: Matrix4.rotationX(
                  (showFront ? 0 : -2) * Math.pi / 2
              ),
              alignment: Alignment.center,
              child: Container(
                height: 100,
                alignment: Alignment.center,
                child: Image.asset('assets/vesit.png'),
              ),
            ),

            Text(
              'VESIT COLLEGE',
              style: TextStyle(fontSize: 20.0),
            ),

            ElevatedButton(
              child: Text('Rotate Image'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
              onPressed: () {
                setState(() => showFront = !showFront);
              },
            ),
          ],
        ),
      ),

    );
  }
}
