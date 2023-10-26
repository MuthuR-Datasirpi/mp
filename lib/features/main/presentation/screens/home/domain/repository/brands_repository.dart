import 'package:mobile/features/main/presentation/screens/home/data/models/brands_response.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/categories_response.dart';

abstract class BrandsRepository {
  Future<BrandsResponse> getAllBrands();
  Future<BrandsResponse> getBrandsByCategoryId(int categoryId);
}
