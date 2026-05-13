import 'package:bookly_app/Core/error/failure.dart';
import 'package:bookly_app/Core/utilities/api_services.dart';
import 'package:bookly_app/Core/utilities/cash_service.dart';
import 'package:bookly_app/Core/utilities/network_info.dart';
import 'package:bookly_app/Features/home/Model/book_model/item.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepo {
  final ApiService apiService;
  final NetworkInfo networkInfo;

  HomeRepo(this.apiService, this.networkInfo);

  // ===============================
  // FEATURE / FEED BOOKS (NO CATEGORY)
  // ===============================
  Future<Either<Failure, List<Item>>> fetchFeatureBooks() async {
    const cacheKey = 'feature_books';

    return _fetchBooks(cacheKey: cacheKey, endpoint: 'volumes?q=programming');
  }

  // ===============================
  // NEWEST BOOKS (CATEGORY BASED)
  // ===============================
  Future<Either<Failure, List<Item>>> fetchNewestBooks({
    required String categoryName,
  }) async {
    final cacheKey = 'newest_$categoryName';

    return _fetchBooks(cacheKey: cacheKey, endpoint: 'volumes?q=$categoryName');
  }

  // ===============================
  // SIMILAR BOOKS (CATEGORY BASED)
  // ===============================
  Future<Either<Failure, List<Item>>> fetchSimilarBooks({
    required String category,
  }) async {
    final cacheKey = 'similar_$category';

    return _fetchBooks(cacheKey: cacheKey, endpoint: 'volumes?q=$category');
  }

  // ===============================
  // CORE LOGIC (REUSABLE)
  // ===============================
  Future<Either<Failure, List<Item>>> _fetchBooks({
    required String cacheKey,
    required String endpoint,
  }) async {
    try {
      final isConnected = await networkInfo.isConnected();

      // ===============================
      // OFFLINE FIRST
      // ===============================
      if (!isConnected) {
        final cachedData = CacheService.getData(key: cacheKey);

        if (cachedData != null) {
          return Right(_parseBooks(cachedData));
        }

        return Left(NetworkFailure('No internet connection'));
      }

      // ===============================
      // API REQUEST
      // ===============================
      final response = await apiService.get(endPoint: endpoint);

      final books = response.data['items'] as List<dynamic>? ?? [];

      // ===============================
      // CACHE RESULT
      // ===============================
      await CacheService.saveData(key: cacheKey, value: books);

      return Right(_parseBooks(books));
    } on DioException catch (e) {
      // ===============================
      // FALLBACK TO CACHE
      // ===============================
      final cachedData = CacheService.getData(key: cacheKey);

      if (cachedData != null) {
        return Right(_parseBooks(cachedData));
      }

      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  List<Item> _parseBooks(dynamic data) {
    if (data == null) {
      return [];
    }

    return (data as List<dynamic>)
        .map((item) => Item.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
