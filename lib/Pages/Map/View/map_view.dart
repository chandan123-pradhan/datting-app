import 'package:dating_app/Configurations/theme_configuration.dart';
import 'package:dating_app/Pages/ProfileDetail/View/profile_detail_view.dart';
import 'package:dating_app/Utilities/string_constants.dart';
import 'package:dating_app/CommonWidgets/common_app_bar.dart';
import 'package:dating_app/utils/color_constant.dart';
import 'package:dating_app/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  GoogleMapController? mapController;
  List<Marker> markers = [];
  BitmapDescriptor? customIcon;

  void addImage() {
    BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(0, 5)),
      'assets/icons/icon.png',
    ).then((d) {
      customIcon = d;
      addMarker(customIcon);
    });
  }

  bool isDataloaded = false;

  @override
  void initState() {
    super.initState();
    addImage();
    // Add sample markers with profile pictures
  }

  void addMarker(profileicon) {
    markers.add(
      Marker(
          markerId: MarkerId('1'),
          position: LatLng(28.6550, 77.1888), // Sample coordinates
          flat: true,
          
          infoWindow: InfoWindow(
            title: 'Kaushiki',              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ProfileDetail();
                }));
              },
          ),
          icon: profileicon!),
    );

    markers.add(
      Marker(
          markerId: MarkerId('2'),
          position: LatLng(28.6083, 77.3717), // Sample coordinates
         
         
          infoWindow: InfoWindow(
            title: 'Roppa',              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ProfileDetail();
                }));
              },
          ),
          icon: profileicon),
    );
     markers.add(
      Marker(
          markerId: MarkerId('3'),
          position: LatLng(28.4089, 77.3178), // Sample coordinates
          infoWindow: InfoWindow(
            title: 'Sarita',              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ProfileDetail();
                }));
              },
          ),
          icon: profileicon),
    );
     markers.add(
      Marker(
          markerId: MarkerId('4'),
          position: LatLng(28.4595, 77.0266), // Sample coordinates
          infoWindow: InfoWindow(
            title: 'Lovely',
                          onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ProfileDetail();
                }));
              },
          ),
          icon: profileicon),
    );
     markers.add(
      Marker(
          markerId: MarkerId('5'),
          position: LatLng(28.486483, 77.432877), // Sample coordinates
          infoWindow: InfoWindow(
            title: 'Baby kumari',
                         onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ProfileDetail();
                }));
              },
            
          ),
          icon: profileicon),
    );
    setState(() {
      isDataloaded = true;
    });
  }
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;

    // Set the map style for dark mode
    mapController?.setMapStyle(_getDarkMapStyle());
  }

  String _getDarkMapStyle() {
    return '''
      [
        {
          "featureType": "all",
          "elementType": "geometry",
          "stylers": [
            {"color": "#242f3e"}
          ]
        },
        {
          "featureType": "all",
          "elementType": "labels.text.stroke",
          "stylers": [
            {"color": "#ffffff"}
          ]
        },
        {
          "featureType": "poi",
          "elementType": "labels.text",
          "stylers": [
            // {"visibility": "off"}
                        {"color": "#ffffff"}
          
          ]
        },
        {
          "featureType": "poi.business",
          "elementType": "labels.text",
          "stylers": [
            // {"visibility": "off"}
                        {"color": "#ffffff"}
          
          ]
        },
        {
          "featureType": "road",
          "elementType": "labels.text",
          "stylers": [
            // {"visibility": "off"}
                        {"color": "#ffffff"}
          
          ]
        },
        {
          "featureType": "transit",
          "elementType": "labels.text",
          "stylers": [
            // {"visibility": "off"}
                        {"color": "#ffffff"}
          
          ]
        }
      ]
    ''';
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: ThemeConfiguration.scaffoldBgColor,
      
      body: isDataloaded == false
          ? Container()
          : Stack(
            children: [

              GoogleMap(
                
                  initialCameraPosition:const CameraPosition(
                    target: LatLng(28.6550, 77.1888), // Initial map coordinates
                    zoom: 10.0,
                  ),
                  markers: Set<Marker>.from(markers),
                  onMapCreated:(mapController){
                    _onMapCreated(mapController);
                  }
                ),

            ],
          ),
    );
  }
}