import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/categories_response.dart';

part 'category_listing_screen_states.freezed.dart';

@Freezed()
class CategoryListingScreenStates with _$CategoryListingScreenStates {
  const factory CategoryListingScreenStates.initial() = initial;
  const factory CategoryListingScreenStates.loading() = loading;
  const factory CategoryListingScreenStates.onError(String error) = onError;
  const factory CategoryListingScreenStates.onAllCategoriesFetched(List<Category> categories) = onAllCategoriesFetched;
}
