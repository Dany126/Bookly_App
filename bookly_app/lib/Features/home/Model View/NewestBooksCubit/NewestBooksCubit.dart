// ✅ Fix — store and cancel the subscription
import 'dart:async';

import 'package:bookly_app/Features/home/Model%20View/GlobalFilterCubit/FilerCubit.dart';
import 'package:bookly_app/Features/home/Model%20View/NewestBooksCubit/NewestBooksState.dart';
import 'package:bookly_app/Features/home/Model/Repo/repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.repo, this.filterCubit) : super(NewestBooksInitial()) {
    _subscription = filterCubit.stream.listen((filter) {
      fetchNewestBooks(category: filter.category);
    });
  }

  final HomeRepo repo;
  final FilterCubit filterCubit;
  late final StreamSubscription _subscription; // ✅ store it

  @override
  Future<void> close() {
    _subscription.cancel(); // ✅ cancel on cubit dispose
    return super.close();
  }

  Future<void> fetchNewestBooks({required String category}) async {
    emit(NewestBooksLoading());
    final result = await repo.fetchNewestBooks(categoryName: category);
    result.fold(
      (failure) => emit(NewestBooksFailure(failure.message)),
      (books) => emit(NewestBooksSuccess(books)),
    );
  }
}
