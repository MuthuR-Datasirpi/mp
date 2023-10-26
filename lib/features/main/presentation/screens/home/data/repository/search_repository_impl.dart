import 'package:mobile/core/network/rest_api_client.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/brands_response.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/plans_response.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/search_response.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/search_suggestions_model.dart';
import 'package:mobile/features/main/presentation/screens/home/domain/repository/brands_repository.dart';
import 'package:mobile/features/main/presentation/screens/home/domain/repository/home_repository.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/categories_response.dart';

import '../../domain/repository/plans_repository.dart';
import '../../domain/repository/search_repository.dart';

class SearchRepositoryImplementation extends SearchRepository {
  SearchRepositoryImplementation({
    required this.restAPIClient,
  });

  final RestAPIClient restAPIClient;

  @override
  Future<SearchResponse> search(Map<String, dynamic> searchData) async {
    return await restAPIClient.search(searchData: searchData);
  }

  @override
  Future<SearchSuggestions> getSearchSuggestions(String term) async {
    return await restAPIClient.getSearchSuggestions(term);
  }
}
