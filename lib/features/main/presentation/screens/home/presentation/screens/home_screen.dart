import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/common/widgets/text_button.dart';
import 'package:mobile/core/extensions/build_context.dart';
import 'package:mobile/core/resources/colors.dart';
import 'package:mobile/core/resources/dimens.dart';
import 'package:mobile/core/resources/resources.dart';
import 'package:mobile/core/resources/text_styles.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/address_model.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/brands_response.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/categories_response.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/cubit/home_screen_cubit.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/states/home_screen_states.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/widgets/brand_list_item.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/widgets/home_category_listing_widget.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/widgets/home_screen_app_bar.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/widgets/home_screen_loading_widget.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/widgets/home_search_field.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/widgets/home_trending_brand_listing_widget.dart';
import 'package:mobile/l10n/app_localizations_extension.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeScreenCubit>().getHomeData(context);
    getAddress();
    super.initState();
  }

  getAddress() async {
    responseObject = await context.read<HomeScreenCubit>().getAddress();
  }

  int selectedRadio = 0;
  bool showDropDown = false;
  String address = "home";
  AddressResponse? responseObject;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeScreenAppBar(
        location: address,
        onLocationTapped: () {
          setState(() {
            showDropDown = !showDropDown;
          });
        },
      ),
      body: BlocBuilder<HomeScreenCubit, HomeScreenStates>(
          builder: (context, state) => state.maybeWhen(
              loading: () => const HomeScreenLoadingWidget(),
              onError: (error) => Center(child: Text(error.toString())),
              onHomeDataFetched: (categories, trendingBrands, brands) =>
                  _buildHomeScreen(categories, trendingBrands, brands),
              orElse: () => const Placeholder())),
    );
  }

  Widget _buildSectionTitleWidget(String title,
      {VoidCallback? onViewAllTapped}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: context.textTheme.titleMedium),
        InkWell(
          onTap: onViewAllTapped,
          child: Text(context.appStrings.view_all,
              style: context.textTheme.titleSmall?.copyWith(
                  color: AppColors.inputLabelColor,
                  decoration: TextDecoration.underline)),
        )
      ],
    );
  }

  Widget _buildHomeScreen(List<Category> categories, List<Brand> trendingBrands,
      List<Brand> brands) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(Dimensions.materialPadding),
          child: CustomScrollView(
            slivers: [
              HomeScreenSearchField(onTap: () {
                context.push(PagePath.search);
              }),
              SliverToBoxAdapter(
                  child: _buildSectionTitleWidget(context.appStrings.categories,
                      onViewAllTapped: () {
                context.push(PagePath.allCategories);
              })),
              const SliverToBoxAdapter(
                  child: SizedBox(height: Dimensions.materialPadding)),
              SliverToBoxAdapter(
                child: HomeCategoryListingWidget(
                    categories: categories,
                    onTap: (category) {
                      context.push(PagePath.allBrands, extra: category.id);
                    }),
              ),
              SliverToBoxAdapter(
                child: ListTile(
                    tileColor: AppColors.greenShade,
                    leading: const SizedBox(
                        height: double.infinity, child: Icon(Icons.alarm)),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    minLeadingWidth: 0,
                    title: Text(context.appStrings.no_active_subs,
                        style: context.textTheme.titleMedium
                            ?.copyWith(color: AppColors.primaryBlack)),
                    subtitle: Text(context.appStrings.no_active_subs,
                        style: context.textTheme.titleSmall
                            ?.copyWith(color: AppColors.primaryBlack))),
              ),
              const SliverToBoxAdapter(
                  child: SizedBox(height: Dimensions.materialPadding)),
              SliverToBoxAdapter(
                  child: _buildSectionTitleWidget(
                      context.appStrings.trending_brands, onViewAllTapped: () {
                context.push(PagePath.allBrands);
              })),
              const SliverToBoxAdapter(
                  child: SizedBox(height: Dimensions.materialPadding)),
              SliverToBoxAdapter(
                  child: HomeTrendingBrandListingWidget(
                      brands: brands, onTap: (brand) {})),
              const SliverToBoxAdapter(
                  child: SizedBox(height: Dimensions.materialPadding)),
              SliverList.separated(
                  itemCount: brands.length,
                  itemBuilder: (context, index) =>
                      BrandListItem(brand: brands[index], onTap: (brand) {}),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: Dimensions.materialPadding))
            ],
          ),
        ),
        Visibility(
          visible: showDropDown,
          child: Column(
            children: [
              Container(
                color: AppColors.textColorWhite,
                padding: const EdgeInsets.all(Dimensions.materialPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      context.appStrings.addresses,
                      style: AppStyles.heading6
                          .copyWith(color: AppColors.blackGrayColor),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(responseObject!.payload!.length,
                          (index) {
                        return ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 0),
                            horizontalTitleGap: 0,
                            title: Text(
                              responseObject!.payload![index].label!,
                              style: AppStyles.medium12
                                  .copyWith(color: AppColors.textColorBlack),
                            ),
                            subtitle: Text(
                              responseObject!.payload![index].city!,
                              style: AppStyles.regular12
                                  .copyWith(color: AppColors.inputLabelColor),
                            ),
                            leading: Radio(
                              fillColor:
                                  MaterialStateProperty.resolveWith((states) {
                                if (states.contains(MaterialState.selected)) {
                                  return AppColors.secondaryColor;
                                }
                                return AppColors.blackBorder;
                              }),
                              activeColor: AppColors.secondaryColor,
                              value: index,
                              groupValue: selectedRadio,
                              onChanged: (value) {
                                setState(() {
                                  showDropDown = !showDropDown;
                                  selectedRadio = value!;
                                });
                              },
                            ));
                      }).toList(),
                    ),
                    CustomTextButton(
                        onPressed: (() {
                          context.push(PagePath.locationScreen);
                          setState(() {
                            showDropDown = !showDropDown;
                          });
                        }),
                        iconData: Icons.add,
                        textColor: AppColors.primaryColor,
                        iconColor: AppColors.primaryColor,
                        buttonText: context.appStrings.addNewAddress),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: AppColors.blackBorder.withOpacity(0.8),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
