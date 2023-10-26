import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/address_model.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/brands_response.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/categories_response.dart';
import 'package:mobile/features/main/presentation/screens/home/domain/repository/brands_repository.dart';
import 'package:mobile/features/main/presentation/screens/home/domain/repository/home_repository.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/states/home_screen_states.dart';

class HomeScreenCubit extends Cubit<HomeScreenStates> {
  HomeScreenCubit({
    required this.repository,
    required this.brandsRepository,
  }) : super(const HomeScreenStates.initial());

  final HomeRepository repository;
  final BrandsRepository brandsRepository;

  void getHomeData(BuildContext context) async {
    emit(const HomeScreenStates.loading());
    final categories = await _getCategories();
    final brands = await _getBrands();
    //TODO:address is not used anywhere
    //final address = await getAddress();
    emit(HomeScreenStates.onHomeDataFetched(categories, brands, brands));
  }

  Future<List<Category>> _getCategories() async {
    List<Category> categories = [];
    try {
      final response = await repository.getAllCategories(page: 1, size: 10);
      categories = response.categories;
    } on DioException catch (e) {
      emit(HomeScreenStates.onError(e.message.toString()));
    }
    return categories;
  }

  Future<List<Brand>> _getBrands() async {
    List<Brand> brands = [];
    try {
      final response = await brandsRepository.getAllBrands();
      brands = response.brands;
    } on DioException catch (e) {
      emit(HomeScreenStates.onError(e.message.toString()));
    }
    return brands;
  }

  Future<AddressResponse?> getAddress() async {
    AddressResponse? responseObject;
    try {
      final response = await repository.getAddresses();
      responseObject = response;
    } on DioException catch (e) {
      emit(HomeScreenStates.onError(e.message.toString()));
    }
    return responseObject;
  }
}
