import 'package:bookly_app/Features/home/Model%20View/FeatureBooksCubit/feature_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeatureBooksCubit extends Cubit<FeatureBooksState> {
  FeatureBooksCubit(this._fetchFeatureBooksUseCase)
    : super(FeatureBooksInitial());

  final FetchFeatureBooksUseCase _fetchFeatureBooksUseCase;
  List<Item> _allBooks = []; // ✅ class-level field, not local variable

  Future<void> fetchFeatureBooks() async {
    emit(FeatureBooksLoading());
    final result = await _fetchFeatureBooksUseCase.call();
    result.fold((failure) => emit(FeatureBooksFailure(failure)), (books) {
      _allBooks = books; // ✅ save original list
      emit(FeatureBooksSuccess(books));
    });
  }

  void filterByCategory(String query) {
    if (_allBooks.isEmpty) return;

    if (query == "all") {
      emit(FeatureBooksSuccess(_allBooks)); // ✅ restore full list
      return;
    }

    final filtered = _allBooks.where((book) {
      final categories =
          book?.volumeInfo.categories?.map((c) => c.toLowerCase()).toList() ??
          [];
      final title = book.volumeInfo?.title?.toLowerCase() ?? "";
      final author = book.volumeInfo?.authors?.join(" ").toLowerCase() ?? "";

      // ✅ Check category first, fallback to title/author
      return categories.any((c) => c.contains(query.toLowerCase())) ||
          title.contains(query.toLowerCase()) ||
          author.contains(query.toLowerCase());
    }).toList();

    emit(
      filtered.isEmpty
          ? const FeatureBooksSuccess([]) // or emit a NoResults state
          : FeatureBooksSuccess(filtered),
    );
  }
}
