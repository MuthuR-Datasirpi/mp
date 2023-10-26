import 'package:mobile/core/network/rest_api_client.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/brands_response.dart';
import 'package:mobile/features/main/presentation/screens/home/domain/repository/brands_repository.dart';
import 'package:mobile/features/main/presentation/screens/home/domain/repository/home_repository.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/categories_response.dart';

class BrandsRepositoryImplementation extends BrandsRepository {
  BrandsRepositoryImplementation({
    required this.restAPIClient,
  });

  final RestAPIClient restAPIClient;

  @override
  Future<BrandsResponse> getAllBrands() async {
    return await restAPIClient.getAllBrands();
  }

  @override
  Future<BrandsResponse> getBrandsByCategoryId(int categoryId) async {
    return await restAPIClient.getBrandsByCategoryId(categoryId);
  }
}
