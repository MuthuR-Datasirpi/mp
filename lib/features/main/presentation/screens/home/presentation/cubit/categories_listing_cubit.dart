import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/features/main/presentation/screens/home/domain/repository/home_repository.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/states/category_listing_screen_states.dart';

class CategoryListingCubit extends Cubit<CategoryListingScreenStates> {
  CategoryListingCubit({
    required this.repository,
  }) : super(const CategoryListingScreenStates.initial());

  final HomeRepository repository;

  void getAllCategories() async {
    emit(const CategoryListingScreenStates.loading());
    try {
      final response = await repository.getAllCategories();
      emit(
        CategoryListingScreenStates.onAllCategoriesFetched(response.categories),
      );
    } on DioException catch (e) {
      emit(CategoryListingScreenStates.onError(e.message.toString()));
    }
  }
}
