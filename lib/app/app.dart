import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mobile/app/app_router.dart';
import 'package:mobile/app/cubit/locale_cubit.dart';
import 'package:mobile/app/cubit/theme_cubit.dart';
import 'package:mobile/core/di/injector.dart';
import 'package:mobile/core/resources/resources.dart';
import 'package:mobile/core/resources/strings.dart';
import 'package:mobile/features/address/presentation/cubit/address_details_cubit.dart';
import 'package:mobile/features/address/presentation/cubit/location_screen_cubit.dart';
import 'package:mobile/features/auth/presentation/cubit/login_screen_cubit.dart';
import 'package:mobile/features/auth/presentation/cubit/otp_screen_cubit.dart';
import 'package:mobile/features/auth/presentation/cubit/pin_screen_cubit.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/cubit/brands_listing_cubit.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/cubit/categories_listing_cubit.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/cubit/plans_listing_cubit.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/cubit/home_screen_cubit.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/cubit/search_cubit.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/cubit/sample_menu_cubit.dart';
import 'package:mobile/features/profile/presentation/cubit/city_selection_cubit.dart';
import 'package:mobile/features/profile/presentation/cubit/first_last_name_cubit.dart';
import 'package:mobile/constants/res.dart';
import 'package:mobile/l10n/app_localizations_extension.dart';

class MealPlanetApp extends StatefulWidget {
  const MealPlanetApp({super.key});

  static BuildContext? get appContext =>
      AppRouter.router.routerDelegate.navigatorKey.currentContext;

  @override
  State<MealPlanetApp> createState() => _MealPlanetAppState();
}

class _MealPlanetAppState extends State<MealPlanetApp> {
  @override
  Widget build(BuildContext context) {
    initializeAppResources(context: context);
    setSystemPreferences();
    return MultiBlocProvider(
      providers: appProviders,
      child: Builder(
        builder: (context) {
          final currentTheme = context.watch<ThemeCubit>().state;
          final currentLocale = context.watch<LocaleCubit>().state;
          return MaterialApp.router(
            title: Strings.appName,
            theme: currentTheme,
            debugShowCheckedModeBanner: false,
            routeInformationParser: AppRouter.router.routeInformationParser,
            routeInformationProvider: AppRouter.router.routeInformationProvider,
            routerDelegate: AppRouter.router.routerDelegate,
            locale: currentLocale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            builder: EasyLoading.init(),
          );
        },
      ),
    );
  }

  ///
  /// Register all app cubits instances here
  get appProviders => [
        BlocProvider<LocaleCubit>(
            lazy: true, create: (_) => Injector.resolve()),
        BlocProvider<ThemeCubit>(lazy: true, create: (_) => Injector.resolve()),
        BlocProvider<HomeScreenCubit>(
            lazy: true, create: (_) => Injector.resolve()),
        BlocProvider<CategoryListingCubit>(
            lazy: true, create: (_) => Injector.resolve()),
        BlocProvider<BrandListingCubit>(
            lazy: true, create: (_) => Injector.resolve()),
        BlocProvider<SearchCubit>(
            lazy: true, create: (_) => Injector.resolve()),
        BlocProvider<PlanListingCubit>(
            lazy: true, create: (_) => Injector.resolve()),
        BlocProvider<LoginScreenCubit>(
            lazy: true, create: (_) => Injector.resolve()),
        BlocProvider<PinScreenCubit>(
            lazy: true, create: (_) => Injector.resolve()),
        BlocProvider<OtpScreenCubit>(
            lazy: true, create: (_) => Injector.resolve()),
        BlocProvider<AddressDetailsScreenCubit>(
            lazy: true, create: (_) => Injector.resolve()),
        BlocProvider<NameCubit>(lazy: true, create: (_) => Injector.resolve()),
        BlocProvider<CityCubit>(lazy: true, create: (_) => Injector.resolve()),
        BlocProvider<SampleMenuCubit>(
            lazy: true, create: (_) => Injector.resolve()),
        BlocProvider<LocationScreenCubit>(
            lazy: true, create: (_) => Injector.resolve()),
      ];

  Future<void> setSystemPreferences() async {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors.primaryColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: AppColors.backgroundWhiteColor,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ));
  }
}
