import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/common/widgets/custom_network_image.dart';
import 'package:mobile/core/extensions/build_context.dart';
import 'package:mobile/core/resources/colors.dart';
import 'package:mobile/core/resources/dimens.dart';
import 'package:mobile/core/resources/page_path.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/brands_response.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/meal_plan.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/cubit/plans_listing_cubit.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/states/plans_listing_screen_states.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/widgets/brand_listing_loading_widget.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/widgets/custom_appbar.dart';
import 'package:mobile/l10n/app_localizations_extension.dart';

class PlansListingScreen extends StatefulWidget {
  const PlansListingScreen({Key? key, required this.brandParams}) : super(key: key);
  final Map<String, dynamic> brandParams;

  @override
  State<PlansListingScreen> createState() => _PlansListingScreenState();
}

class _PlansListingScreenState extends State<PlansListingScreen> {
  @override
  void initState() {
    context
        .read<PlanListingCubit>()
        .getPlansByBrandId(widget.brandParams["id"]);
    super.initState();
  }

  _body(List<MealPlans> mealPlans) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.padding_27, vertical: Dimensions.padding_26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.appStrings.selectAPlan,
            style: context.textTheme.titleMedium?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.subTitleBlackColor),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: mealPlans.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(top: Dimensions.padding_19),
                      child: InkWell(
                          onTap: () {
                            context.push(
                              PagePath.planDetails,
                              extra: {
                                'mealPlans': mealPlans[index],
                              },
                            );
                          },
                          child: Container(
                            height: 273,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(
                                        0, 0, 0, 0.11999999731779099),
                                    offset: Offset(0, 2),
                                    blurRadius: 2)
                              ],
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4),
                                        topRight: Radius.circular(4),
                                        bottomLeft: Radius.circular(0),
                                        bottomRight: Radius.circular(0),
                                      ),
                                      color: AppColors.backgroundWhiteColor,
                                      border: Border.all(
                                        color: Color.fromRGBO(246, 246, 246, 1),
                                        width: 1,
                                      ),
                                    ),
                                    child: CustomNetworkImage(
                                      fit: BoxFit.fill,
                                      imageUrl: mealPlans[index].imageUrl ?? "",
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                ),
                                Container(
                                  height: 115,
                                  decoration: BoxDecoration(
                                    color: AppColors.inputFillColor,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Dimensions.padding_12,
                                      vertical: Dimensions.padding_12),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              mealPlans[index].title ?? "",
                                              style: context
                                                  .textTheme.titleLarge
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 14),
                                            ),
                                            SizedBox(
                                              height: 6,
                                            ),
                                            Text(
                                              softWrap: false,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              mealPlans[index].description ??
                                                  "",
                                              style: context
                                                  .textTheme.titleMedium
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 12,
                                                      color: AppColors
                                                          .btnDisableColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                context.appStrings.startingFrom,
                                                style: context
                                                    .textTheme.titleMedium
                                                    ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 12,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        color: AppColors
                                                            .lightGrayColor),
                                              ),
                                              Text(
                                                " AED ${mealPlans[index].amount}/Day"
                                                    .toUpperCase(),
                                                style: context
                                                    .textTheme.titleMedium
                                                    ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14,
                                                        color: AppColors
                                                            .subTitleBlackColor),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.star,
                                                color:
                                                    AppColors.startYellowColor,
                                                size: 24,
                                              ),
                                              const SizedBox(
                                                width: 2,
                                              ),
                                              Text(
                                                mealPlans[index].rating == null
                                                    ? ""
                                                    : mealPlans[index]
                                                        .rating
                                                        .toString(),
                                                style: context
                                                    .textTheme.titleMedium
                                                    ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 14,
                                                        color: AppColors
                                                            .btnDisableColor),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )),
                    );
                  }))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlanListingCubit, PlansListingScreenStates>(
      builder: (context, state) {
        return Scaffold(
          body: state.whenOrNull(
            loading: () => const BrandListingLoadingWidget(),
            onError: (error) => Center(child: Text(error)),
            onAllPlansFetched: (mealPlans) => SafeArea(
              child: Column(
                children: [
                  //TODO
                  // the only conflict is AppBar.
                  //
                  // Salman's Suggestion: Salman recommend that we should use Scaffold's AppBar that is mostly similar of figma design.
                  //
                  // My suggestion: But my suggestion is we should create a common custom Appbar that is perfectly similar and pixel perfect of figma design.
                  //
                  //
                  CustomAppBar(title: widget.brandParams["brandName"]),
                  Expanded(child: _body(mealPlans))
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void onBrandItemTapped(Brand brand) {}
}
