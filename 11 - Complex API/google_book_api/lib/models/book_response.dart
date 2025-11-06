import 'package:google_book_api/models/book.dart';

class BookResponse {
  int? totalItems;
  List<Book>? items;

  BookResponse({this.totalItems, this.items});

  factory BookResponse.fromJson(Map<String, dynamic> json) {
    var bookResponse = BookResponse();
    bookResponse.totalItems = json['totalItems'];
    // Safely parse items if present. The API may omit `items` when there are no results.
    bookResponse.items = [];
    final itemsJson = json['items'] as List<dynamic>?;
    if (itemsJson != null) {
      for (var bookJson in itemsJson) {
        var bookMap = bookJson as Map<String, dynamic>;
        bookResponse.items?.add(Book.fromJson(bookMap));
      }
    }
    return bookResponse;
  }
}
