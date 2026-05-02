import 'package:bookly_app/Core/utilities/go_router.dart';
import 'package:bookly_app/Core/utilities/styles.dart';

import 'package:bookly_app/Features/home/View/widgets/CustomBestSellerListView.dart';
import 'package:bookly_app/Features/home/View/widgets/custom_home_app_bar.dart';
import 'package:bookly_app/Features/home/View/widgets/custom_homepage_list_item.dart';
import 'package:bookly_app/constant.dart';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedCategory;
  List<String> categories = [
    'All',
    'Fiction',
    'Science',
    'History',
    'Business',
    'Biography',
    'Technology',
    'Self-Help',
    'Romance',
    'Fantasy',
    'Horror',
    'Education',
    'Children',
  ];

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

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Newest Books",
                    style: Styles.textStyle18.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                Container(
                  margin: const EdgeInsets.only(right: 16),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 2,
                      color: Color.fromRGBO(215, 40, 40, 0.694),
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      elevation: 10,

                      dropdownColor: kPrimaryColor,
                      borderRadius: BorderRadius.circular(16),

                      value: selectedCategory,
                      hint: Text(
                        "Category",
                        style: Styles.textStyle18.copyWith(
                          fontWeight: FontWeight.w800,
                          color: Colors.white54,
                        ),
                      ),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: categories.map((item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(
                            item,
                            style: Styles.textStyle14.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedCategory = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Expanded(
              child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.detailsRoute);
                },
                child: const CustomBestSellerListView(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
