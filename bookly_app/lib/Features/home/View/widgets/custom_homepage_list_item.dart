import 'package:bookly_app/Features/home/View/homepage.dart';
import 'package:flutter/material.dart';

class CustomHomePageListItem extends StatelessWidget {
  const CustomHomePageListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 16),
          child: const CustomBookItem(),
        );
      },
    );
  }
}
