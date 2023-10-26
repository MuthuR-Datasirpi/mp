import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/features/profile/data/models/name_request_model.dart';
import 'package:mobile/features/profile/data/models/name_response_model.dart';
import 'package:mobile/features/profile/domain/repository/profile_repository.dart';
import 'package:mobile/features/profile/presentation/states/first_last_name_screen_states.dart';

class NameCubit extends Cubit<NameScreenStates> {
  NameCubit({
    required this.firstLastRepository,
  }) : super(const NameScreenStates.initial());

  final ProfileRepository firstLastRepository;

  void addName(NameRequestModel payload) async {
    emit(const NameScreenStates.loading());
    try {
      final NameResponseModel response =
          await firstLastRepository.addName(payload);
      emit(NameScreenStates.onNameSaved(response));
    } on DioException catch (e) {
      emit(NameScreenStates.onError(e.message.toString()));
    }
  }
}
