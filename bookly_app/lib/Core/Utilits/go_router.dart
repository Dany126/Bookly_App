import 'package:bookly_app/Features/Search/View/searchView.dart';
import 'package:bookly_app/Features/Splash/view/splash_view.dart';
import 'package:bookly_app/Features/home/View/homepage.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String splashRoute = '/';
  static const String homeRoute = '/home';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: splashRoute,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(path: homeRoute, builder: (context, state) => const HomePage()),
      GoRoute(path: "/search", builder: (context, state) => const SearchView()),
    ],
  );
}
