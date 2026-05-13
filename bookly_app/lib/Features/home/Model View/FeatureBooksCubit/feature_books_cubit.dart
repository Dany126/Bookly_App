import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bookly_app/Features/home/Model/book_model/item.dart';
import 'package:bookly_app/Features/home/Model View/FeatureBooksCubit/feature_books_state.dart';
import 'package:bookly_app/Features/home/Model/Repo/imp_repo.dart';

class FeatureBooksCubit extends Cubit<FeatureBooksState> {
  FeatureBooksCubit(this.repo) : super(FeatureBooksInitial());

  final HomeRepo repo;

  List<Item> _allBooks = [];

  Future<void> fetchFeatureBooks({required String categoryName}) async {
    emit(FeatureBooksLoading());

    final result = await repo.fetchFeaturedBooks(categoryName: categoryName);

    result.fold(
      (failure) {
        emit(FeatureBooksFailure(failure));
      },
      (books) {
        _allBooks = books;
        emit(FeatureBooksSuccess(books));
      },
    );
  }

  void filterByCategory(String query) {
    if (_allBooks.isEmpty) return;

    if (query.toLowerCase() == "all") {
      emit(FeatureBooksSuccess(_allBooks));
      return;
    }

    final lowerQuery = query.toLowerCase();

    final filtered = _allBooks.where((book) {
      final volumeInfo = book.volumeInfo;

      final categories =
          volumeInfo?.categories?.map((c) => c.toLowerCase()).toList() ?? [];

      final title = volumeInfo?.title?.toLowerCase() ?? "";

      final author = volumeInfo?.authors?.join(" ").toLowerCase() ?? "";

      return categories.any((c) => c.contains(lowerQuery)) ||
          title.contains(lowerQuery) ||
          author.contains(lowerQuery);
    }).toList();

    emit(FeatureBooksSuccess(filtered));
  }
}
