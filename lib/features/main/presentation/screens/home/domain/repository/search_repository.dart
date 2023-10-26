import 'package:mobile/features/main/presentation/screens/home/data/models/brands_response.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/categories_response.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/plans_response.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/search_response.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/search_suggestions_model.dart';

abstract class SearchRepository {
  Future<SearchResponse> search(Map<String, dynamic> searchData);
  Future<SearchSuggestions> getSearchSuggestions(String term);
}
