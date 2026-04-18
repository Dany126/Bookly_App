import 'package:bookly_app/Features/home/View/widgets/custom_home_app_bar.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomHomeAppBar(),
            const SizedBox(height: 44),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: const CustomHomePageListItem(),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomHomePageListItem extends StatelessWidget {
  const CustomHomePageListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 16), // 🔥 spacing
          child: const CustomBookItem(),
        );
      },
    );
  }
}

class CustomBookItem extends StatelessWidget {
  const CustomBookItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          "assets/images/Item.png",
          fit: BoxFit.cover, // 🔥 better
        ),
      ),
    );
  }
}
