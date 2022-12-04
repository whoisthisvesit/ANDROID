import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter',
    home: FirstScreen(),
  ));
}

class SecondScreen extends StatelessWidget {
  String name, gender;
  int age;
  SecondScreen({Key? key,required this.name,required this.age,required this.gender}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$name', style: TextStyle(fontSize: 22)),
            Text('$age'.toString(), style: TextStyle(fontSize: 22)),
            Text('$gender', style: TextStyle(fontSize: 22)),
          ],
        ),
      ),
    );
  }
}

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() {
    return _FirstScreenState();
  }
}

class _FirstScreenState extends State<FirstScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  String genderController="";

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SingleChildScrollView(
      child: new Form(

      child: Column(

          children: <Widget>[

      Container(

      margin: EdgeInsets.only(top: 130),
      alignment: Alignment.topCenter,
      child:Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container(
          alignment: Alignment.center,
          color: Colors.white,
          margin: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            children: <Widget>[
              Text(
                'Registration Form',
                style: TextStyle(fontSize: 28.0),
              ),
              TextField(
                controller: nameController,
                style: TextStyle(fontSize: 20.0),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Enter Your Name',
                  hintText: 'Enter Your Name',
                ),
              ),
              TextField(
                controller: ageController,
                style: TextStyle(fontSize: 20.0),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Enter Your Age',
                  hintText: 'Enter Your Age',
                ),
              ),
              Column(
                children: [

                  RadioListTile(
                    title: Text("Male"),
                    value: "male",
                    groupValue: genderController,
                    onChanged: (value){
                      setState(() {
                        genderController = value.toString();
                      });
                    },
                  ),

                  RadioListTile(
                    title: Text("Female"),
                    value: "female",
                    groupValue: genderController,
                    onChanged: (value){
                      setState(() {
                        genderController = value.toString();
                      });
                    },
                  ),

                  RadioListTile(
                    title: Text("Other"),
                    value: "other",
                    groupValue: genderController,
                    onChanged: (value){
                      setState(() {
                        genderController = value.toString();
                      });
                    },
                  )
                ],
              ),
              ElevatedButton(
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 20.0),
                  ),

                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            SecondScreen(name: nameController.text,
                                age: int.parse(ageController.text.toString()),
                                gender: genderController)
                    )
                    );
                  }
                  ),

            ],
          ),
        ),
      ),
    ),
 ]
      ),
    )
    ),
    );

  }
}