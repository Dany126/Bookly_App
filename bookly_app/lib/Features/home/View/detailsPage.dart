import 'package:bookly_app/Core/Utilities/styles.dart';
import 'package:bookly_app/Features/home/View/widgets/CustomContainerDetailBody.dart';
import 'package:bookly_app/Features/home/View/widgets/CustomDetailImageView.dart';
import 'package:bookly_app/Features/home/View/widgets/CustomDetailListView.dart';
import 'package:bookly_app/Features/home/View/widgets/CustomDetailsAppBar.dart';
import 'package:bookly_app/Features/home/View/widgets/CustomRowRating.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),

        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const CustomDetailsAppBar(),
                const SizedBox(height: 30),
                const CustomDetailImageView(),
                const SizedBox(height: 40),
                Text(
                  "The Jungle Book",
                  style: Styles.textStyle30.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Rudyard Kipling",
                  style: Styles.textStyle18.copyWith(
                    color: const Color.fromRGBO(255, 255, 255, .7),
                  ),
                ),
                const SizedBox(height: 14),
                const CustomRowRating(),
                const SizedBox(height: 37),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomContainerDetailBody(
                      color: Colors.white,
                      isLeft: true,
                      textColor: Colors.black,
                    ),

                    CustomContainerDetailBody(
                      color: Color(0xFFEF8262),
                      text: "Free preview",
                      isLeft: false,
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text("You can also like", style: Styles.textStyle14),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .1,
              child: const CustomDetailListView(),
            ),
          ),
        ],
      ),
    );
  }
}
