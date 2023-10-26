import 'package:mobile/core/locationmanager/model/google_places_response.dart';

class PlacesPrediction {
  const PlacesPrediction({
    required this.placeId,
    required this.primaryText,
    required this.secondaryText,
    required this.fullText,
  });

  final String placeId;
  final String primaryText;
  final String secondaryText;
  final String fullText;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlacesPrediction &&
          runtimeType == other.runtimeType &&
          placeId == other.placeId &&
          primaryText == other.primaryText &&
          secondaryText == other.secondaryText &&
          fullText == other.fullText;

  @override
  int get hashCode =>
      placeId.hashCode ^
      primaryText.hashCode ^
      secondaryText.hashCode ^
      fullText.hashCode;

  @override
  String toString() =>
      'PlacesPrediction{placeId: $placeId, primaryText: $primaryText, secondaryText: $secondaryText, fullText: $fullText}';

  Map<String, dynamic> toMap() => {
        'placeId': placeId,
        'primaryText': primaryText,
        'secondaryText': secondaryText,
        'fullText': fullText,
      };

  static PlacesPrediction fromMap(Map<String, dynamic> map) => PlacesPrediction(
        placeId: map['placeId'],
        primaryText: map['primaryText'],
        secondaryText: map['secondaryText'],
        fullText: map['fullText'],
      );

  static PlacesPrediction mapPredictionToPlacesPrediction(
      Predictions prediction) {
    return PlacesPrediction(
      placeId: prediction.placeId,
      primaryText: prediction.structuredFormatting.mainText,
      secondaryText: prediction.structuredFormatting.secondaryText.toString(),
      fullText: prediction.description,
    );
  }
}
