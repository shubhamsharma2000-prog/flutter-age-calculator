import 'dart:async';

import 'package:flutter/material.dart';

void main()=> runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(primarySwatch:Colors.brown),
  home: MyHomePage()
));
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double age = 0.0;
  var selectedYear;
  void CalculateAge()
  {
    setState(() {
      age = (2024-selectedYear).toDouble();

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        centerTitle: true,
        title: Text("Age Calculator"),
      ),
      body: Container(
        decoration:BoxDecoration(
          color: Colors.lightGreenAccent
        ) ,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget> [
             OutlinedButton(

                 onPressed: () {

                   showDatePicker(
                   context: context,
                   firstDate: DateTime(1900),
                   lastDate: DateTime.now()).then((DateTime? dt) {
                     setState(() {
                       selectedYear = dt?.month;
                       CalculateAge();
                     });
                   });
                 },
                 child: new Text(selectedYear!= null ? selectedYear.toString() : "select your year of birth"),
             ),
              SizedBox(height: 30,),
              Text("your Age is ${age.toInt()} years",style:(TextStyle(fontWeight: FontWeight.w200)))
            ],
          ),
        ),
      ),
    );
  }
}
