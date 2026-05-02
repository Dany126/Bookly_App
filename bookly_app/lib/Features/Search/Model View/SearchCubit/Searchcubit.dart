import 'package:bookly_app/Features/Search/Model%20View/SearchCubit/SearchState.dart';
import 'package:bookly_app/Features/Search/Model/Repo/SearchRepo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  SearchRepo searchRepo;

  Future<void> fetchAllBooks() async {
    final result = await searchRepo.fetchAllBooks();
    result.fold(
      (failure) {
        emit(SearchFailure(failure.message));
      },
      (books) {
        emit(SearchSuccess(books));
      },
    );
  }
}
