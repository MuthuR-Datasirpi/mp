import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:mobile/core/resources/resources.dart';
import 'package:mobile/features/address/presentation/cubit/location_screen_cubit.dart';
import 'package:mobile/features/address/presentation/states/location_screen_states.dart';
import 'package:mobile/common/widgets/app_button.dart';
import 'package:mobile/l10n/app_localizations_extension.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen>
    with WidgetsBindingObserver {
  late GoogleMapController? _mapController;
  LatLng? _currentLocation;
  final TextEditingController _addressController = TextEditingController();
  String _addressDetails = "";
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _currentLocation = null;
    _getCurrentLocation();
  }

  void _clearMarker() {
    setState(() {
      _markers.clear();
      _addressController.text = ""; // Clear the input box
    });
  }

  _getCurrentLocation() async {
    await context.read<LocationScreenCubit>().initLocation();
  }

  void _addMarker(LatLng location) {
    setState(() {
      _markers.clear(); // Clear any existing markers
      _markers.add(
        Marker(
          markerId:
              const MarkerId("user_location"), // A unique marker identifier
          position: location, // The position where the user clicked
          // You can customize the marker icon, e.g., BitmapDescriptor.defaultMarker,
          // BitmapDescriptor.fromAsset("assets/custom_marker.png"), etc.
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    });

    // Update the address in the input box
    _reverseGeocode(location);
  }

  Future<void> _reverseGeocode(LatLng location) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        location.latitude,
        location.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks[0];
        String address = placemark.street ?? "";
        String city = placemark.locality ?? "";
        String state = placemark.administrativeArea ?? "";
        String country = placemark.country ?? "";
        String postalCode = placemark.postalCode ?? "";

        String addressDetails = "$address, $city, $state, $country $postalCode";
        _updateAddress(addressDetails);
      }
    } catch (e) {
      print("Error reverse geocoding: $e");
    }
  }

  void _updateAddress(String newAddress) {
    setState(() {
      _addressDetails = newAddress;
      _addressController.text = _addressDetails;
    });
  }

  @override
  Widget build(BuildContext context) {
    const double marginSize = 20;
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          double parentHeight = constraints.maxHeight;
          double parentWidth = constraints.maxWidth;
          return SizedBox(
            height: parentHeight,
            child: Stack(
              alignment: Alignment.center,
              children: [
                GoogleMap(
                  onMapCreated: (controller) {
                    _mapController = controller;
                  },
                  initialCameraPosition: CameraPosition(
                    target: _currentLocation ?? const LatLng(0, 0),
                    zoom: 15.0,
                  ),
                  onTap: (LatLng location) {
                    _addMarker(location); // Call the function to add a marker
                  },
                  markers: _markers, // Set of markers to display on the map
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: ElevatedButton(
                            onPressed: _getCurrentLocation,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black, // Background color
                              foregroundColor: Colors.white, // Text color
                            ),
                            child: const Text(
                              'Use my current location',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.3,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: marginSize, vertical: marginSize),
                          decoration: const ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24),
                                topRight: Radius.circular(24),
                              ),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 15,
                                offset: Offset(1, 0),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: parentHeight * 0.01),
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 14, right: 14, top: 16, bottom: 14),
                                  decoration: ShapeDecoration(
                                    color: AppColors.inputFillColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                  ),
                                  width: parentWidth,
                                  height: parentHeight * 0.1,
                                  child: TextField(
                                    controller: _addressController,
                                    style: const TextStyle(
                                      color: AppColors.inputValueColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.only(top: 20),

                                      labelText: context.appStrings
                                          .searchYourLocation, // Set the label text
                                      labelStyle: const TextStyle(
                                        color: AppColors.inputLabelColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      floatingLabelStyle: const TextStyle(
                                        color: AppColors.inputLabelColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      filled: true,
                                      fillColor: AppColors.inputFillColor,
                                      border: const OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: parentHeight * 0.01),
                                AppButton(
                                  onPressed: _currentLocation != null
                                      ? () => context.push(
                                          PagePath.addressDetailsScreen,
                                          extra: _currentLocation)
                                      : null,
                                  bgColor: AppColors.primaryColor,
                                  body: FittedBox(
                                    child: Text(
                                      context.appStrings.addressDetails,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: parentHeight * 0.02,
                                ),
                                Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(
                                        top: parentHeight * 0.02),
                                    child: GestureDetector(
                                      onTap: () {
                                        context.go(PagePath.home);
                                      },
                                      child: Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: context.appStrings.cancel,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                                SizedBox(
                                  height: parentHeight * 0.04,
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
                BlocListener<LocationScreenCubit, LocationScreenStates>(
                  listener: (context, state) {
                    state.whenOrNull(
                      loading: () {},
                      onLoadedMap: ((response) async {
                        setState(() {
                          _currentLocation = response;
                        });
                        await _reverseGeocode(_currentLocation!);
                        if (_mapController != null &&
                            _currentLocation != null) {
                          _mapController!.moveCamera(
                              CameraUpdate.newLatLng(_currentLocation!));
                        }
                      }),
                    );
                  },
                  child: const Text(""),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
