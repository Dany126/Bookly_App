import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomDetailImageView extends StatelessWidget {
  const CustomDetailImageView({super.key, required this.imageLink});
  final String imageLink;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .3,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: AspectRatio(
        aspectRatio: 2.7 / 4,
        child: CachedNetworkImage(
          progressIndicatorBuilder: (context, url, progress) {
            return Center(
              child: CircularProgressIndicator(value: progress.progress),
            );
          },
          errorWidget: (context, url, error) => const Icon(Icons.error),
          imageUrl: imageLink,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
