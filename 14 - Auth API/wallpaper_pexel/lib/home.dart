import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallpaper_pexel/full_screen.dart';
import 'package:wallpaper_pexel/providers/response_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(pexelsSearchProvider);
    final notifiers = ref.read(pexelsSearchProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: asyncValue.when(
        data: (pexels) {
          return Column(
            children: [
              Expanded(
                child: GridView.builder(
                  itemCount: pexels.perPage,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 2,
                    childAspectRatio: 2 / 3,
                    mainAxisSpacing: 2,
                  ),
                  itemBuilder: (context, index) {
                    final photo = pexels.photos[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                FullScreenImage(imageUrl: photo.src.large2x),
                          ),
                        );
                      },
                      child: Container(
                        color: Colors.white,
                        child: Image.network(
                          photo.src.tiny,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey,
                              child: const Icon(Icons.error),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                color: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 8),
                margin: null,
                height: 60,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () => notifiers.previousPage(),
                      icon: Icon(Icons.navigate_before_rounded, size: 40),
                    ),
                    Text(
                      pexels.page.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    IconButton(
                      onPressed: () => notifiers.nextPage(),
                      icon: Icon(Icons.navigate_next_rounded, size: 40),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
