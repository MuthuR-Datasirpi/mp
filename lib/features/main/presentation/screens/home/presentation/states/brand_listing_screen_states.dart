import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/brands_response.dart';

part 'brand_listing_screen_states.freezed.dart';

@Freezed()
class BrandListingScreenStates with _$BrandListingScreenStates {
  const factory BrandListingScreenStates.initial() = initial;
  const factory BrandListingScreenStates.loading() = loading;
  const factory BrandListingScreenStates.onError(String error) = onError;
  const factory BrandListingScreenStates.onAllBrandsFetched(List<Brand> brands) = onAllBrandsFetched;
}
