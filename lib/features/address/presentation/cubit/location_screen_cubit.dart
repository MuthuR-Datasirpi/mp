import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile/core/locationmanager/location_manager.dart';
import 'package:mobile/features/address/presentation/states/location_screen_states.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationScreenCubit extends Cubit<LocationScreenStates> {
  LocationScreenCubit() : super(const LocationScreenStates.initial());

  Future initLocation() async {
    emit(const LocationScreenStates.loading());
    try {
      var status = await Permission.location.request();
      if (status.isGranted) {
        Position position = await LocationManager.getCurrentLocation();
        final LatLng currentLocation =
            LatLng(position.latitude, position.longitude);
        emit(LocationScreenStates.onLoadedMap(currentLocation));
      }
    } on DioException catch (e) {
      emit(LocationScreenStates.onError(e.message.toString()));
    }
  }
}
