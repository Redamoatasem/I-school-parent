import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart';
import 'home.dart';
import 'notification.dart';
import 'order_tracking_page.dart';

class Live extends StatefulWidget {
  const Live({super.key});
  static const String routeName = 'live';

  @override
  State<Live> createState() => _LiveState();
}

class _LiveState extends State<Live> {
  final loc.Location location = loc.Location();
  StreamSubscription<loc.LocationData>? _locationSubscription;
  Timer? _locationUpdateTimer;

  GoogleMapController? _controller;

  static const String userLocationId = 'user';

  static CameraPosition userLocation = const CameraPosition(
    target: LatLng(30.0360786, 31.1965017),
    zoom: 17,
  );

  Set<Marker> markers = {
    Marker(
        markerId: const MarkerId(userLocationId), position: userLocation.target)
  };

  @override
  void initState() {
    super.initState();
    _checkPermissionAndInitialize();
    location.changeSettings(interval: 300, accuracy: loc.LocationAccuracy.high);
    location.enableBackgroundMode(enable: true);
  }

  Future<void> _checkPermissionAndInitialize() async {
    var status = await Permission.location.status;
    if (status.isGranted) {
      print('Permission granted');
    } else if (status.isDenied) {
      var result = await Permission.location.request();
      if (result.isGranted) {
        print('Permission granted after request');
      } else {
        _showPermissionDeniedDialog();
      }
    } else if (status.isPermanentlyDenied) {
      _showPermissionDeniedDialog();
    }
  }

  void _showPermissionDeniedDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Location Permission'),
        content: Text('This app needs location access to function properly. Please enable location permission in settings.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              openAppSettings();
              Navigator.of(context).pop();
            },
            child: Text('Open Settings'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 3000,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(34),
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xffc2ccd2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    )),
                width: 396,
                height: 66.0,
                child: Row(
                  children: [
                    SizedBox(width: 10.0),
                    InkWell(
                      child: Image.asset(
                        'assets/parent_logo.png',
                        height: 40,
                        width: 40,
                      ),
                      onTap: () => Navigator.pushNamed(context, Home.routeName),
                    ),
                    SizedBox(width: 50.0),
                    Text(
                      'Ongoing Trip',
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 40.0),
                    Stack(
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 10),
                            child: CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 3.0,
                            )),
                        IconButton(
                          onPressed: () => Navigator.pushNamed(
                              context, Notifications.routeName),
                          icon: Icon(Icons.notifications_none,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        _moveStudentLocation('Reda Moatasem');
                      },
                      child: Text('Move student Reda')),
                  ElevatedButton(
                      onPressed: () {
                        _moveStudentLocation('Khaled Said');
                      },
                      child: Text('Move student Khaled')),
                  ElevatedButton(
                      onPressed: () {
                        _moveStudentLocation('Aya Hossam');
                      },
                      child: Text('Move student Aya')),
                  ElevatedButton(
                      onPressed: () {
                        _moveStudentLocation('Omnia Hossam');
                      },
                      child: Text('Move student Omnia')),
                  ElevatedButton(
                      onPressed: () {
                        _moveStudentLocation('Sandy Selim');
                      },
                      child: Text('Move student Sandy')),
                  TextButton(
                      onPressed: () {
                        _stopListening();
                      },
                      child: Text('stop live location')),
                  Expanded(
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('location')
                          .snapshots(),
                      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        }
                        return ListView.builder(
                            itemCount: snapshot.data?.docs.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                  title: Text(snapshot.data!.docs[index]['name']
                                      .toString()),
                                  subtitle: Row(
                                    children: [
                                      Text(snapshot.data!.docs[index]['latitude']
                                          .toString()),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(snapshot.data!.docs[index]['longitude']
                                          .toString()),
                                    ],
                                  ),
                                  trailing: IconButton(
                                    icon: Icon(Icons.directions),
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => OrderTrackingPage(
                                        id: 'A3V0GwsRhWNVgUAdvuDeT7vfxUi1',
                                          // id: snapshot.data!.docs[index].id,
                                      )));
                                    },
                                  )
                              );
                            });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getCurrentLocation() async {
    try {
      final loc.LocationData _locationResult = await location.getLocation();
      await FirebaseFirestore.instance
          .collection('location')
          .doc('currentLocation')
          .set({
        'latitude': _locationResult.latitude,
        'longitude': _locationResult.longitude,
        'name': 'students'
      }, SetOptions(merge: true));
    } catch (e) {
      print(e);
    }
  }

  _getDestinationLocation() async {
    try {
      final loc.LocationData _locationResult = await location.getLocation();
      await FirebaseFirestore.instance.collection('location').doc('des').set({
        'latitude': _locationResult.latitude,
        'longitude': _locationResult.longitude,
        'name': 'school'
      }, SetOptions(merge: true));
    } catch (e) {
      print(e);
    }
  }

  Future<void> _listenCurrentLocation() async {
    _locationSubscription = location.onLocationChanged.handleError((onError) {
      print(onError);
      _locationSubscription?.cancel();
      setState(() {
        _locationSubscription = null;
      });
    }).listen((loc.LocationData currentlocation) async {
      await FirebaseFirestore.instance
          .collection('location')
          .doc('currentLocation')
          .set({
        'latitude': currentlocation.latitude,
        'longitude': currentlocation.longitude,
        'name': 'students'
      }, SetOptions(merge: true));
    });
  }

  Future<void> _listenDestinationLocation() async {
    _locationSubscription = location.onLocationChanged.handleError((onError) {
      print(onError);
      _locationSubscription?.cancel();
      setState(() {
        _locationSubscription = null;
      });
    }).listen((loc.LocationData currentlocation) async {
      await FirebaseFirestore.instance.collection('location').doc('des').set({
        'latitude': currentlocation.latitude,
        'longitude': currentlocation.longitude,
        'name': 'school'
      }, SetOptions(merge: true));
    });
  }

  _stopListening() {
    _locationSubscription?.cancel();
    _locationUpdateTimer?.cancel();
    setState(() {
      _locationSubscription = null;
      _locationUpdateTimer = null;
    });
  }

  _moveStudentLocation(String studentName) async {
    try {
      _locationUpdateTimer?.cancel(); // Cancel any existing timer

      _locationUpdateTimer = Timer.periodic(Duration(seconds: 1), (timer) async {
        final DocumentSnapshot snapshot = await FirebaseFirestore.instance
            .collection('location')
            .doc(studentName)
            .get();

        if (snapshot.exists) {
          final data = snapshot.data() as Map<String, dynamic>;
          double currentLatitude = data['latitude'];
          double currentLongitude = data['longitude'];

          double newLatitude = currentLatitude + 0.0001;
          double newLongitude = currentLongitude + 0.0001;

          await FirebaseFirestore.instance
              .collection('location')
              .doc(studentName)
              .update({
            'latitude': newLatitude,
            'longitude': newLongitude,
          });

          print("Moved student location to: ($newLatitude, $newLongitude)");
        } else {
          print('No such document exists!');
        }
      });
    } catch (e) {
      print('Error moving student location: $e');
    }
  }
}
