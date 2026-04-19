import 'package:bookly_app/Features/Search/View/searchView.dart';
import 'package:bookly_app/Features/Splash/view/splash_view.dart';
import 'package:bookly_app/Features/home/View/detailsPage.dart';
import 'package:bookly_app/Features/home/View/homepage.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String splashRoute = '/';
  static const String homeRoute = '/home';
  static const String searchRoute = '/search';
  static const String detailsRoute = '/details';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: splashRoute,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(path: homeRoute, builder: (context, state) => const HomePage()),
      GoRoute(
        path: searchRoute,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: detailsRoute,
        builder: (context, state) => const DetailsPage(),
      ),
    ],
  );
}
