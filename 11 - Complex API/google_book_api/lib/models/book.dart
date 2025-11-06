import 'package:google_book_api/models/volume_info.dart';

class Book {
  String? id;
  VolumeInfo? volumeInfo;

  Book({this.volumeInfo});

  factory Book.fromJson(Map<String, dynamic> json) {
    var bookParsed = Book();
    bookParsed.id = json['id'];
    // `volumeInfo` may be absent in some responses.
    final volumeInfoJson = json['volumeInfo'] as Map<String, dynamic>?;
    if (volumeInfoJson != null) {
      bookParsed.volumeInfo = VolumeInfo.fromJson(volumeInfoJson);
    } else {
      bookParsed.volumeInfo = null;
    }
    return bookParsed;
  }
}
