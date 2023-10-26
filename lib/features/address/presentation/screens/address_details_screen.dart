import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile/common/widgets/app_input.dart';
import 'package:mobile/core/resources/colors.dart';
import 'package:mobile/core/resources/page_path.dart';
import 'package:mobile/features/address/data/models/address_details_request.dart';
import 'package:mobile/features/address/presentation/cubit/address_details_cubit.dart';
import 'package:mobile/features/address/presentation/states/address_details_screen_states.dart';
import 'package:mobile/features/address/presentation/widgets/address_details_screen_loading_widget.dart';
import 'package:mobile/common/widgets/app_button.dart';
import 'package:mobile/l10n/app_localizations_extension.dart';

class AddressDetailsScreen extends StatefulWidget {
  const AddressDetailsScreen({super.key, this.latLng});
  final LatLng? latLng;

  @override
  State<AddressDetailsScreen> createState() => _AddressDetailsScreenState();
}

class AddressLabels {
  static const String HOME = "Home";
  static const String OFFICE = "Office";
  static const String FRIEND = "Friend";
  static const String OTHERS = "Others";
}

class _AddressDetailsScreenState extends State<AddressDetailsScreen> {
  double marginSize = 20;
  List<dynamic> addressTypeOptions = [];
  List<dynamic> cityOptions = [];
  List<String> dropOffOptions = [
    "Meet at my door",
    "Leave at my door",
    "Meet at my door2",
    "Leave at my door2"
  ];

  // Start: Variable for inputs
  int selectedAddressTypeId = 0;
  int selectedCityId = 0;
  String buildingName = "";
  String doorNumber = "";
  String floor = "";
  String street = "";
  String notes = "";
  String selectedDropOffOption = "";
  String selectedAddressLabel = "";

  // End: Variable for inputs
  bool isLoadedAddressDetails = false;
  bool isClickedOthersAddressLabelBtn = false;
  bool isSavingAddressDetails = false;

  String? latitude = "";
  String? longitude = "";

  @override
  void initState() {
    context.read<AddressDetailsScreenCubit>().getAddressData();
    super.initState();
  }

  get isEmptyInputs =>
      selectedAddressTypeId == 0 ||
      selectedCityId == 0 ||
      buildingName.isEmpty ||
      doorNumber.isEmpty ||
      floor.isEmpty ||
      street.isEmpty ||
      notes.isEmpty ||
      selectedDropOffOption.isEmpty ||
      selectedAddressLabel.isEmpty;

  onSaveAddressDetails() {
    final AddressDetailsRequest payload = AddressDetailsRequest(
      selectedAddressTypeId,
      buildingName,
      doorNumber,
      floor,
      street,
      selectedCityId,
      notes,
      selectedDropOffOption,
      selectedAddressLabel,
      latitude,
      longitude,
    );
    context.read<AddressDetailsScreenCubit>().saveAddress(payload);
  }

  setAddressLabel(String label) {
    isClickedOthersAddressLabelBtn = false;
    setState(() {
      selectedAddressLabel = label;
    });
  }

  @override
  Widget build(BuildContext context) {
    latitude = widget.latLng?.latitude.toString();
    longitude = widget.latLng?.longitude.toString();

    return Scaffold(
      backgroundColor: AppColors.backgroundWhiteColor,
      appBar: AppBar(),
      // Body
      body: BlocBuilder<AddressDetailsScreenCubit, AddressDetailsScreenStates>(
          builder: (context, state) => state.maybeWhen(
                loading: () => const AddressDetailsScreenLoading(),
                onError: (error) => Center(child: Text(error.toString())),
                onAddressDataFetched: (addressTypes, cities) =>
                    _buildAddressDetailsScreen(addressTypes, cities),
                orElse: () => const Placeholder(),
                onSavedAddress: (response) {
                  context.go(PagePath.home);
                  return const Text("");
                },
              )),
    );
  }

  Widget _buildAddressDetailsScreen(addressTypes, cities) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double parentHeight = constraints.maxHeight;
        double parentWidth = constraints.maxWidth;

        // Parent container
        return SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.only(
                left: marginSize,
                right: marginSize,
              ),
              // Column widget
              child: Column(
                children: [
                  SizedBox(
                    height: parentHeight * 0.04,
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 14, right: 14, top: 16, bottom: 14),
                    decoration: ShapeDecoration(
                      color: AppColors.inputFillColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    width: parentWidth,
                    height: 60,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<dynamic>(
                        icon: const Icon(Icons.keyboard_arrow_down_sharp),
                        alignment: AlignmentDirectional.topStart,
                        value: selectedAddressTypeId == 0
                            ? null
                            : selectedAddressTypeId,
                        onChanged: (dynamic newValue) {
                          setState(() {
                            selectedAddressTypeId = newValue;
                          });
                        },
                        items: [
                          DropdownMenuItem<String>(
                            value: null,
                            child: Text(
                              context.appStrings.addressTypeLabel,
                              style: const TextStyle(
                                color: AppColors.inputLabelColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          ...addressTypes.map((dynamic addressType) {
                            return DropdownMenuItem<dynamic>(
                              value: addressType.id,
                              child: Text(addressType.name.toString()),
                            );
                          }).toList()
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: parentHeight * 0.02,
                  ),
                  AppInput(
                    label: context.appStrings.buildingNameLabel,
                    onChanged: (value) {
                      setState(() {
                        buildingName = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: parentHeight * 0.02,
                  ),
                  AppInput(
                    label: context.appStrings.doorNoLabel,
                    onChanged: (value) {
                      setState(() {
                        doorNumber = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: parentHeight * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: parentWidth * 0.42,
                        child: AppInput(
                          label: context.appStrings.floorNoLabel,
                          onChanged: (value) {
                            setState(() {
                              floor = value;
                            });
                          },
                        ),
                      ),
                      Container(
                        width: parentWidth * 0.42,
                        child: AppInput(
                          label: context.appStrings.streetLabel,
                          onChanged: (value) {
                            setState(() {
                              street = value;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: parentHeight * 0.02,
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 14, right: 14, top: 16, bottom: 14),
                    decoration: ShapeDecoration(
                      color: AppColors.inputFillColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    width: parentWidth,
                    height: 60,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<dynamic>(
                        icon: const Icon(Icons.keyboard_arrow_down_sharp),
                        alignment: AlignmentDirectional.topStart,
                        value: selectedCityId == 0 ? null : selectedCityId,
                        onChanged: (dynamic newValue) {
                          setState(() {
                            selectedCityId = newValue;
                          });
                        },
                        items: [
                          const DropdownMenuItem<String>(
                            value: null,
                            child: Text(
                              'City',
                              style: TextStyle(
                                color: AppColors.inputLabelColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          ...cities.map((dynamic cityOption) {
                            return DropdownMenuItem<dynamic>(
                              value: cityOption.id,
                              child: Text(cityOption.name.toString()),
                            );
                          }).toList()
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: parentHeight * 0.02,
                  ),
                  AppInput(
                    label: context.appStrings.notesLabel,
                    onChanged: (value) {
                      setState(() {
                        notes = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: parentHeight * 0.04,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      context.appStrings.dropOpLabel,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: parentHeight * 0.02,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: dropOffOptions
                              .map((op) => GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedDropOffOption = op;
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 20),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: selectedDropOffOption == op
                                          ? AppColors.selectedBadgeColor
                                          : Colors.white,
                                      border: Border.all(
                                        width: 1,
                                        color: AppColors.containerBorderColor,
                                      ),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      op,
                                      style: const TextStyle(
                                        color: AppColors.otpInputLabelColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  )))
                              .toList()),
                    ),
                  ),
                  SizedBox(
                    height: parentHeight * 0.04,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      context.appStrings.addAddressTitle,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: parentHeight * 0.02,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () {
                                setAddressLabel(AddressLabels.HOME);
                              },
                              child: Container(
                                width: parentWidth * 0.44,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 12),
                                decoration: BoxDecoration(
                                  color:
                                      selectedAddressLabel == AddressLabels.HOME
                                          ? AppColors.selectedBadgeColor
                                          : Colors.white,
                                  border: Border.all(
                                    width: 1,
                                    color: AppColors.containerBorderColor,
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.home,
                                      color: AppColors.primaryColor,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(top: 4),
                                      child: const Text(
                                        AddressLabels.HOME,
                                        style: TextStyle(
                                          color: AppColors.inputValueColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          GestureDetector(
                              onTap: () {
                                setAddressLabel(AddressLabels.OFFICE);
                              },
                              child: Container(
                                width: parentWidth * 0.44,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 12),
                                decoration: BoxDecoration(
                                  color: selectedAddressLabel ==
                                          AddressLabels.OFFICE
                                      ? AppColors.selectedBadgeColor
                                      : Colors.white,
                                  border: Border.all(
                                    width: 1,
                                    color: AppColors.containerBorderColor,
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.cases_rounded,
                                      color: AppColors.primaryColor,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(top: 4),
                                      child: const Text(
                                        AddressLabels.OFFICE,
                                        style: TextStyle(
                                          color: AppColors.inputValueColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: parentHeight * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () {
                                setAddressLabel(AddressLabels.FRIEND);
                              },
                              child: Container(
                                width: parentWidth * 0.44,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 12),
                                decoration: BoxDecoration(
                                  color: selectedAddressLabel ==
                                          AddressLabels.FRIEND
                                      ? AppColors.selectedBadgeColor
                                      : Colors.white,
                                  border: Border.all(
                                    width: 1,
                                    color: AppColors.containerBorderColor,
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.heart_broken,
                                      color: AppColors.primaryColor,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(top: 4),
                                      child: const Text(
                                        AddressLabels.FRIEND,
                                        style: TextStyle(
                                          color: AppColors.inputValueColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedAddressLabel = "";
                                  isClickedOthersAddressLabelBtn = true;
                                });
                              },
                              child: Container(
                                width: parentWidth * 0.44,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 12),
                                decoration: BoxDecoration(
                                  color: isClickedOthersAddressLabelBtn
                                      ? AppColors.selectedBadgeColor
                                      : Colors.white,
                                  border: Border.all(
                                    width: 1,
                                    color: AppColors.containerBorderColor,
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.add,
                                      color: AppColors.primaryColor,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(top: 4),
                                      child: const Text(
                                        AddressLabels.OTHERS,
                                        style: TextStyle(
                                          color: AppColors.inputValueColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: parentHeight * 0.02,
                      ),
                      isClickedOthersAddressLabelBtn
                          ? AppInput(
                              label: context.appStrings.otherLabelTitle,
                              onChanged: (value) {
                                setState(() {
                                  selectedAddressLabel = value;
                                });
                              },
                            )
                          : Container(),
                      SizedBox(
                        height: parentHeight * 0.02,
                      ),
                      AppButton(
                          isLoading: isSavingAddressDetails,
                          onPressed: isEmptyInputs
                              ? null
                              : () => {onSaveAddressDetails()},
                          bgColor: AppColors.btnBgColor,
                          body: FittedBox(
                            child: Text(
                              context.appStrings.saveAndContinue,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )),
                      SizedBox(
                        height: parentHeight * 0.04,
                      ),
                    ],
                  ),
                ],
              )),
        );
      },
    );
  }
}
