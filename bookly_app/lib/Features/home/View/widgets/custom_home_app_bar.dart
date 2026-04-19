import 'package:bookly_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(kLogoPath),
          IconButton(
            onPressed: () {
              GoRouter.of(context).push('/search');
            },
            icon: FaIcon(FontAwesomeIcons.search, size: 20),
          ),
        ],
      ),
    );
  }
}
