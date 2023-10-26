import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/meal_plan.dart';
part 'plans_listing_screen_states.freezed.dart';

@Freezed()
class PlansListingScreenStates with _$PlansListingScreenStates {
  const factory PlansListingScreenStates.initial() = initial;
  const factory PlansListingScreenStates.loading() = loading;
  const factory PlansListingScreenStates.onError(String error) = onError;
  const factory PlansListingScreenStates.onAllPlansFetched(List<MealPlans> mealPlans) = onAllPlansFetched;
}
