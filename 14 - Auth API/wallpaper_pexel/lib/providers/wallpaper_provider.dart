// ignore_for_file: avoid_print

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallpaper_manager_plus/wallpaper_manager_plus.dart';

class WallpaperNotifier extends AsyncNotifier<void> {
  @override
  Future<void> build() async {}
  
  Future<void> setWallpaper(String imageUrl) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _performSetWallpaper(imageUrl));
  }

  Future<void> _performSetWallpaper(String imageUrl) async {
    try {
      final file = await DefaultCacheManager().getSingleFile(imageUrl);

      // Choose location: HOME_SCREEN, LOCK_SCREEN or BOTH_SCREENS
      final location = WallpaperManagerPlus.homeScreen;

      final result = await WallpaperManagerPlus().setWallpaper(
        file.path,
        location,
      );
      if (result != null) {
        print('Wallpaper set successfully!');
      } else {
        print('Failed to set wallpaper.');
      }
    } catch (e) {
      print('Error setting wallpaper: $e');
      rethrow;
    }
  }
}

final wallpaperProvider = AsyncNotifierProvider<WallpaperNotifier, void>(
  () => WallpaperNotifier(),
);
