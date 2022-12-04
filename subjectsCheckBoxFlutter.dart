import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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

class _MyHomePageState extends State<MyHomePage> {
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool isChecked5 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Subjects Selection",
              style: TextStyle(fontSize: 20),
            ),
            CheckboxListTile(
              value: isChecked1,
              title: const Text("BDAV"),
              onChanged: (value){
                setState(() {
                  isChecked1 = value!;
                });
                showAlertDialog(context,value!,"BDAV");
              },
            ),
            Divider(
              height: 10,
            ),
            CheckboxListTile(
              value: isChecked2,
              title: Text("STQA"),
              onChanged: (value){
                setState(() {
                  isChecked2 = value!;
                });
                showAlertDialog(context,value!,"STQA");
              },
            ),
            Divider(
              height: 10,
            ),
            CheckboxListTile(
              value: isChecked3,
              title: Text("DSCC"),
              onChanged: (value){
                setState(() {
                  isChecked3 = value!;
                });
                showAlertDialog(context,value!,"DSCC");
              },
            ),
            Divider(
              height: 10,
            ),
            CheckboxListTile(
              value: isChecked4,
              title: Text("MC"),
              onChanged: (value){
                setState(() {
                  isChecked4 = value!;
                });
                showAlertDialog(context,value!,"MC");
              },
            ),
            Divider(
              height: 10,
            ),
            CheckboxListTile(
              value: isChecked5,
              title: Text("BC"),
              onChanged: (value){
                setState(() {
                  isChecked5 = value!;
                });
                showAlertDialog(context,value!,"BC");
              },
            ),
            Divider(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

}
showAlertDialog(BuildContext context, bool val, String value ) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop(); // dismiss dialog
    },
  );
  // set up the AlertDialog

  if (val) {
    AlertDialog alert = AlertDialog(
      title: Text("Checkbox"),
      content: Text("You have selected $value"),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  } else{
    AlertDialog alert = AlertDialog(
      title: Text("Checkbox"),
      content: Text("You have deselected $value"),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
}
}
