// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, avoid_unnecessary_containers, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:search_my_book/model/listbook.dart';
import 'package:search_my_book/page/book_page.dart';
import 'package:search_my_book/service/fetchbook.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SearchReasult extends StatefulWidget {
  SearchReasult({Key? key, this.books, this.searchtearm}) : super(key: key);

  BookList? books;
  String? searchtearm;
  @override
  _SearchReasultState createState() => _SearchReasultState();
}

class _SearchReasultState extends State<SearchReasult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.searchtearm!),
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Color(0x00FFFFFF)),
        backgroundColor: Color(0xFFDA811C),
        foregroundColor: Color(0xE7000000),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
              Color(0xFFDA811C),
              Color(0xFFF6D365),
            ])),
        padding: EdgeInsets.only(top: 20, left: 10, right: 10),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            for (Book item in widget.books!.listofbook ?? [])
              Container(
                  child: BookTile(
                title: item.volumeInfo!.title,
                author: item.volumeInfo!.authors![0],
                publishers: item.volumeInfo!.publisher,
                smallthumb: item.volumeInfo!.imageLink!.smallThumbnail,
                selfLink: item.selfLink,
              ))
          ],
        ),
      ),
    );
  }
}

class BookTile extends StatefulWidget {
  BookTile(
      {Key? key,
      this.author,
      this.publishers,
      this.smallthumb,
      this.title,
      this.selfLink})
      : super(key: key);

  String? title;
  String? author;
  String? publishers;
  String? smallthumb;
  String? selfLink;

  @override
  _BookTileState createState() => _BookTileState();
}

class _BookTileState extends State<BookTile> {
  void bookg() async {
    Book bookdetails;

    bookdetails = await fetchbook(widget.selfLink!);
    Navigator.pop(context);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BookDetails(
                  mybook: bookdetails,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6),
      decoration: BoxDecoration(
          color: Color(0x2CF5D6FE),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(2.0, 2.0),
                color: Color(0x3CB2C0C4),
                blurRadius: 3),
          ]),
      child: InkWell(
        onTap: () {
          print("${widget.title} pressed");
          bookg();
        },
        child: Container(
          child: Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Image.network(
                  widget.smallthumb!,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0x2B0B0B0B),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                height: 80,
                decoration: BoxDecoration(
                  color: Color(0xE7D8B955),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                ),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          widget.title!,
                          style: TextStyle(fontSize: 18),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(widget.author!,
                            style: TextStyle(fontSize: 14),
                            overflow: TextOverflow.ellipsis),
                      ),
                    ],
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
