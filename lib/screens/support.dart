import 'package:flutter/material.dart';
import 'package:mobile_tracker_two/shared/constant.dart';

import 'home.dart';
import 'notification.dart';

class Support extends StatelessWidget {
  const Support({super.key});

  static const String routeName = 'support';

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          color: thirdColor,
          child: Scaffold(
              backgroundColor: Colors.transparent,
            body: Padding(padding: EdgeInsets.all(11.4),child: Column(
              children: [
                    Padding(
                      padding: EdgeInsets.all(
                        23,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xffc2ccd2),
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                20.0,
                              ),
                            )),
                        width: 396,
                        height: 66.0,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10.0,
                            ),
                            InkWell(
                              child: Image.asset(
                                'assets/parent_logo.png',
                                height: 40,
                                width: 40,
                              ),
                              onTap: () =>
                                  Navigator.pushNamed(context, Home.routeName),
                            ),
                            SizedBox(
                              width: 80.0,
                            ),
                            // IconButton(
                            //   onPressed: () => Drawer(
                            //     backgroundColor: thirdColor,
                            //     child: ListView(
                            //       children: [
                            //         const DrawerHeader(
                            //           decoration: BoxDecoration(
                            //             color: Color(0xff0C344C),
                            //           ),
                            //           child: Image(
                            //             image: AssetImage(
                            //               'assets/logo.png',
                            //             ),
                            //           ),
                            //         ),
                            //         ListTile(
                            //           title: const Image(
                            //             image: AssetImage(
                            //               'assets/today_trips.png',
                            //             ),
                            //           ),
                            //           onTap: () {
                            //             // Update the state of the app.
                            //             // ...
                            //           },
                            //         ),
                            //         ListTile(
                            //           title: const Image(
                            //             image: AssetImage(
                            //               'assets/live.png',
                            //             ),
                            //           ),
                            //           onTap: () {
                            //             // Update the state of the app.
                            //             // ...
                            //           },
                            //         ),
                            //         ListTile(
                            //           title: const Image(
                            //             image: AssetImage(
                            //               'assets/face_recongnition.png',
                            //             ),
                            //           ),
                            //           onTap: () {
                            //             // Update the state of the app.
                            //             // ...
                            //           },
                            //         ),
                            //         ListTile(
                            //           title: const Image(
                            //             image: AssetImage(
                            //               'assets/student_sheet.png',
                            //             ),
                            //           ),
                            //           onTap: () {
                            //             // Update the state of the app.
                            //             // ...
                            //           },
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            //   icon: Icon(
                            //     Icons.menu,
                            //     color: Colors.black,
                            //   ),
                            // ),
                            // SizedBox(
                            //   width: 50.0,
                            // ),
                            Text(
                              ' Support',
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 40.0,
                            ),
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
                    SizedBox(
                      height: 15.0,
                    ),
                    Image.asset('assets/how_can_we_help_you_today.png'),
                    SizedBox(
                      height: 60.0,
                    ),
                    Image.asset('assets/rectangle_phone.png'),
                  ],
            ),)
        )
    )]);
  }
}
