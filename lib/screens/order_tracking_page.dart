import 'dart:async';
import 'dart:ui' as ui;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;
import 'package:flutter/services.dart' show ByteData, Uint8List, rootBundle;

class OrderTrackingPage extends StatefulWidget {
  final String id;

  const OrderTrackingPage({Key? key, required this.id}) : super(key: key);

  @override
  State<OrderTrackingPage> createState() => OrderTrackingPageState();
}

class OrderTrackingPageState extends State<OrderTrackingPage> {
  late BitmapDescriptor myIcon;
  late BitmapDescriptor schoolIcon;
  final loc.Location location = loc.Location();
  late GoogleMapController _controller;
  bool _added = false;
  bool _userInteracting = false;

  @override
  void initState() {
    super.initState();
    BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(20, 20)), 'assets/take_care_of_child.png'
    ).then((onValue) {
      myIcon = onValue;
    }).catchError((error) {
      print('Error loading icon: $error');
    });
    _createCustomMarker();
  }

  Future<void> _createCustomMarker() async {
    final ByteData data = await rootBundle.load('assets/take_care_of_child.png');
    final ui.Codec codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
      targetWidth: 100,
      targetHeight: 100,
    );
    final ui.FrameInfo fi = await codec.getNextFrame();
    final ByteData? resizedData = await fi.image.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List resizedBytes = resizedData!.buffer.asUint8List();

    schoolIcon = BitmapDescriptor.fromBytes(resizedBytes);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('supervisor_location').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          try {
            QueryDocumentSnapshot<Object?>? userLocation;
            try {
              userLocation = snapshot.data!.docs.firstWhere(
                    (element) => element.id == widget.id,
              );
              print('User location: $userLocation');
            } catch (e) {
              print('User location not found.');
              return Center(child: Text('User location not found.'));
            }

            final latitude = userLocation['latitude'];
            final longitude = userLocation['longitude'];

            if (latitude == null || longitude == null) {
              print('Invalid location data.');
              return Center(child: Text('Invalid location data.'));
            }

            QueryDocumentSnapshot<Object?>? schoolLocation;
            try {
              schoolLocation = snapshot.data!.docs.firstWhere(
                    (element) => element.id == 'School Location',
              );
            } catch (e) {
              print('School location not found.');
              return Center(child: Text('School location not found.'));
            }

            final schoolLatitude = schoolLocation['latitude'];
            final schoolLongitude = schoolLocation['longitude'];

            if (schoolLatitude == null || schoolLongitude == null) {
              print('Invalid school location data.');
              return Center(child: Text('Invalid school location data.'));
            }

            if (_added && _userInteracting) {
              mymap(latitude, longitude);
            }

            return Listener(
              onPointerDown: (_) {
                _userInteracting = true;
              },
              onPointerUp: (_) {
                _userInteracting = false;
              },
              child: GoogleMap(
                mapType: MapType.normal,
                markers: {
                  Marker(
                    position: LatLng(latitude, longitude),
                    markerId: MarkerId("students"),
                  ),
                  Marker(
                    position: LatLng(schoolLatitude, schoolLongitude),
                    markerId: MarkerId("school"),
                    icon: schoolIcon,
                  ),
                },
                initialCameraPosition: CameraPosition(
                  target: LatLng(latitude, longitude),
                  zoom: 14.47,
                ),
                onMapCreated: (GoogleMapController controller) {
                  setState(() {
                    _controller = controller;
                    _added = true;
                  });
                },
              ),
            );
          } catch (e) {
            print("Error in StreamBuilder: $e");
            return Center(child: Text('An error occurred: $e'));
          }
        },
      ),
    );
  }

  Future<void> mymap(double latitude, double longitude) async {
    try {
      await _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(latitude, longitude),
            zoom: 12.47,
          ),
        ),
      );
    } catch (e) {
      print("Error in mymap: $e");
    }
  }
}
