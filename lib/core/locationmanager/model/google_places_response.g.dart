// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_places_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GooglePlacesResponse _$GooglePlacesResponseFromJson(
        Map<String, dynamic> json) =>
    GooglePlacesResponse(
      predictions: (json['predictions'] as List<dynamic>)
          .map((e) => Predictions.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$GooglePlacesResponseToJson(
        GooglePlacesResponse instance) =>
    <String, dynamic>{
      'predictions': instance.predictions,
      'status': instance.status,
    };

Predictions _$PredictionsFromJson(Map<String, dynamic> json) => Predictions(
      description: json['description'] as String,
      placeId: json['place_id'] as String,
      structuredFormatting: StructuredFormatting.fromJson(
          json['structured_formatting'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PredictionsToJson(Predictions instance) =>
    <String, dynamic>{
      'description': instance.description,
      'place_id': instance.placeId,
      'structured_formatting': instance.structuredFormatting,
    };

StructuredFormatting _$StructuredFormattingFromJson(
        Map<String, dynamic> json) =>
    StructuredFormatting(
      mainText: json['main_text'] as String,
      secondaryText: json['secondary_text'] as String?,
    );

Map<String, dynamic> _$StructuredFormattingToJson(
        StructuredFormatting instance) =>
    <String, dynamic>{
      'main_text': instance.mainText,
      'secondary_text': instance.secondaryText,
    };
