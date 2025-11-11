import 'package:wallpaper_pexel/models/src_model.dart';

class PexelsPhoto {
  final int id;
  final int width;
  final int height;
  final String url;
  final String photographer;
  final String photographerUrl;
  final int photographerId;
  final String avgColor;
  final PexelsSrc src;
  final bool liked;
  final String alt;

  PexelsPhoto({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
    required this.photographer,
    required this.photographerUrl,
    required this.photographerId,
    required this.avgColor,
    required this.src,
    required this.liked,
    required this.alt,
  });

  factory PexelsPhoto.fromJson(Map<String, dynamic> json) => PexelsPhoto(
    id: json['id'],
    width: json['width'],
    height: json['height'],
    url: json['url'] ?? '',
    photographer: json['photographer'] ?? '',
    photographerUrl: json['photographer_url'] ?? '',
    photographerId: json['photographer_id'] ?? 0,
    avgColor: json['avg_color'] ?? '',
    src: PexelsSrc.fromJson(json['src'] ?? {}),
    liked: json['liked'] ?? false,
    alt: json['alt'] ?? '',
  );
}
