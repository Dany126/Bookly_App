import 'package:bookly_app/Core/Utilities/styles.dart';

import 'package:bookly_app/Features/home/View/widgets/CustomRowRating.dart';
import 'package:bookly_app/constant.dart';
import 'package:flutter/material.dart';

class CustomBestSellerItem extends StatelessWidget {
  const CustomBestSellerItem({super.key});

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
                child: Image.asset(kTestImage, fit: BoxFit.cover),
              ),
            ),

            const SizedBox(width: 20),

            // 📖 Book Info
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Harry Potter and the Sorcerer's Stone",
                    style: Styles.textStyle18.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "J.K. Rowling",
                    style: Styles.textStyle14.copyWith(
                      color: Color.fromRGBO(255, 255, 255, .7),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "19.99\$",
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
