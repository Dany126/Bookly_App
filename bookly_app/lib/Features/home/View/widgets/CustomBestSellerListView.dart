import 'package:bookly_app/Features/home/View/widgets/CustomBestSellerItem.dart';
import 'package:flutter/material.dart';

class CustomBestSellerListView extends StatelessWidget {
  const CustomBestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => const CustomBestSellerItem(),
      ),
    );
  }
}
