import 'package:bookly_app/Features/home/View/homepage.dart';
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
