import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:youtube_downloader/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: HexColor("034748"),
      ),
      debugShowCheckedModeBanner: false,
      home: Home()
    );
  }
}
