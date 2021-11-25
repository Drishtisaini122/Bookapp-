import 'package:flutter/material.dart';
import 'package:search_my_book/page/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFCC8A0F),
          title: Text('Search  Book'),
        ),
        body: HomePage(),
      ),
    );
  }
}
