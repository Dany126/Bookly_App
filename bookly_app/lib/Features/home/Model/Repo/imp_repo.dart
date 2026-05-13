import 'package:bookly_app/Core/utilities/api_services.dart';
import 'package:bookly_app/Core/error/failure.dart';
import 'package:bookly_app/Core/utilities/cash_service.dart';
import 'package:bookly_app/Core/utilities/network_info.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepo {
  final ApiService apiService;
  final NetworkInfo networkInfo;

  HomeRepo(this.apiService, this.networkInfo);

  Future<Either<Failure, List<dynamic>>> fetchBooks() async {
    const cacheKey = 'featured_books';

    try {
      // ===============================
      // Check Internet
      // ===============================

      final isConnected = await networkInfo.isConnected();

      // ===============================
      // OFFLINE FIRST
      // ===============================

      if (!isConnected) {
        final cachedData = CacheService.getData(key: cacheKey);

        if (cachedData != null) {
          return Right(cachedData);
        }

        return Left(NetworkFailure('No internet connection'));
      }

      // ===============================
      // API REQUEST
      // ===============================

      final response = await apiService.get(endPoint: 'volumes?q=programming');

      final books = response.data['items'];

      // ===============================
      // SAVE CACHE
      // ===============================

      await CacheService.saveData(key: cacheKey, value: books);

      return Right(books);
    } on DioException catch (e) {
      // ===============================
      // RETURN CACHE IF API FAILS
      // ===============================

      final cachedData = CacheService.getData(key: cacheKey);

      if (cachedData != null) {
        return Right(cachedData);
      }

      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}
