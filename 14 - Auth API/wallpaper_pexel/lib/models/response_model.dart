import 'package:wallpaper_pexel/models/photo_model.dart';

class PexelsResponse {
  final int totalResults;
  final int page;
  final int perPage;
  final List<PexelsPhoto> photos;
  final String? nextPage;

  PexelsResponse({
    required this.totalResults,
    required this.page,
    required this.perPage,
    required this.photos,
    this.nextPage,
  });

  factory PexelsResponse.fromJson(Map<String, dynamic> json) => PexelsResponse(
    totalResults: json['total_results'] ?? 0,
    page: json['page'] ?? 1,
    perPage: json['per_page'] ?? 1,
    photos: (json['photos'] as List<dynamic>? ?? [])
        .map((e) => PexelsPhoto.fromJson(e))
        .toList(),
    nextPage: json['next_page'],
  );
}
