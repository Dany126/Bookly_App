import 'package:bookly_app/Features/home/Model%20View/GlobalFilterCubit/FilerCubit.dart';
import 'package:bookly_app/Features/home/Model%20View/NewestBooksCubit/NewestBooksCubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({super.key});

  final categories = const [
    'all',
    'fiction',
    'science',
    'history',
    'business',
    'biography',
    'technology',
    'self-help',
    'romance',
    'fantasy',
    'horror',
    'education',
    'children',
  ];

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<FilterCubit>().state.category;

    return DropdownButton<String>(
      value: selected,

      items: categories.map((c) {
        return DropdownMenuItem(value: c, child: Text(c));
      }).toList(),

      onChanged: (value) {
        if (value == null) return;

        context.read<FilterCubit>().changeCategory(value);
        context.read<NewestBooksCubit>().fetchNewestBooks(value);
      },
    );
  }
}
