import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/meal_plan.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/search_response.dart';
part 'search_screen_states.freezed.dart';

@Freezed()
class SearchScreenStates with _$SearchScreenStates {
  const factory SearchScreenStates.initial() = initial;
  const factory SearchScreenStates.loading() = loading;
  const factory SearchScreenStates.onError(String error) = onError;
  const factory SearchScreenStates.onSearchFetched(SearchResponse searchResponse) = onSearchFetched;
  const factory SearchScreenStates.suggestionsInitial() = suggestionsInitial;
  const factory SearchScreenStates.suggestionsLoading() = suggestionsLoading;
}
