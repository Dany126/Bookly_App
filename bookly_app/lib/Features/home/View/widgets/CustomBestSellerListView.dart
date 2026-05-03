import 'package:bookly_app/Core/utilities/go_router.dart';
import 'package:bookly_app/Core/utilities/snack_bar.dart';
import 'package:bookly_app/Features/home/Model%20View/NewestBooksCubit/NewestBooksCubit.dart';
import 'package:bookly_app/Features/home/Model%20View/NewestBooksCubit/NewestBooksState.dart';
import 'package:bookly_app/Features/home/View/widgets/CustomBestSellerItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomBestSellerListView extends StatelessWidget {
  const CustomBestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
      listener: (context, state) {
        if (state is NewestBooksFailure) {
          CustomSnackBar.show(
            context,
            message: state.errorMessage, // ✅ FIXED
          );
        }
      },
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                GoRouter.of(context).push(AppRouter.detailsRoute);
              },
              child: const CustomBestSellerItem(),
            ),
          );
        }

        if (state is NewestBooksLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is NewestBooksFailure) {
          return const Center(child: Text("Something went wrong"));
        }

        return const SizedBox();
      },
    );
  }
}
