import 'package:kiwi/kiwi.dart';
import 'package:mobile/features/address/presentation/cubit/address_details_cubit.dart';
import 'package:mobile/features/address/presentation/cubit/location_screen_cubit.dart';
import 'package:mobile/features/auth/presentation/cubit/login_screen_cubit.dart';
import 'package:mobile/features/auth/presentation/cubit/otp_screen_cubit.dart';
import 'package:mobile/features/auth/presentation/cubit/pin_screen_cubit.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/cubit/brands_listing_cubit.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/cubit/categories_listing_cubit.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/cubit/home_screen_cubit.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/cubit/plans_listing_cubit.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/cubit/sample_menu_cubit.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/cubit/search_cubit.dart';
import 'package:mobile/features/profile/presentation/cubit/city_selection_cubit.dart';
import 'package:mobile/features/profile/presentation/cubit/first_last_name_cubit.dart';

abstract class CubitModule {
  static late KiwiContainer _container;

  static void setup(KiwiContainer container) {
    _container = container;
    _registerHomeScreenCubit();
    _registerCategoryListingCubit();
    _registerBrandListingCubit();
    _registerPlansScreenCubit();
    _registerLoginScreenCubit();
    _registerPinScreenCubit();
    _registerOtpScreenCubit();
    _registerNameScreenCubit();
    _registerCityScreenCubit();
    _registerSearchScreenCubit();
    _registerSampleMenuCubit();
    _registerAddressDetailsScreenCubit();
    _registerLocationScreenCubit();
  }

  static void _registerHomeScreenCubit() {
    _container.registerSingleton(
      (_) => HomeScreenCubit(
        repository: _container.resolve(),
        brandsRepository: _container.resolve(),
      ),
    );
  }

  static void _registerCategoryListingCubit() {
    _container.registerSingleton(
      (_) => CategoryListingCubit(
        repository: _container.resolve(),
      ),
    );
  }

  static void _registerBrandListingCubit() {
    _container.registerSingleton(
      (_) => BrandListingCubit(
        repository: _container.resolve(),
      ),
    );
  }

  static void _registerPlansScreenCubit() {
    _container.registerSingleton(
      (_) => PlanListingCubit(
        repository: _container.resolve(),
      ),
    );
  }

  static void _registerSearchScreenCubit() {
    _container.registerSingleton(
      (_) => SearchCubit(
        repository: _container.resolve(),
      ),
    );
  }

  static void _registerLoginScreenCubit() {
    _container.registerSingleton(
      (_) => LoginScreenCubit(
          authRepository: _container.resolve(),
          googleSignIn: _container.resolve()),
    );
  }

  static void _registerPinScreenCubit() {
    _container.registerSingleton(
      (_) => PinScreenCubit(
        authRepository: _container.resolve(),
      ),
    );
  }

  static void _registerOtpScreenCubit() {
    _container.registerSingleton(
      (_) => OtpScreenCubit(
        authRepository: _container.resolve(),
      ),
    );
  }

  static void _registerCityScreenCubit() {
    _container.registerSingleton(
      (_) => CityCubit(
        repository: _container.resolve(),
      ),
    );
  }

  static void _registerNameScreenCubit() {
    _container.registerSingleton(
      (_) => NameCubit(
        firstLastRepository: _container.resolve(),
      ),
    );
  }

  static void _registerSampleMenuCubit() {
    _container.registerSingleton(
      (_) => SampleMenuCubit(),
    );
  }

  static void _registerAddressDetailsScreenCubit() {
    _container.registerSingleton(
      (_) => AddressDetailsScreenCubit(
          repository: _container.resolve(),
          profileRepository: _container.resolve()),
    );
  }

  static void _registerLocationScreenCubit() {
    _container.registerSingleton((_) => LocationScreenCubit());
  }
}
