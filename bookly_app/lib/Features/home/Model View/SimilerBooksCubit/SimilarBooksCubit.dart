import 'package:bookly_app/Features/home/Model%20View/GlobalFilterCubit/FilerCubit.dart';
import 'package:bookly_app/Features/home/Model%20View/SimilerBooksCubit/SimilarBooksState.dart';
import 'package:bookly_app/Features/home/Model/Repo/repo.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo, this.filterCubit)
    : super(SimilarBooksInitial()) {
    filterCubit.stream.listen((filter) {
      fetchSimilarBooks(category: filter.category);
    });
  }
  final FilterCubit filterCubit;

  final HomeRepo homeRepo;

  String? currentCategory;

  Future<void> fetchSimilarBooks({required String category}) async {
    if (currentCategory == category && state is SimilarBooksSuccess) {
      return;
    }

    currentCategory = category;

    emit(SimilarBooksLoading());

    final result = await homeRepo.fetchSimilarBooks(category: category);

    result.fold(
      (failure) {
        emit(SimilarBooksFailure(failure));
      },
      (books) {
        emit(SimilarBooksSuccess(similarBooks: books));
      },
    );
  }
}
