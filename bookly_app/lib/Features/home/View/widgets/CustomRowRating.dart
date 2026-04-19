import 'package:bookly_app/Core/Utilits/styles.dart';
import 'package:flutter/material.dart';

class CustomRowRating extends StatelessWidget {
  const CustomRowRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.star, color: Color(0xFFFFDD4F), size: 20),
        const SizedBox(width: 4),
        Text("4.8", style: Styles.textStyle14),
        SizedBox(width: 9),
        Text(
          "(2390)",
          style: Styles.textStyle14.copyWith(
            color: Color.fromRGBO(255, 255, 255, .7),
          ),
        ),
      ],
    );
  }
}
