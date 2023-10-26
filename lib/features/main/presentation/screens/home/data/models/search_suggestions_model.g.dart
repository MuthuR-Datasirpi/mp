// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_suggestions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchSuggestions _$SearchSuggestionsFromJson(Map<String, dynamic> json) =>
    SearchSuggestions(
      (json['suggestions'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$SearchSuggestionsToJson(SearchSuggestions instance) =>
    <String, dynamic>{
      'suggestions': instance.suggestions,
    };
