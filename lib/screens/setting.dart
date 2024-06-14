import 'package:flutter/material.dart';
import 'package:mobile_tracker_two/Network/local/cache_helper.dart';
import 'package:mobile_tracker_two/screens/login.dart';
import 'package:mobile_tracker_two/screens/profile.dart';
import 'package:mobile_tracker_two/screens/support.dart';
import 'package:mobile_tracker_two/shared/constant.dart';

import 'bus_info.dart';
class Setting extends StatelessWidget {
  const Setting({super.key});
  static const String routeName = 'setting';
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: whiteColor,
          child: Scaffold(
            backgroundColor: Color(0xff071a26),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 90,
                  ),
                  InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, Profile.routeName),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10.0,
                        ),
                        Image.asset(
                          'assets/ic_profile.PNG',
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, Support.routeName),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10.0,
                        ),
                        Image.asset(
                          'assets/support.PNG',
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Support',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, BusInfo.routeName),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10.0,
                        ),
                        Image.asset(
                          'assets/ic_bus_info.PNG',
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(width: 15),
                        Text(
                          'Bus Info',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 400.0,
                  ),
                  InkWell(
                    onTap: () {
                      CacheHelper.removeData(key: 'isLogged');
                      Navigator.pushNamedAndRemoveUntil(
                          context, Login.routeName, (route) => false);
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          width: 200.0,
                        ),
                        Text(
                          'Log Out',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Image.asset(
                          'assets/ic_log_out.PNG',
                          width: 50,
                          height: 50,
                        )
                      ],
                    ),
                  ),
                ],
            ),)
          ),
      ],
    );
  }
}
