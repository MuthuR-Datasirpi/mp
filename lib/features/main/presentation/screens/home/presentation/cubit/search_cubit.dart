import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/search_response.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/search_suggestions_model.dart';
import 'package:mobile/features/main/presentation/screens/home/domain/repository/search_repository.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/states/search_screen_states.dart';

class SearchCubit extends Cubit<SearchScreenStates> {
  SearchCubit({
    required this.repository,
  }) : super(const SearchScreenStates.initial());

  final SearchRepository repository;
  SearchResponse response = SearchResponse(0, [], []);
  SearchSuggestions searchSuggestions = SearchSuggestions([]);

  void reset() {
    response = SearchResponse(0, [], []);

    emit(
      SearchScreenStates.initial(),
    );
  }

  void search(String searchText) async {
    Map<String, dynamic> searchBody = {
      "search": [
        {"value": searchText, "type": ""}
      ]
    };

    emit(const SearchScreenStates.loading());
    try {
      response = await repository.search(searchBody);
      response.brands ??= [];
      response.categories ??= [];
      if(response.brands!.length == 0 && response.categories!.length ==0){
        response.searchResultCount = 0;
      }
      emit(
        SearchScreenStates.onSearchFetched(response),
      );
    } on DioException catch (e) {
      emit(SearchScreenStates.onError(e.message.toString()));
    }
  }
  void getSearchSuggestions(String searchText) async {


    emit(const SearchScreenStates.suggestionsLoading());
    try {
      searchSuggestions = await repository.getSearchSuggestions(searchText);


      // emit(
      //   SearchScreenStates.onSearchFetched(response),
      // );
    } on DioException catch (e) {
      emit(SearchScreenStates.onError(e.message.toString()));
    }
  }


  void updateState(){
    emit(SearchScreenStates.initial());
  }



}
