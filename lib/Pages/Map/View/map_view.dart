import 'dart:developer';

import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Helper/loader_helper.dart';
import 'package:dating_app/Helper/navigation_helper.dart';
import 'package:dating_app/Helper/toast_helper.dart';
import 'package:dating_app/Pages/Map/Bloc/map_state.dart';
import 'package:dating_app/Pages/Map/Bloc/map_bloc.dart';
import 'package:dating_app/Pages/Map/Bloc/map_event.dart';
import 'package:dating_app/Pages/Map/Model/nearest_user_list_model.dart';
import 'package:dating_app/services/get_location_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show NetworkAssetBundle, rootBundl;
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  GoogleMapController? mapController;
  List<Marker> markers = [];
  BitmapDescriptor? customIcon;
  MapBloc? mapBloc;
  bool isLoading = false;
  NearestUserListModel? nearestUserListModel;

  @override
  void initState() {
    mapBloc = context.read<MapBloc>();
    getCurrentLocation();
    // mapBloc?.add(FetchUserEvent('','', '10'));
    nearestUserListModel = NearestUserListModel();
    super.initState();
    // addImage();
  }

  @override
  Widget build(BuildContext context) {
    return _buildUi();
  }

  void addImage() async {
    BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(0, 2)),
      'assets/icons/icon.png',
    ).then((d) {
      customIcon = d;
      addMarker(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTca2Cs6dyoP3NvlwmpwRWPkkpZiSEP9utweeTx1sI&s');
    });
  }

  void addMarker(profileIcon) async {
    for (int i = 0; i < nearestUserListModel!.data!.length; i++) {
      // debugger();

      // DefaultCacheManager()
      //     .getSingleFile(
      //         '${nearestUserListModel!.imagePath}${nearestUserListModel!.data![i].image!}')
      //     .then((file) {
      //   if (file != null) {
      //     // Create a custom BitmapDescriptor with the desired size
      //     BitmapDescriptor.fromAssetImage(
      //       ImageConfiguration(size: Size(32, 32)), // Set the desired size
      //       file.path, // Path to the cached marker image
      //     ).then((bitmapDescriptor) {
      //       markers.add(
      //         Marker(
      //           markerId: MarkerId("1"),
      //           position: LatLng(
      //               nearestUserListModel!.data![i].loc!.coordinates![0],
      //               nearestUserListModel!
      //                   .data![i].loc!.coordinates![1]), // Sample coordinates
      //           icon: bitmapDescriptor,
      //           infoWindow: InfoWindow(
      //             title: nearestUserListModel!.data![i].fullName,
      //             onTap: () {
      //               Navigator.pushNamed(
      //                   context, NavigationHelper.profileDetail);
      //             },
      //           ),
      //         ),
      //       );
      //       setState(() {});
      //     });
      //   }
      // });

        Uint8List bytes = (
          await NetworkAssetBundle(
            Uri.parse(
                    //'${nearestUserListModel!.imagePath}${nearestUserListModel!.data![i].image!}'
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpd4mJRIUwqgE8D_Z2znANEbtiz4GhI4M8NQ&usqp=CAU'
                    ))
                .load(
                   // '${nearestUserListModel!.imagePath}${nearestUserListModel!.data![i].image!}'
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpd4mJRIUwqgE8D_Z2znANEbtiz4GhI4M8NQ&usqp=CAU'
                    ))
            .buffer
            .asUint8List();
        markers.add(
          Marker(
              // anchor: const Offset(0.5, 0.5),
              markerId: MarkerId('${i + 1}'),
              position: LatLng(
                  nearestUserListModel!.data![i].loc!.coordinates![0],
                  nearestUserListModel!
                      .data![i].loc!.coordinates![1]), // Sample coordinates
              flat: true,
              infoWindow: InfoWindow(
                title: nearestUserListModel!.data![i].fullName,
                onTap: () {
                  Navigator.pushNamed(context, NavigationHelper.profileDetail);
                },
              ),
              icon: BitmapDescriptor.fromBytes(bytes,
                  size: const Size.fromHeight(30))!),
        );
    }

    setState(() {
      //isLoading = true;
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    mapController?.setMapStyle(_getDarkMapStyle());
  }

  String _getDarkMapStyle() {
    return '''
[
  {
    "featureType": "all",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#242f3e"
      }
    ]
  },
  {
    "featureType": "all",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#ffffff",  // Label text color is white
        "weight": "regular"  // Label text weight is regular (normal)
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text",
    "stylers": [
      {
        "visibility": "ffffff",
        "weight": "regular"
      }
    ]
  },
  {
    "featureType": "administrative.locality",
    "elementType": "labels.text",
    "stylers": [
      {
        "visibility": "on",
        "color": "#ffffff",
        "weight": "regular"
      }
    ]
  },
  {
    "featureType": "transit",
    "elementType": "labels.text",
    "stylers": [
      {
        "visibility": "off",
        "weight": "regular"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "labels.icon",
    "stylers": [
      {
        "visibility": "on",
        "color": "#ffffff"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#17263c"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#ffffff"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry.fill",
    "stylers": [
      {
        "color": "#ffffff",
        "visibility": "on",
        "weight": "regular"
      }
    ]
  }
]

    ''';
  }

  Future<void> getCurrentLocation() async {
    Position? position = await LocationServices().getCurrentPosition(context);
    mapBloc?.add(FetchUserEvent(
        position!.latitude.toString(), position.longitude.toString(), '100'));
  }

  _buildUi() {
    return BlocBuilder<MapBloc, MapState>(builder: (context, currentState) {
      if (kDebugMode) {
        print(currentState);
      }
      if (currentState is MapInitialState) {
      } else if (currentState is MapLoadingState) {
        isLoading = true;
      } else if (currentState is GetUserListSuccessState) {
        isLoading = false;
        nearestUserListModel = currentState.nearestUserListModel;
        addImage();
        mapBloc?.emit(MapEmptyState());
      } else if (currentState is MapErrorState) {
        isLoading = false;
        ToastHelper()
            .showErrorMsg(context: context, message: currentState.errorMessage);
      }
      return _buildMainUi();
    });
  }

  _buildMainUi() {
    return Scaffold(
      backgroundColor: ThemeConfiguration.scaffoldBgColor,
      body: Stack(
        children: [
          GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: LatLng(28.6550, 77.1888),
                zoom: 7,
              ),
              markers: Set<Marker>.from(markers),
              onMapCreated: (mapController) {
                _onMapCreated(mapController);
              }),
          Visibility(
            visible: isLoading == true,
            child: LoaderHelper.pageLoader(),
          )
        ],
      ),
    );
  }
}
