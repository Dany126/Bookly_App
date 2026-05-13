import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly_app/Features/home/Model/book_model/item.dart';
import 'package:bookly_app/Features/home/Model/Repo/imp_repo.dart';
import 'feature_books_state.dart';

class FeatureBooksCubit extends Cubit<FeatureBooksState> {
  FeatureBooksCubit(this.repo) : super(FeatureBooksInitial());

  final HomeRepo repo;

  List<Item> _allBooks = [];

  Future<void> fetchFeatureBooks() async {
    emit(FeatureBooksLoading());

    final result = await repo.fetchFeatureBooks();

    result.fold((failure) => emit(FeatureBooksFailure(failure)), (books) {
      _allBooks = books;
      emit(FeatureBooksSuccess(books));
    });
  }

  void search(String query) {
    if (_allBooks.isEmpty) return;

    final lower = query.toLowerCase();

    final filtered = _allBooks.where((book) {
      final info = book.volumeInfo;

      final title = info?.title?.toLowerCase() ?? "";
      final author = info?.authors?.join(" ").toLowerCase() ?? "";

      return title.contains(lower) || author.contains(lower);
    }).toList();

    emit(FeatureBooksSuccess(filtered));
  }
}
