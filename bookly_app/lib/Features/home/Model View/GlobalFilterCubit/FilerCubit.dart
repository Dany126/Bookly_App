import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(const FilterState(category: 'all'));

  void changeCategory(String category) {
    emit(FilterState(category: category));
  }
}

class FilterState extends Equatable {
  final String category;

  const FilterState({required this.category});

  @override
  List<Object?> get props => [category];
}
