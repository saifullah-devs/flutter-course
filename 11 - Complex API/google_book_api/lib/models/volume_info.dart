import 'package:google_book_api/models/image_link.dart';

class VolumeInfo {
  String? title;
  List<String>? authors;
  ImageLinks? imageLinks;

  VolumeInfo({this.title, this.authors, this.imageLinks});

  factory VolumeInfo.fromJson(Map<String, dynamic> json) {
    var volumeInfoParsed = VolumeInfo();
    volumeInfoParsed.title = json['title'];

    // authors may be missing
    volumeInfoParsed.authors = [];
    final authorsJson = json['authors'] as List<dynamic>?;
    if (authorsJson != null) {
      for (var authorStr in authorsJson) {
        volumeInfoParsed.authors?.add(authorStr as String);
      }
    }

    // imageLinks may be missing
    final imageLinksJson = json['imageLinks'] as Map<String, dynamic>?;
    if (imageLinksJson != null) {
      volumeInfoParsed.imageLinks = ImageLinks.fromJson(imageLinksJson);
    } else {
      volumeInfoParsed.imageLinks = null;
    }
    return volumeInfoParsed;
  }
}
