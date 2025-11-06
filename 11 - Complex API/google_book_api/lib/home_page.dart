import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_book_api/book_detail.dart';
import 'package:google_book_api/models/book_response.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BookResponse? response;
  bool isLoading = false;
  TextEditingController textEditingController = TextEditingController();
  String get searchKeyword => textEditingController.text;

  _getBooks() async {
    setState(() {
      isLoading = true;
    });
    try {
      var url = Uri.parse(
        'https://www.googleapis.com/books/v1/volumes?q=$searchKeyword',
      );
      var response = await http.get(url);
      var responseSTR = response.body;
      var decodedJson = jsonDecode(responseSTR);
      setState(() {
        this.response = BookResponse.fromJson(decodedJson);
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
      setState(() {
        // ignore: unnecessary_this
        this.response = null;
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void onSearchButtonPress() => _getBooks();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GOOGLE BOOKAPI CALLS COMPLEX 🙄")),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(child: TextField(controller: textEditingController)),
              ElevatedButton(
                onPressed: onSearchButtonPress,
                child: Text("Search"),
              ),
            ],
          ),
          Text('Total Items: ${response?.totalItems ?? 0}'),
          if (!isLoading)
            Expanded(
              child: ListView.builder(
                itemCount: response?.items?.length ?? 0,
                itemBuilder: (_, index) => ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BookDetail(
                          bookFromList: (response?.items![index])!,
                        ),
                      ),
                    );
                  },
                  title: Text(response?.items![index].volumeInfo?.title ?? ""),
                  subtitle: Text(
                    (response?.items?[index].volumeInfo?.authors != null &&
                            response!
                                .items![index]
                                .volumeInfo!
                                .authors!
                                .isNotEmpty)
                        ? response!.items![index].volumeInfo!.authors!.first
                        : "",
                  ),
                  leading: Builder(
                    builder: (_) {
                      final thumb = response
                          ?.items?[index]
                          .volumeInfo
                          ?.imageLinks
                          ?.thumbnail;
                      if (thumb != null && thumb.isNotEmpty) {
                        return Image.network(
                          thumb,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.broken_image),
                        );
                      }
                      return const SizedBox(
                        width: 50,
                        height: 50,
                        child: Icon(Icons.book),
                      );
                    },
                  ),
                ),
              ),
            ),
          if (isLoading) Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
