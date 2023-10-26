import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/features/profile/data/models/city_location_response_model.dart';
import 'package:mobile/features/profile/data/models/city_selection_request_model.dart';
import 'package:mobile/features/profile/data/models/city_selection_response_model.dart';
import 'package:mobile/features/profile/domain/repository/profile_repository.dart';
import 'package:mobile/features/profile/presentation/states/city_selection_states.dart';

class CityCubit extends Cubit<CityScreenStates> {
  CityCubit({
    required this.repository,
  }) : super(const CityScreenStates.initial());

  final ProfileRepository repository;
  void saveCity(CityRequestModel payload) async {
    try {
      final SaveCityResponseModel response = await repository.saveCity(payload);
      emit(CityScreenStates.onSavedCity(response));
    } on DioException catch (e) {
      emit(CityScreenStates.onError(e.message.toString()));
    }
    return null;
  }

  void getCities() async {
    emit(const CityScreenStates.loading());
    try {
      final CityLocationResponseModel response = await repository.getCities();
      emit(
        CityScreenStates.onCitiesFetched(response.payload),
      );
    } on DioException catch (e) {
      emit(CityScreenStates.onError(e.message.toString()));
    }
  }

  void searchCities(
      String searchText, List<CityLocationResponseObject?>? cities) {
    final filteredCities = cities!
        .where((city) =>
            city!.name!.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
    emit(
      CityScreenStates.onCitiesFiltered(filteredCities),
    );
  }
}
