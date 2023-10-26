import 'package:json_annotation/json_annotation.dart';
part 'search_suggestions_model.g.dart';



@JsonSerializable(createToJson: true)
class SearchSuggestions {
List<String>? suggestions;

  SearchSuggestions(
    this.suggestions,
 
  );

  factory SearchSuggestions.fromJson(Map<String, dynamic> json) =>
      _$SearchSuggestionsFromJson(json);

  Map<String, dynamic> toJson() => _$SearchSuggestionsToJson(this);
}




