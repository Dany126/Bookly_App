import 'package:bookly_app/Core/utilities/ServiceLocator.dart';
import 'package:bookly_app/Core/utilities/go_router.dart';
import 'package:bookly_app/Features/home/Model%20View/FeatureBooksCubit/feature_books_cubit.dart';

import 'package:bookly_app/Features/home/Model%20View/NewestBooksCubit/NewestBooksCubit.dart';
import 'package:bookly_app/Features/home/Model/Repo/imp_repo.dart';

import 'package:bookly_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setupServiceLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewestBooksCubit>(
          create: (context) =>
              NewestBooksCubit(getIt.get<ImplementationRepo>())
                ..fetchNewestBooks(categoryName: "all"),
        ),
        BlocProvider<FeatureBooksCubit>(
          create: (context) =>
              FeatureBooksCubit(getIt.get<ImplementationRepo>())
                ..fetchFeatureBooks(categoryName: 'all'),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
