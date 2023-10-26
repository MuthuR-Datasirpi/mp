import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/extensions/build_context.dart';
import 'package:mobile/core/resources/colors.dart';
import 'package:mobile/core/resources/dimens.dart';
import 'package:mobile/core/resources/page_path.dart';
import 'package:mobile/features/main/presentation/screens/home/data/models/search_response.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/cubit/search_cubit.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/states/search_screen_states.dart';
import 'package:mobile/features/main/presentation/screens/home/presentation/widgets/search_loading_widget.dart';
import 'package:mobile/l10n/app_localizations_extension.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  late FocusNode myFocusNode;

  @override
  void initState() {
    myFocusNode = FocusNode();
    super.initState();
  }

  Widget _searchBar() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.padding_20, vertical: Dimensions.padding_10),
      alignment: Alignment.center,
      height: 70,
      decoration: BoxDecoration(boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          blurRadius: 4,
          offset: Offset(0, 4),
        ),
        BoxShadow(
          color: Colors.white,
          offset: Offset(-5, 0),
        ),
        BoxShadow(
          color: Colors.white,
          offset: Offset(5, 0),
        )
      ]),
      child: Container(
        child: Row(
          children: [
            InkWell(
              onTap: () {
                context.read<SearchCubit>().reset();
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                size: 24,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: Dimensions.padding_12),
                child: TextField(
                  autofocus: true,
                  focusNode: myFocusNode,
                  cursorColor: AppColors.primaryColor,
                  textInputAction: TextInputAction.search,
                  onSubmitted: (value) {
                    if (value.isNotEmpty) {
                      context.read<SearchCubit>().search(value);
                    }
                  },
                  controller: _searchController,
                  enabled: true,
                  onChanged: (d) {
                    // if(d.isNotEmpty && d.length>1){
                    //   context.read<SearchCubit>().getSearchSuggestions(d);
                    // }else{
                    //   context.read<SearchCubit>().updateState();
                    // }
                    setState(() {
                    });
                  },
                  decoration: InputDecoration(
                    suffixIcon: _searchController.text == "" ||
                            _searchController.text.isEmpty
                        ? SizedBox()
                        : IconButton(
                            icon: const Icon(
                              Icons.close,
                            ),
                            onPressed: () {
                              context.read<SearchCubit>().reset();

                              _searchController.text = "";

                              myFocusNode.requestFocus();
                            },
                          ),
                    contentPadding:
                        EdgeInsets.only(left: Dimensions.padding_12),
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.padding_4),
                        borderSide: BorderSide(
                            color: AppColors.primaryColor, width: 1)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(
                            color: AppColors.primaryColor, width: 1)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(
                            color: AppColors.primaryColor, width: 1)),
                    hintStyle: context.textTheme.titleMedium
                        ?.copyWith(color: AppColors.textLightColor),
                    hintText:
                        context.appStrings.searchBrandCategoryorIngredient,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _searchBody(SearchResponse searchResponse) {
    if (searchResponse.searchResultCount == 0) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 21),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 44,
              height: 44,
              child: SvgPicture.asset("assets/svgs/search.svg"),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              context.appStrings.noResults,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Colors.black,
                  height: 2),
            ),
            Text(
              context.appStrings.unfortunatelywecouldntfindwhatyou,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Color(0xffB9B9B9),
                  height: 2),
            ),
            Text(
              context.appStrings.wereLookingfor,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Color(0xffB9B9B9)),
            )
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimensions.padding_27),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              searchResponse.brands!.length ==0? SizedBox():
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: Dimensions.padding_8, top: Dimensions.padding_24),
                    child: Text(
                      context.appStrings.brands,
                      style: context.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: AppColors.coreGrayColor),
                    ),
                  ),
                  ListView.builder(
                      itemCount: searchResponse.brands!.length,
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int childindex) {
                        return Padding(
                          padding:
                          const EdgeInsets.only(bottom: Dimensions.padding_6),
                          child: InkWell(
                            onTap: () {
                              context.push(PagePath.allPlans, extra: {
                                "brandName":
                                searchResponse.brands![childindex].name,
                                "id": searchResponse.brands![childindex].id,
                              });
                            },
                            child: Text(
                                searchResponse.brands![childindex].name ?? "",
                                style: context.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Colors.black)),
                          ),
                        );
                      })
                ],
              ),
              searchResponse.categories!.length ==0? SizedBox():
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: Dimensions.padding_8, top: Dimensions.padding_30),
                    child: Text(
                      context.appStrings.categories,
                      style: context.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: AppColors.coreGrayColor),
                    ),
                  ),
                  ListView.builder(
                      itemCount: searchResponse.categories!.length,
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding:
                              const EdgeInsets.only(bottom: Dimensions.padding_6),
                          child: InkWell(
                            onTap: () {
                              context.push(PagePath.allBrands,
                                  extra: searchResponse.categories![index].id);
                            },
                            child: Text(
                                searchResponse.categories![index].name ?? "",
                                style: context.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Colors.black)),
                          ),
                        );
                      }),
                ],
              ),
            ],
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchScreenStates>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Column(
                  children: [
                    _searchBar(),
                    Expanded(
                      child: Container(
                        child: state.whenOrNull(
                            loading: () => const SearchLoadingWidget(),
                            onError: (error) => Center(child: Text(error)),
                            onSearchFetched: (searchRespnse) =>
                                _searchBody(searchRespnse)),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  left: 55,
                  top: 60,
                  right: 20,
                  child: state ==  SearchScreenStates.suggestionsLoading()?
                    Container(
                    padding: EdgeInsets.all(Dimensions.padding_8),
                    width: context.deviceWidth,
                    decoration: BoxDecoration(
                        color: AppColors.backgroundWhiteColor,
                        borderRadius: BorderRadius.all(Radius.circular(2)),
                        border: Border.all(color: AppColors.inputBorderColor)),
                    child: Center(child: CircularProgressIndicator(),),
                  ): SizedBox()
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
