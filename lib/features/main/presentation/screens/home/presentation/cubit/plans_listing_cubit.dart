import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/states/plans_listing_screen_states.dart';
import '../../domain/repository/plans_repository.dart';

class PlanListingCubit extends Cubit<PlansListingScreenStates> {
  PlanListingCubit({
    required this.repository,
  }) : super(const PlansListingScreenStates.initial());

  final PlansRepository repository;

  void getPlansByBrandId(int brandId) async {
    emit(const PlansListingScreenStates.loading());
    try {
      final response = await repository.getPlansByBrandId(brandId);
      emit(
        PlansListingScreenStates.onAllPlansFetched(response.mealPlans!),
      );
    } on DioException catch (e) {
      emit(PlansListingScreenStates.onError(e.message.toString()));
    }
  }
}
