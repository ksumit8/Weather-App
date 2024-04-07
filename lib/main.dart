import 'package:flutter/material.dart';
import 'listofplaces.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

   //   home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home:Scaffold(

          backgroundColor: Colors.lightBlueAccent,
          appBar: AppBar(
            backgroundColor:Colors.blueGrey,
            title: const Text("Hey Weather"),
          ),

           body:  Places()

      ),
    );
  }
}

