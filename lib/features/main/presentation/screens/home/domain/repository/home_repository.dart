import 'package:mobile/features/main/presentation/screens/home/data/models/address_model.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/categories_response.dart';


abstract class HomeRepository {
  Future<CategoriesResponse> getAllCategories({int? page,int? size});
  Future<AddressResponse> getAddresses();

}
