import 'package:bookly_app/Core/utilities/api_services.dart';
import 'package:bookly_app/Core/utilities/dio_factory.dart';
import 'package:bookly_app/Core/utilities/network_info.dart';
import 'package:bookly_app/Features/home/Model%20View/FeatureBooksCubit/feature_books_cubit.dart';
import 'package:bookly_app/Features/home/Model%20View/NewestBooksCubit/NewestBooksCubit.dart';
import 'package:bookly_app/Features/home/Model%20View/SimilerBooksCubit/SimilarBooksCubit.dart';

import 'package:bookly_app/Features/home/Model/Repo/imp_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  // ===============================
  // CORE
  // ===============================
  getIt.registerLazySingleton<Dio>(() => DioFactory.createDio());

  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));

  // ✅ ADD THIS (IMPORTANT FIX)
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfo());

  // ===============================
  // REPOSITORY
  // ===============================
  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepo(
      getIt<ApiService>(),
      getIt<NetworkInfo>(), // ✅ FIX HERE
    ),
  );

  // ===============================
  // CUBITS
  // ===============================
  getIt.registerFactory(() => FeatureBooksCubit(getIt<HomeRepo>()));

  getIt.registerFactory(() => NewestBooksCubit(getIt<HomeRepo>()));

  getIt.registerFactory(() => SimilarBooksCubit(getIt<HomeRepo>()));
}
