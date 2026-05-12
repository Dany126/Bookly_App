import 'package:bookly_app/Core/utilities/snack_bar.dart';
import 'package:bookly_app/Features/home/Model%20View/SimilerBooksCubit/SimilarBooksCubit.dart';
import 'package:bookly_app/Features/home/Model%20View/SimilerBooksCubit/SimilarBooksState.dart';
import 'package:bookly_app/Features/home/View/widgets/CustomDetailImageView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDetailListView extends StatelessWidget {
  const CustomDetailListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SimilarBooksCubit, SimilarBooksState>(
      listener: (context, state) {
        if (state is SimilarBooksFailure) {
          CustomSnackBar.show(context, message: state.failure.message);
        }
      },
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.similarBooks.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CustomDetailImageView(
                  imageLink:
                      state
                          .similarBooks[index]
                          .volumeInfo
                          ?.imageLinks
                          ?.thumbnail ??
                      '',
                ),
              );
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
