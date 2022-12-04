import 'package:flutter/material.dart';
import 'package:prac13_gender_prediction/gender.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'gender.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Gender Prediction',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Gender Prediction'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<Gender> gender;
  TextEditingController nameController = TextEditingController();

  String genderop = "";
  String nameop = "";
  String probop = "";

  Future<Gender> getPred(String name) async {
    final response = await http.get(Uri.parse(
        "https://api.genderize.io/?name=" + name.toLowerCase().trim()));

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      setState(() {
        genderop = "Gender: " +
            jsonDecode(response.body)["gender"].toString().toUpperCase();
        nameop = "Name: " +
            jsonDecode(response.body)["name"].toString().toUpperCase();
        probop = "Probability: " +
            jsonDecode(response.body)["probability"].toString();
      });
      return Gender.fromJson(jsonDecode(response.body));
    } else {
      print("Failed to load data");
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
  }

  String? get _errorText {
    final text = nameController.text;

    if (text.isEmpty) {
      return 'Can\'t be empty';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container(
          alignment: Alignment.center,
          color: Colors.white,
          margin: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            children: <Widget>[
              Text(
                'Gender Prediction',
                style: TextStyle(fontSize: 28.0),
              ),
              TextField(
                controller: nameController,
                style: TextStyle(fontSize: 20.0),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Enter Your Name',
                  hintText: 'Enter Your Name',
                  errorText: _errorText,
                ),
              ),
              RaisedButton(
                  child: Text(
                    'Predict',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  onPressed: () {
                    if (nameController.text != null) {
                      gender = getPred(nameController.text);
                    }
                  }),
              new Text(
                "$nameop",
                style: TextStyle(fontSize: 20.0),
              ),
              new Text(
                "$genderop",
                style: TextStyle(fontSize: 20.0),
              ),
              new Text(
                "$probop",
                style: TextStyle(fontSize: 20.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
