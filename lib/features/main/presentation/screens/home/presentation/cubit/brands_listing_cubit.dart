import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/features/main/presentation/screens/home/domain/repository/brands_repository.dart';
import 'package:mobile/features/main/presentation/screens/home/domain/repository/home_repository.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/states/brand_listing_screen_states.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/states/category_listing_screen_states.dart';

class BrandListingCubit extends Cubit<BrandListingScreenStates> {
  BrandListingCubit({
    required this.repository,
  }) : super(const BrandListingScreenStates.initial());

  final BrandsRepository repository;

  void getAllBrands() async {
    emit(const BrandListingScreenStates.loading());
    try {
      final response = await repository.getAllBrands();
      emit(
        BrandListingScreenStates.onAllBrandsFetched(response.brands),
      );
    } on DioException catch (e) {
      emit(BrandListingScreenStates.onError(e.message.toString()));
    }
  }

  void getBrandsByCategoryId(int categoryId) async {
    emit(const BrandListingScreenStates.loading());
    try {
      final response = await repository.getBrandsByCategoryId(categoryId);
      emit(
        BrandListingScreenStates.onAllBrandsFetched(response.brands),
      );
    } on DioException catch (e) {
      emit(BrandListingScreenStates.onError(e.message.toString()));
    }
  }
}
