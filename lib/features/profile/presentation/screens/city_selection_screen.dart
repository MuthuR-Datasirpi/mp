import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/resources/resources.dart';
import 'package:mobile/features/profile/data/models/city_location_response_model.dart';
import 'package:mobile/features/profile/data/models/city_selection_request_model.dart';
import 'package:mobile/features/profile/presentation/cubit/city_selection_cubit.dart';
import 'package:mobile/features/profile/presentation/states/city_selection_states.dart';
import 'package:mobile/common/widgets/app_button.dart';
import 'package:mobile/constants/common_constants.dart';
import 'package:mobile/l10n/app_localizations_extension.dart';

class CitySelectionScreen extends StatefulWidget {
  const CitySelectionScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CitySelectionScreen> createState() => _CitySelectionScreenState();
}

class _CitySelectionScreenState extends State<CitySelectionScreen> {
  final FocusNode _searchBarFocusNode = FocusNode();
  bool isFocusedSearchBar = false;
  List<CityLocationResponseObject?>? cityOptions = [];

  List<CityLocationResponseObject?>? filteredCities = [];

  @override
  void initState() {
    context.read<CityCubit>().getCities();
    super.initState();

    // Input focus node listener
    _searchBarFocusNode.addListener(() {
      if (_searchBarFocusNode.hasFocus) {
        setState(() {
          isFocusedSearchBar = true;
          showDropdown = true;
        });
      } else {
        // Text field has lost focus
        setState(() {
          isFocusedSearchBar = false;
        });
      }
    });
  }

  @override
  void dispose() {
    // Input focus node dispose
    _searchBarFocusNode.dispose();
    super.dispose();
  }

  final TextEditingController _textEditingController = TextEditingController();
  bool isItemSelected = false;
  int selectedId = 0;
  bool isSavingCity = false;
  bool showDropdown = false;
  double marginSize = AppConstants.marginSize;

  _buildCitiesDropdown(List<CityLocationResponseObject?>? resultCities) {
    return showDropdown
        ? Container(
            width: double.infinity,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(6),
                bottomRight: Radius.circular(6),
              )),
              shadows: [
                BoxShadow(
                  color: AppColors.dropDownShadowColors[0],
                  blurRadius: 2,
                  offset: const Offset(0, 2),
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: AppColors.dropDownShadowColors[1],
                  blurRadius: 1,
                  offset: const Offset(0, 0),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: resultCities?.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    selectedId = resultCities[index]!.id!;
                    setState(() {
                      _textEditingController.text = resultCities[index]!.name!;
                      isItemSelected = true;
                      showDropdown = false;
                    });
                  },
                  child: Container(
                    height: 38,
                    decoration: BoxDecoration(
                        color: selectedId == resultCities![index]!.id
                            ? AppColors.activeOptionColor
                            : Colors.white,
                        border: const Border.symmetric(
                            vertical: BorderSide(
                                width: 0.50, color: AppColors.deviderColor))),
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    margin: EdgeInsets.only(
                        top: index == 0 ? 12 : 0,
                        bottom: index == resultCities.length - 1 ? 12 : 0),
                    child: Text(
                      resultCities[index]!.name!,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityCubit, CityScreenStates>(
      builder: (context, state) {
        return Scaffold(
            // backgroundColor: AppColors.backgroundWhiteColor,
            appBar: AppBar(),
            body: LayoutBuilder(
              builder: (context, constraints) {
                double parentHeight = constraints.maxHeight;
                // Parent container
                return Container(
                  margin: EdgeInsets.only(
                    top: marginSize,
                    left: marginSize,
                    right: marginSize,
                  ),
                  // Column widget
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.appStrings.selectCity,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: parentHeight * 0.02),

                          Text(
                            context.appStrings.cityTitle,
                            style: const TextStyle(
                              color: AppColors.textSpanColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: parentHeight * 0.02),
                          // Container with TextField for first name input
                          TextField(
                            focusNode: _searchBarFocusNode,
                            controller: _textEditingController,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.search,
                                size: 24,
                              ),
                              contentPadding: const EdgeInsets.only(top: 20),
                              hintText: context.appStrings.searchYourCity,
                              filled: true,
                              fillColor: AppColors.inputFillColor,
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                            // On Changed Event
                            onChanged: (searchValue) => {
                              setState(() => {
                                    // Filter the cities
                                    context
                                        .read<CityCubit>()
                                        .searchCities(searchValue, cityOptions),

                                    showDropdown = true,
                                  })
                            },
                          ),
                          state.maybeWhen(
                            loading: () => const Text(""),
                            onError: (error) =>
                                Center(child: Text(error.toString())),
                            onCitiesFetched:
                                (List<CityLocationResponseObject?>? cities) {
                              cityOptions = cities;
                              return _buildCitiesDropdown(cities);
                            },
                            onCitiesFiltered: (filteredCities) =>
                                _buildCitiesDropdown(filteredCities),
                            orElse: () => const Text(""),
                          ),
                          // Container with TextField for last name input
                        ],
                      ),

                      // Container with a button to continue the login process
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: parentHeight * 0.1),
                        child: AppButton(
                            isLoading: isSavingCity,
                            onPressed: isItemSelected
                                ? () {
                                    _saveCity();
                                  }
                                : null,
                            bgColor: AppColors.btnBgColor,
                            body: FittedBox(
                              child: Text(
                                context.appStrings.btnTextProceed,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )),
                      ),
                      BlocListener<CityCubit, CityScreenStates>(
                        listener: (context, state) {
                          state.maybeWhen(
                            loading: () {
                              setState(() {
                                isSavingCity = true;
                              });
                            },
                            onSavedCity: ((response) {
                              setState(() {
                                isSavingCity = false;
                              });
                              context.go(PagePath.home);
                            }),
                            onError: ((error) {
                              setState(() {
                                isSavingCity = false;
                              });
                            }),
                            orElse: () {
                              setState(() {
                                isSavingCity = false;
                              });
                            },
                          );
                        },
                        child: const Text(""),
                      )
                    ],
                  ),
                );
              },
            )
            // Body

            );
      },
    );
  }

  _saveCity() async {
    setState(() {
      isSavingCity = true;
    });

    final CityRequestModel payload = CityRequestModel(selectedId);
    context.read<CityCubit>().saveCity(payload);
  }
}
