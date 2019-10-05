import 'package:flutter/material.dart';
import 'HomePage.dart';
void main()=>runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Scrach and Win App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        
      ),
      home: HomePage(),
    );
  }
}