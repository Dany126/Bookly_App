import 'dart:developer';

import 'package:bookly_app/Core/utilities/go_router.dart';
import 'package:bookly_app/Features/home/Model%20View/FeatureBooksCubit/feature_books_cubit.dart';
import 'package:bookly_app/Features/home/Model%20View/FeatureBooksCubit/feature_books_state.dart';

import 'package:bookly_app/Features/home/View/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomHomePageListItem extends StatelessWidget {
  const CustomHomePageListItem({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatureBooksCubit, FeatureBooksState>(
      builder: (context, state) {
        if (state is FeatureBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.29,
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: ListView.builder(
                itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.detailsRoute);
                      },

                      child: CustomBookItem(
                        imageLink:
                            state
                                .books[index]
                                .volumeInfo
                                ?.imageLinks
                                ?.thumbnail ??
                            '',
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        } else if (state is FeatureBooksLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FeatureBooksFailure) {
          log(state.errorMessage);
          return Center(child: Text(state.errorMessage));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
