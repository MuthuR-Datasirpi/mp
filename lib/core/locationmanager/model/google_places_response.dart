import 'package:json_annotation/json_annotation.dart';

part 'google_places_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GooglePlacesResponse {
  List<Predictions> predictions;
  String status;

  GooglePlacesResponse({
    required this.predictions,
    required this.status,
  });

  factory GooglePlacesResponse.fromJson(Map<String, dynamic> json) =>
      _$GooglePlacesResponseFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Predictions {
  String description;
  String placeId;
  StructuredFormatting structuredFormatting;

  Predictions({
    required this.description,
    required this.placeId,
    required this.structuredFormatting,
  });

  factory Predictions.fromJson(Map<String, dynamic> json) =>
      _$PredictionsFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class StructuredFormatting {
  String mainText;
  String? secondaryText;

  StructuredFormatting({
    required this.mainText,
    required this.secondaryText,
  }) {
    secondaryText = secondaryText ?? '';
  }

  factory StructuredFormatting.fromJson(Map<String, dynamic> json) =>
      _$StructuredFormattingFromJson(json);
}
