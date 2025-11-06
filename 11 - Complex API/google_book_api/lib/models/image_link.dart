class ImageLinks {
  String? thumbnail;
  String? extraLarge;

  ImageLinks({this.thumbnail});

  factory ImageLinks.fromJson(Map<String, dynamic> json) {
    var imageLinks = ImageLinks();
    imageLinks.thumbnail = json['thumbnail'];
    imageLinks.extraLarge = json['thumbnail'];
    return imageLinks;
  }
}
