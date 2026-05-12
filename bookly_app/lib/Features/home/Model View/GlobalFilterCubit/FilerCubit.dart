import 'package:bookly_app/Features/home/Model%20View/GlobalFilterCubit/FilterState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(const FilterState(category: 'all'));

  void changeCategory(String category) {
    emit(FilterState(category: category));
  }
}
