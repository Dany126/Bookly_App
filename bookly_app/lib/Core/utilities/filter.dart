import 'package:bookly_app/Features/home/Model%20View/FeatureBooksCubit/feature_books_state.dart';
import 'package:bookly_app/Features/home/Model/book_model/item.dart';

void filterByCategory(String query) {
  if (query == "all") {
    List<Item> _allBooks;
    emit(FeatureBooksSuccess(_allBooks));
    return;
  }

  final filtered = _allBooks.where((book) {
    final title = book.volumeInfo?.title?.toLowerCase() ?? "";
    final author = book.volumeInfo?.authors?.join(" ").toLowerCase() ?? "";

    return title.contains(query.toLowerCase()) ||
        author.contains(query.toLowerCase());
  }).toList();

  emit(FeatureBooksSuccess(filtered));
}
