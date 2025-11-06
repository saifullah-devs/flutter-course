import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_book_api/models/book.dart';
import 'package:http/http.dart' as http;

class BookDetail extends StatefulWidget {
  final Book bookFromList;

  const BookDetail({super.key, required this.bookFromList});

  @override
  State<BookDetail> createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  late Book book;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    book = widget.bookFromList;
    _getBookDetail();
  }

  _getBookDetail() async {
    setState(() {
      isLoading = true;
    });
    try {
      var uri = Uri.parse(
        "https://www.googleapis.com/books/v1/volumes/${book.id}",
      );
      var response = await http.get(uri);
      var jsonDecoded = jsonDecode(response.body);
      setState(() {
        book = Book.fromJson(jsonDecoded);
      });
    } catch (e) {
      setState(() {
        book = widget.bookFromList;
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Book Detail")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(book.volumeInfo?.title ?? ""),
            Image.network(
              // book.volumeInfo?.imageLinks?.thumbnail
              "https://picsum.photos/200/300",
              width: 200,
              height: 300,
              fit: BoxFit.fitHeight,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image, size: 80),
            ),
          ],
        ),
      ),
    );
  }
}
