import 'package:bookly_app/Features/home/Model%20View/NewestBooksCubit/NewestBooksState.dart';
import 'package:bookly_app/Features/home/Model/Repo/repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchNewestBooks({required String categoryName}) async {
    emit(NewestBooksLoading());
    var request = await homeRepo.fetchNewestBooks(categoryName: categoryName);
    request.fold(
      (failure) {
        failure.message;
      },
      (books) {
        emit(NewestBooksSuccess(books));
      },
    );
  }
}
