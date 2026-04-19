import 'package:bookly_app/Core/Utilits/styles.dart';

import 'package:bookly_app/Features/home/View/widgets/CustomBestSellerListView.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomHomeAppBar(),
            const SizedBox(height: 44),
            const CustomHomePageListItem(),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "Best Seller",
                style: Styles.textStyle18.copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(child: const CustomBestSellerListView()),
          ],
        ),
      ),
    );
  }
}
