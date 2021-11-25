import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:search_my_book/model/listbook.dart';

Future<BookList> fetchbooklist(String searchtearm) async {
  var url = Uri.parse(
      'https://www.googleapis.com/books/v1/volumes?q=$searchtearm&maxResults=25');
  http.Response response = await http.get(url);

  return BookList.fromMap(jsonDecode(response.body));
}

Future<Book> fetchbook(String selflink) async {
  var url = Uri.parse(selflink);
  http.Response response = await http.get(url);
  print(response.body);
  return Book.fromMap(jsonDecode(response.body));
}
