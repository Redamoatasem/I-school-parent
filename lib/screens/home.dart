import 'package:flutter/material.dart';
import 'package:mobile_tracker_two/screens/notification.dart';
import 'package:mobile_tracker_two/screens/setting.dart';
import 'package:mobile_tracker_two/screens/student_sheet.dart';
import 'package:mobile_tracker_two/screens/today_trip.dart';
import 'package:mobile_tracker_two/shared/constant.dart';

import 'live.dart';

class Home extends StatefulWidget {
Home({super.key});

static const String routeName = 'home';
@override
State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  int currentIndex = 0;
  List<Widget> screens = [TodayTrip(),Live(),Notifications(),Setting()];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: thirdColor,child: Stack(children: [Scaffold(
      backgroundColor: Colors.transparent,
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        unselectedItemColor: Colors.white,
        selectedItemColor: primaryColor,
        items:
        [
          BottomNavigationBarItem(
              icon: Icon(Icons.home,),
              label: 'Home',
              backgroundColor: secondryColor,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on_outlined,),
              label: 'Live',
              backgroundColor: secondryColor),
          BottomNavigationBarItem(
              icon: Icon(
                //AssetImage('assets/notification.png',),
                 Icons.notifications_none,
              ),
              label: 'Notification',
              backgroundColor: secondryColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings,),
              label: 'Setting',
              backgroundColor: secondryColor),
        ],
      ),
    )
    ],
    ),
    );
  }
}
