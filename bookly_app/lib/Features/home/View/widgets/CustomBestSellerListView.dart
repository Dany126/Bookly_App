import 'dart:developer';

import 'package:bookly_app/Core/utilities/go_router.dart';
import 'package:bookly_app/Core/utilities/snack_bar.dart';
import 'package:bookly_app/Features/home/Model%20View/NewestBooksCubit/NewestBooksCubit.dart';
import 'package:bookly_app/Features/home/Model%20View/NewestBooksCubit/NewestBooksState.dart';
import 'package:bookly_app/Features/home/Model%20View/SimilerBooksCubit/SimilarBooksCubit.dart';

import 'package:bookly_app/Features/home/View/widgets/CustomBestSellerItem.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomNewestBooksListView extends StatelessWidget {
  const CustomNewestBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
      listener: (context, state) {
        if (state is NewestBooksFailure) {
          CustomSnackBar.show(context, message: state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is NewestBooksLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is NewestBooksSuccess) {
          log("books length: ${state.books.length}");

          if (state.books.isEmpty) {
            return const Center(child: Text("No books found"));
          }

          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  GoRouter.of(
                    context,
                  ).push(AppRouter.detailsRoute, extra: state.books[index]);
                  context.read<SimilarBooksCubit>().fetchSimilarBooks('all');
                },
                child: CustomBestSellerItem(item: state.books[index]),
              );
            },
          );
        }

        return const SizedBox();
      },
    );
  }
}
