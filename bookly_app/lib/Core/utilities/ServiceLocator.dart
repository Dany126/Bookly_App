import 'package:bookly_app/Core/utilities/api_services.dart';
import 'package:bookly_app/Features/home/Model/Repo/imp_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<Dio>(Dio());

  getIt.registerSingleton<ApiServices>(ApiServices(getIt.get<Dio>()));

  getIt.registerSingleton<ImplementationRepo>(
    ImplementationRepo(getIt.get<ApiServices>()),
  );
}
