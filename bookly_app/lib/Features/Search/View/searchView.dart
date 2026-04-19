import 'package:bookly_app/Features/Search/View/widgets/customTextField.dart';
import 'package:bookly_app/Features/home/View/widgets/CustomBestSellerListView.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 5, top: 20),
              child: CustomTextField(),
            ),
          ),
          SliverFillRemaining(child: const CustomBestSellerListView()),
        ],
      ),
    );
  }
}
