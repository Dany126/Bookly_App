import 'package:bookly_app/Core/utilities/styles.dart';
import 'package:bookly_app/Features/home/Model/book_model/item.dart';

import 'package:bookly_app/Features/home/View/widgets/CustomRowRating.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBestSellerItem extends StatelessWidget {
  const CustomBestSellerItem({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2.4 / 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  progressIndicatorBuilder: (context, url, progress) {
                    return Center(
                      child: CircularProgressIndicator(
                        value: progress.progress,
                      ),
                    );
                  },
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  imageUrl: item.volumeInfo?.imageLinks?.thumbnail ?? '',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(width: 20),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.volumeInfo?.title ?? "No Title",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle18.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    item.volumeInfo?.authors?.isNotEmpty == true
                        ? item.volumeInfo!.authors!.first
                        : "Unknown Author",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle14.copyWith(
                      color: const Color.fromRGBO(255, 255, 255, .7),
                    ),
                  ),

                  const SizedBox(height: 8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Free",
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const CustomRowRating(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
