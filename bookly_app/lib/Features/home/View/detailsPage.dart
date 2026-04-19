import 'package:bookly_app/Core/Utilits/styles.dart';
import 'package:bookly_app/Features/home/View/widgets/CustomContainerDetailBody.dart';
import 'package:bookly_app/Features/home/View/widgets/CustomDetailImageView.dart';
import 'package:bookly_app/Features/home/View/widgets/CustomDetailsAppBar.dart';
import 'package:bookly_app/Features/home/View/widgets/CustomRowRating.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomDetailsAppBar(),
          const SizedBox(height: 30),
          const CustomDetailImageView(),
          const SizedBox(height: 40),
          Text(
            "The Jungle Book",
            style: Styles.textStyle30.copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 4),
          Text(
            "Rudyard Kipling",
            style: Styles.textStyle18.copyWith(
              color: Color.fromRGBO(255, 255, 255, .7),
            ),
          ),
          const SizedBox(height: 14),

          const CustomRowRating(),
          const SizedBox(height: 37),
          Row(
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
        ],
      ),
    );
  }
}
