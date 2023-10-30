import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile/core/extensions/string_extension.dart';
import 'package:mobile/core/resources/page_path.dart';
import 'package:mobile/core/utils/page_transitions.dart';
import 'package:mobile/features/address/presentation/screens/address_details_screen.dart';
import 'package:mobile/features/address/presentation/screens/location_screen.dart';
import 'package:mobile/features/auth/presentation/screens/create_pwrd_screen.dart';
import 'package:mobile/features/auth/presentation/screens/login_screen.dart';
import 'package:mobile/features/auth/presentation/screens/otp_screen.dart';
import 'package:mobile/features/auth/presentation/screens/pin_screen.dart';
import 'package:mobile/features/auth/presentation/screens/signup_info_screen.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/meal_plan.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/screens/brands_listing_screen.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/screens/categories_listing_screen.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/screens/home_screen.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/screens/payment_screen.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/screens/plans_listing_screen.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/screens/search_screen.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/screens/sample_menu_screen.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/screens/summary_screen.dart';
import 'package:mobile/features/main/presentation/screens/main_screen.dart';
import 'package:mobile/features/main/presentation/screens/myplans/my_plans_screen.dart';
import 'package:mobile/features/main/presentation/screens/plandetails/plan_details_screen.dart';
import 'package:mobile/features/main/presentation/screens/wellness/wellness_screen.dart';
import 'package:mobile/features/permission/notification_permission_screen.dart';
import 'package:mobile/features/profile/presentation/screens/city_selection_screen.dart';
import 'package:mobile/features/profile/presentation/screens/first_last_name_screen.dart';
import 'package:mobile/features/splash/splash_screen.dart';

///Private root Navigator Keys
final _rootNavigatorKey = GlobalKey<NavigatorState>();

///---IMPORTANT---
///For every Bottom Navigation Tab, you need to define `GlobalKey<NavigatorState>`
final _homeKey = GlobalKey<NavigatorState>();
final _myPlans = GlobalKey<NavigatorState>();
final _wellness = GlobalKey<NavigatorState>();
final _profile = GlobalKey<NavigatorState>();

class AppRouter {
  AppRouter._();

  static final Map<String?, GoRouterState> _savedStateMap = {};

  static final router = GoRouter(
    initialLocation: PagePath.splash,
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: false,
    routes: [
      GoRoute(
        path: PagePath.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: PagePath.notificationPermissionScreen,
        builder: (context, state) => const NotificationPermissionScreen(),
      ),
      GoRoute(
        path: PagePath.noInternetConnection,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) =>
            PageTransitions.buildPageWithSlideTransition(
          state.pageKey,
          const Placeholder(), //const NoInternetConnectionScreen(),
        ),
      ),
      GoRoute(
        path: PagePath.enterPhoneNumber,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) =>
            PageTransitions.buildPageWithSlideTransition(
          state.pageKey,
          LoginScreen(params: (state.extra as Map<String, dynamic>?)),
        ),
      ),
      GoRoute(
        path: PagePath.pinPage,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) =>
            PageTransitions.buildPageWithSlideTransition(
          state.pageKey,
          PinScreen(params: (state.extra as Map<String, dynamic>?)),
        ),
      ),
      GoRoute(
        path: PagePath.createpassword,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) =>
            PageTransitions.buildPageWithSlideTransition(
                state.pageKey, const CreatePassword()),
      ),
      GoRoute(
        path: PagePath.signupinfo,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) =>
            PageTransitions.buildPageWithSlideTransition(
                state.pageKey, const Signupinfo()),
      ),
      GoRoute(
        path: PagePath.otpPage,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) =>
            PageTransitions.buildPageWithSlideTransition(
          state.pageKey,
          OtpScreen(params: (state.extra as Map<String, dynamic>?)),
        ),
      ),
      GoRoute(
        path: PagePath.firstNameLastName,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) =>
            PageTransitions.buildPageWithSlideTransition(
                state.pageKey, const NameScreen()),
      ),
      GoRoute(
        path: PagePath.citySelectScreen,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) =>
            PageTransitions.buildPageWithSlideTransition(
                state.pageKey, const CitySelectionScreen()),
      ),
      GoRoute(
        path: PagePath.locationScreen,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) =>
            PageTransitions.buildPageWithSlideTransition(
                state.pageKey, const LocationScreen()),
      ),
      GoRoute(
        path: PagePath.addressDetailsScreen,
        parentNavigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state) =>
            PageTransitions.buildPageWithSlideTransition(
                state.pageKey, AddressDetailsScreen(latLng: (state.extra as LatLng?))),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainScreen(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _homeKey,
            routes: [
              GoRoute(
                path: PagePath.home,
                pageBuilder: (context, state) {
                  _savedStateMap[state.path] =
                      _savedStateMap[state.path] ?? state;
                  return const NoTransitionPage(
                    child: HomeScreen(),
                  );
                },
                routes: [
                  GoRoute(
                    path: PagePath.allCategories.pathLocation,
                    parentNavigatorKey: _homeKey,
                    pageBuilder: (context, state) =>
                        PageTransitions.buildPageWithSlideTransition(
                            state.pageKey, const CategoriesListingScreen()),
                  ),
                  GoRoute(
                      path: PagePath.allBrands.pathLocation,
                      parentNavigatorKey: _homeKey,
                      pageBuilder: (context, state) =>
                          PageTransitions.buildPageWithSlideTransition(
                              state.pageKey,
                              BrandsListingScreen(
                                  categoryId: (state.extra as int?))),
                      routes: [
                        GoRoute(
                          path: PagePath.allPlans.pathLocation,
                          parentNavigatorKey: _homeKey,
                          pageBuilder: (context, state) =>
                              PageTransitions.buildPageWithSlideTransition(
                                  state.pageKey,
                                  PlansListingScreen(
                                      brandParams: (state.extra
                                          as Map<String, dynamic>))),
                        )
                      ]),
                  GoRoute(
                    path: PagePath.search.pathLocation,
                    parentNavigatorKey: _homeKey,
                    pageBuilder: (context, state) =>
                        PageTransitions.buildPageWithSlideTransition(
                            state.pageKey, const SearchScreen()),
                  ),
                  GoRoute(
                    path: PagePath.planDetails.pathLocation,
                    parentNavigatorKey: _homeKey,
                    pageBuilder: (context, state) {
                      final mealPlansMap =
                          state.extra as Map<String, MealPlans>;
                      final mealPlans = mealPlansMap['mealPlans'];
                      return PageTransitions.buildPageWithSlideTransition(
                        state.pageKey,
                        PlanDetailScreen(mealPlans: mealPlans!),
                      );
                    },
                    routes: [
                      GoRoute(
                          path: PagePath.sampleMenu.pathLocation,
                          parentNavigatorKey: _homeKey,
                          pageBuilder: (context, state) =>
                              PageTransitions.buildPageWithSlideTransition(
                                  state.pageKey, SampleMenuScreen()),
                          routes: [
                            GoRoute(
                              path: PagePath.allPlans.pathLocation,
                              parentNavigatorKey: _homeKey,
                              pageBuilder: (context, state) =>
                                  PageTransitions.buildPageWithSlideTransition(
                                      state.pageKey,
                                      PlansListingScreen(
                                          brandParams: (state.extra
                                              as Map<String, dynamic>))),
                            )
                          ]),
                    ],
                  ),
                  GoRoute(
                    path: PagePath.summary.pathLocation,
                    parentNavigatorKey: _homeKey,
                    pageBuilder: (context, state) =>
                        PageTransitions.buildPageWithSlideTransition(
                            state.pageKey, Summary()),
                  ),
                  GoRoute(
                    path: PagePath.payment.pathLocation,
                    parentNavigatorKey: _homeKey,
                    pageBuilder: (context, state) =>
                        PageTransitions.buildPageWithSlideTransition(
                            state.pageKey, Payment()),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _myPlans,
            routes: [
              GoRoute(
                  path: PagePath.myPlans,
                  pageBuilder: (context, state) => const NoTransitionPage(
                        child: MyPlansScreen(),
                      )),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _wellness,
            routes: [
              GoRoute(
                  path: PagePath.wellness,
                  pageBuilder: (context, state) => const NoTransitionPage(
                        child: WellnessScreen(),
                      )),
            ],
          )
        ],
      ),
    ],
  );
}
