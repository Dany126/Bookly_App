import 'package:flutter/material.dart';

class CustomDetailImageView extends StatelessWidget {
  const CustomDetailImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .3,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: AspectRatio(
        aspectRatio: 2.7 / 4,
        child: Image.asset("assets/images/Item.png", fit: BoxFit.cover),
      ),
    );
  }
}
