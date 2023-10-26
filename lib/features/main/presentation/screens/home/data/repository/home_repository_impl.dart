import 'package:mobile/core/network/rest_api_client.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/address_model.dart';
import 'package:mobile/features/main/presentation/screens/home/domain/repository/home_repository.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/categories_response.dart';


class HomeRepositoryImplementation extends HomeRepository {
  HomeRepositoryImplementation({
    required this.restAPIClient,
  });

  final RestAPIClient restAPIClient;

  @override
  Future<CategoriesResponse> getAllCategories({int? page, int? size}) async {
    return await restAPIClient.getAllCategories(page, size);
  }

    @override
  Future<AddressResponse> getAddresses() async {
    return await restAPIClient.getAddress();
  }
}
