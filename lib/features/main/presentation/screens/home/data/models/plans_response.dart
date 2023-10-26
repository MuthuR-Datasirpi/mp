import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/meal_plan.dart';

part 'plans_response.g.dart';



@JsonSerializable(createToJson: false)
class PlansResponse {
  String? message;
  List<MealPlans>? mealPlans;

  PlansResponse(this.message, this.mealPlans);

  factory PlansResponse.fromJson(Map<String, dynamic> json) =>
      _$PlansResponseFromJson(json);
}

