import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallpaper_pexel/providers/wallpaper_provider.dart';

class FullScreenImage extends ConsumerWidget {
  final String imageUrl;

  const FullScreenImage({required this.imageUrl, super.key});

  void setWallpaper(String imageUrl, WidgetRef ref) {
    ref.read(wallpaperProvider.notifier).setWallpaper(imageUrl);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wallpaperState = ref.watch(wallpaperProvider);

    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Image.network(
                imageUrl,
                fit: BoxFit.fitHeight,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey,
                    child: const Icon(Icons.error),
                  );
                },
              ),
            ),
            InkWell(
              onTap: wallpaperState.isLoading
                  ? null
                  : () {
                      // Implement wallpaper setting functionality here
                      setWallpaper(imageUrl, ref);
                    },
              child: Container(
                height: 60,
                width: double.infinity,
                color: Colors.black,
                child: Center(
                  child: wallpaperState.isLoading
                      ? const CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                      : const Text(
                          'Set as Wallpaper',
                          style: TextStyle(color: Colors.white),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
