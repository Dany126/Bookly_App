import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:bookly_app/constant.dart';

import 'package:bookly_app/Core/utilities/ServiceLocator.dart';
import 'package:bookly_app/Core/utilities/cash_service.dart';
import 'package:bookly_app/Core/utilities/go_router.dart';

import 'package:bookly_app/Features/home/Model/Repo/imp_repo.dart';

import 'package:bookly_app/Features/home/Model View/FeatureBooksCubit/feature_books_cubit.dart';
import 'package:bookly_app/Features/home/Model View/GlobalFilterCubit/FilerCubit.dart';
import 'package:bookly_app/Features/home/Model View/NewestBooksCubit/NewestBooksCubit.dart';
import 'package:bookly_app/Features/home/Model View/SimilerBooksCubit/SimilarBooksCubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheService.init();
  setup();

  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FilterCubit>(create: (context) => FilterCubit()),

        BlocProvider<NewestBooksCubit>(
          create: (context) =>
              NewestBooksCubit(getIt.get<HomeRepo>())..fetchNewestBooks('all'),
        ),

        BlocProvider<FeatureBooksCubit>(
          create: (context) =>
              FeatureBooksCubit(getIt.get<HomeRepo>())..fetchFeatureBooks(),
        ),

        BlocProvider<SimilarBooksCubit>(
          create: (context) => SimilarBooksCubit(getIt.get<HomeRepo>()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,

        routerConfig: AppRouter.router,

        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,

          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
      ),
    );
  }
}
