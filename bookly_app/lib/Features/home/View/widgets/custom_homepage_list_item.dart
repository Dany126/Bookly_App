import 'package:bookly_app/Features/home/View/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';

class CustomHomePageListItem extends StatelessWidget {
  const CustomHomePageListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.29,
      child: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 16),
              child: const CustomBookItem(),
            );
          },
        ),
      ),
    );
  }
}
