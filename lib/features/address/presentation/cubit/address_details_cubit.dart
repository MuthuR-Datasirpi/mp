import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/features/address/data/models/address_details_request.dart';
import 'package:mobile/features/address/data/models/address_details_response.dart';
import 'package:mobile/features/address/domain/repository/address_details_repository.dart';
import 'package:mobile/features/address/presentation/states/address_details_screen_states.dart';
import 'package:mobile/features/profile/domain/repository/profile_repository.dart';

class AddressDetailsScreenCubit extends Cubit<AddressDetailsScreenStates> {
  AddressDetailsScreenCubit({
    required this.repository,
    required this.profileRepository,
  }) : super(const AddressDetailsScreenStates.initial());

  final AddressDetailsRepository repository;
  final ProfileRepository profileRepository;

  void saveAddress(AddressDetailsRequest payload) async {
    emit(const AddressDetailsScreenStates.loading());
    try {
      final response = await repository.saveAddress(payload);
      emit(AddressDetailsScreenStates.onSavedAddress(response));
    } on DioException catch (e) {
      emit(AddressDetailsScreenStates.onError(e.message.toString()));
    }
  }

  void getAddressData() async {
    emit(const AddressDetailsScreenStates.loading());
    final addressTypes = await getAddressTypes();
    final cities = await profileRepository.getCities();
    emit(AddressDetailsScreenStates.onAddressDataFetched(
        addressTypes, cities.payload));
  }

  Future<List<AddressTypesResponseObject?>?> getAddressTypes() async {
    List<AddressTypesResponseObject?>? addressTypes = [];
    try {
      final AddressTypesResponse response = await repository.getAddressTypes();
      addressTypes = response.payload;
    } on DioException catch (e) {
      emit(AddressDetailsScreenStates.onError(e.message.toString()));
    }
    return addressTypes;
  }
}
