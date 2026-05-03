import 'package:bookly_app/Core/utilities/styles.dart';
import 'package:bookly_app/Features/home/Model%20View/NewestBooksCubit/NewestBooksCubit.dart';
import 'package:bookly_app/Features/home/Model%20View/NewestBooksCubit/NewestBooksState.dart';

import 'package:bookly_app/Features/home/View/widgets/CustomBestSellerListView.dart';
import 'package:bookly_app/Features/home/View/widgets/custom_drop_down.dart';
import 'package:bookly_app/Features/home/View/widgets/custom_home_app_bar.dart';
import 'package:bookly_app/Features/home/View/widgets/custom_homepage_list_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

                BlocBuilder<NewestBooksCubit, NewestBooksState>(
                  builder: (context, state) {
                    return Container(
                      margin: const EdgeInsets.only(right: 16),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 2,
                          color: Color.fromRGBO(215, 40, 40, 0.694),
                        ),
                      ),
                      child: CustomDropDown(),
                    );
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),

            Expanded(child: const CustomNewestBooksListView()),
          ],
        ),
      ),
    );
  }
}
