import 'package:bookly_app/Core/utilities/styles.dart';
import 'package:bookly_app/Features/home/Model%20View/NewestBooksCubit/NewestBooksCubit.dart';
import 'package:bookly_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({super.key});

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String? selectedCategory = 'All';

  final List<String> categories = [
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
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: selectedCategory,
        dropdownColor: kPrimaryColor,
        borderRadius: BorderRadius.circular(16),
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
          if (value == null) return;

          setState(() {
            selectedCategory = value;
          });

          // 🔥 trigger cubit
          context.read<NewestBooksCubit>().fetchNewestBooks(
            categoryName: value.toLowerCase(),
          );
        },
      ),
    );
  }
}
