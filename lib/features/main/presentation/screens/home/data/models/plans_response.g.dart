// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plans_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlansResponse _$PlansResponseFromJson(Map<String, dynamic> json) =>
    PlansResponse(
      json['message'] as String?,
      (json['mealPlans'] as List<dynamic>?)
          ?.map((e) => MealPlans.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
