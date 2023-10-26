import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/brands_response.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/categories_response.dart';

part 'home_screen_states.freezed.dart';

@Freezed()
class HomeScreenStates with _$HomeScreenStates {
  const factory HomeScreenStates.initial() = initial;
  const factory HomeScreenStates.loading() = showloading;
  const factory HomeScreenStates.onError(String? error) = showError;
  const factory HomeScreenStates.onHomeDataFetched(List<Category> categories,List<Brand> trendingBrands,List<Brand> brands) = onHomeDataFetched;
}
