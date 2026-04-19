import 'package:bookly_app/Features/home/View/widgets/custom_home_app_bar.dart';
import 'package:bookly_app/Features/home/View/widgets/custom_homepage_list_item.dart';

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
            const CustomHomePageListItem(),
            const SizedBox(height: 50),
            Text("Best Seller"),
          ],
        ),
      ),
    );
  }
}
