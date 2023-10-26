import 'package:mobile/features/main/presentation/screens/home/data/models/brands_response.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/categories_response.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/plans_response.dart';

abstract class PlansRepository {
  Future<PlansResponse> getPlansByBrandId(int brandId);
}
