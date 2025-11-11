import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_pexel/models/response_model.dart';
import 'package:wallpaper_pexel/providers/key_provider.dart';

class PexelsSearchNotifier extends AsyncNotifier<PexelsResponse> {
  int _page = 1;
  @override
  Future<PexelsResponse> build() async {
    return _fetchPage(_page);
  }

  Future<PexelsResponse> _fetchPage(int page) async {
    final apiKey = ref.read(pexelsApiKeyProvider);
    final uri = Uri.https('api.pexels.com', '/v1/search', {
      'query': 'nature',
      'per_page': '45',
      'page': page.toString(),
    });

    final response = await http.get(uri, headers: {'Authorization': apiKey});

    if (response.statusCode != 200) {
      throw Exception(
        'Pexels API error ${response.statusCode}: ${response.body}',
      );
    }

    final data = jsonDecode(response.body);
    return PexelsResponse.fromJson(data);
  }

  Future<void> nextPage() async {
    _page++;
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetchPage(_page));
  }

  Future<void> previousPage() async {
    if (_page > 1) {
      _page--;
      state = const AsyncLoading();
      state = await AsyncValue.guard(() => _fetchPage(_page));
    }
  }
}

final pexelsSearchProvider =
    AsyncNotifierProvider<PexelsSearchNotifier, PexelsResponse>(
      () => PexelsSearchNotifier(),
    );
