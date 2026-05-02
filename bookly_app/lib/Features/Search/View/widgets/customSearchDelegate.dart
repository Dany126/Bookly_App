import 'package:bookly_app/Features/home/Model/book_model/book_model.dart';
import 'package:flutter/material.dart';

class BookSearchDelegate extends SearchDelegate<String> {
  final List<BookModel> books;
  BookSearchDelegate({required this.books});
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = books
        .where(
          (book) =>
              // book.volumeInfo.title.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final book = results[index];

        return ListTile(
          // leading: book["volumeInfo"]["imageLinks"]?.thumbnail != null
          //     ? Image.network(book.volumeInfo.imageLinks!.thumbnail, width: 50)
          //     : const Icon(Icons.book),

          // title: Text(book.volumeInfo.title),

          // subtitle: Text(book.volumeInfo.authors?.join(', ') ?? 'Unknown'),

          // onTap: () {
          //   close(context, book.volumeInfo.title);
          // },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
}
