import 'package:kiwi/kiwi.dart';
import 'package:mobile/features/address/data/repository/address_details_repository_impl.dart';
import 'package:mobile/features/address/domain/repository/address_details_repository.dart';
import 'package:mobile/features/auth/data/repository/auth_repository_impl.dart';
import 'package:mobile/features/auth/domain/repository/auth_repository.dart';
import 'package:mobile/features/main/presentation/screens/home/data/repository/brands_repository_impl.dart';
import 'package:mobile/features/main/presentation/screens/home/data/repository/home_repository_impl.dart';
import 'package:mobile/features/main/presentation/screens/home/data/repository/plans_repository_impl.dart';
import 'package:mobile/features/main/presentation/screens/home/data/repository/search_repository_impl.dart';
import 'package:mobile/features/main/presentation/screens/home/domain/repository/brands_repository.dart';
import 'package:mobile/features/main/presentation/screens/home/domain/repository/home_repository.dart';
import 'package:mobile/features/main/presentation/screens/home/domain/repository/plans_repository.dart';
import 'package:mobile/features/main/presentation/screens/home/domain/repository/search_repository.dart';
import 'package:mobile/features/profile/data/repository/profile_repository_impl.dart';
import 'package:mobile/features/profile/domain/repository/profile_repository.dart';

abstract class RepositoryModule {
  static late KiwiContainer _container;

  static void setup(KiwiContainer container) {
    _container = container;
    _setupAuthRepository();
    _setupHomeRepository();
    _setupBrandsRepository();
    _setupPlansRepository();
    _setupSearchRepository();
    _setupProfileRepository();
    _setupAddressDetailsRepository();
  }

  static void _setupHomeRepository() {
    _container.registerSingleton<HomeRepository>(
      (_) => HomeRepositoryImplementation(
        restAPIClient: _container.resolve(),
      ),
    );
  }

  static void _setupBrandsRepository() {
    _container.registerSingleton<BrandsRepository>(
      (_) => BrandsRepositoryImplementation(
        restAPIClient: _container.resolve(),
      ),
    );
  }

  static void _setupPlansRepository() {
    _container.registerSingleton<PlansRepository>(
      (_) => PlansRepositoryImplementation(
        restAPIClient: _container.resolve(),
      ),
    );
  }

  static void _setupAuthRepository() {
    _container.registerSingleton<AuthRepository>(
      (_) => AuthRepositoryImplementation(
        restAPIClient: _container.resolve(),
      ),
    );
  }

  static void _setupProfileRepository() {
    _container.registerSingleton<ProfileRepository>(
      (_) => ProfileRepositoryImplementation(
        restAPIClient: _container.resolve(),
      ),
    );
  }

  static void _setupSearchRepository() {
    _container.registerSingleton<SearchRepository>(
      (_) => SearchRepositoryImplementation(
        restAPIClient: _container.resolve(),
      ),
    );
  }

    static void _setupAddressDetailsRepository() {
    _container.registerSingleton<AddressDetailsRepository>(
      (_) => AddressDetailsRepositoryImplementation(
        restAPIClient: _container.resolve(),
      ),
    );
  }
}
