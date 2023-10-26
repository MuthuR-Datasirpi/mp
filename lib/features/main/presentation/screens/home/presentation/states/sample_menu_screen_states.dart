import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/brands_response.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/categories_response.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/sample_menu_response.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/widgets/sample_menu_days_widget.dart';

part 'sample_menu_screen_states.freezed.dart';

@Freezed()
class SampleMenuScreenStates with _$SampleMenuScreenStates {
  const factory SampleMenuScreenStates.initial() = initial;
  const factory SampleMenuScreenStates.loading() = loading;
  const factory SampleMenuScreenStates.onError(String error) = onError;
  const factory SampleMenuScreenStates.onMenuFetched(Weekday weekday,List<MenuGroup> menuGroups) = onMenuFetched;
}
