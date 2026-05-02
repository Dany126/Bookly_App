import 'package:bookly_app/Features/home/Model%20View/FeatureBooksCubit/feature_books_state.dart';
import 'package:bookly_app/Features/home/Model/Repo/repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeatureBooksCubit extends Cubit<FeatureBooksState> {
  FeatureBooksCubit(this.homeRepo) : super(FeatureBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchFeatureBooks({required String categoryName}) async {
    emit(FeatureBooksInitial());
    var result = await homeRepo.fetchFeaturedBooks(categoryName: categoryName);
    result.fold(
      (failure) {
        emit(FeatureBooksFailure(failure.message));
      },
      (books) {
        emit(FeatureBooksSuccess(books));
      },
    );
  }
}
