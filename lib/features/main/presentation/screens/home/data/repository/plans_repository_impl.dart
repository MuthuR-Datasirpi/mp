import 'package:mobile/core/network/rest_api_client.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/brands_response.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/plans_response.dart';
import 'package:mobile/features/main/presentation/screens/home/domain/repository/brands_repository.dart';
import 'package:mobile/features/main/presentation/screens/home/domain/repository/home_repository.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/categories_response.dart';

import '../../domain/repository/plans_repository.dart';

class PlansRepositoryImplementation extends PlansRepository {
  PlansRepositoryImplementation({
    required this.restAPIClient,
  });

  final RestAPIClient restAPIClient;



  @override
  Future<PlansResponse> getPlansByBrandId(int brandId) async {
    return await restAPIClient.getPlansByBrandId(brandId);
  }
}
