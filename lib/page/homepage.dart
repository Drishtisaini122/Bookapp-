// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:search_my_book/model/listbook.dart';
import 'package:search_my_book/page/searchresultpage.dart';
import 'package:search_my_book/service/fetchbook.dart';

class HomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchtearm = TextEditingController();
  void searchg() async {
    BookList books;

    books = await fetchbooklist(searchtearm.text);
    Navigator.pop(context);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SearchReasult(
                  books: books,
                  searchtearm: searchtearm.text,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              // ignore: prefer_const_literals_to_create_immutables
              colors: [
            Color(0xFFDA811C),
            Color(0xFFFFCF4F),
          ])),
      child: Center(
        child: Container(
          margin: EdgeInsets.all(18),
          padding: EdgeInsets.all(16),
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Search Any Book',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  )),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xA0FCEFFF),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(9.0, 9.0),
                          color: Color(0x3A300342),
                          blurRadius: 5),
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(10),
                    child: TextField(
                      minLines: 1,
                      controller: searchtearm,
                      decoration: InputDecoration(
                          suffixIcon: InkWell(
                              onTap: () {
                                searchg();
                              },
                              child: Icon(Icons.search)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'search for any book or author'),
                      onEditingComplete: searchg,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
