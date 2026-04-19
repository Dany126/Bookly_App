import 'package:bookly_app/Features/home/View/widgets/CustomDetailImageView.dart';
import 'package:flutter/material.dart';

class CustomDetailListView extends StatelessWidget {
  const CustomDetailListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: const CustomDetailImageView(),
        );
      },
    );
  }
}
