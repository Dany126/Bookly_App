import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomBookItem extends StatelessWidget {
  const CustomBookItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CachedNetworkImage(
          progressIndicatorBuilder: (context, url, progress) {
            return Center(
              child: CircularProgressIndicator(value: progress.progress),
            );
          },
          errorWidget: (context, url, error) => const Icon(Icons.error),
          imageUrl: '',
        ),
      ),
    );
  }
}
