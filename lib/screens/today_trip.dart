import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'bus_info.dart';
import 'live.dart';
import 'notification.dart';

class TodayTrip extends StatelessWidget {
  const TodayTrip({super.key});
  static const String routeName = 'today-trip';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.all(
              15,
            ),
            child: Container(
              width: 396,
              height: 66,
              decoration: BoxDecoration(
                  color: Color(0xffc1cbd1),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset('assets/parent_logo.png'),
                  SizedBox(
                    width: 50,
                  ),
                  Text(
                    'Student Home Road',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          BuildPersonToTrack(context, 'Aya Hossam',
              'https://firebasestorage.googleapis.com/v0/b/ischool-web-a2d36.appspot.com/o/admin%2Fimage%2FAya%20Hossam.jpg?alt=media&token=174cd4f7-2705-4ab6-abdc-84066bfbead0'),
          BuildPersonNotToTrack(context, 'Omnia Hossam',
              'https://firebasestorage.googleapis.com/v0/b/ischool-web-a2d36.appspot.com/o/admin%2Fimage%2FOmnia%20Hossam.jpg?alt=media&token=dada4ad2-8cd7-4ea1-b8f7-77de0837990f'),
        ],
      ),
    );
    /*Column(
      children: [
        Padding(
          padding: EdgeInsets.all(
            35,
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
                SizedBox(width: 10.0,),
                Image.asset('assets/parent_logo.png',height: 40,width: 40,),
                SizedBox(width: 50.0,),
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
                     '   Today Trips',
                  style: TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 40.0,
                ),
                Stack(
                  children: [
                    Padding(padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),child: CircleAvatar(backgroundColor: Colors.red,radius: 3.0,)),
                    IconButton(onPressed: () => Navigator.pushNamed(context, Notifications.routeName), icon: Icon(Icons.notifications_none,color: Colors.black),)
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20.0,),
        Padding(padding: EdgeInsets.only(right: 250.0),child: Text('Morning Trip',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),),
        SizedBox(height: 10.0,),
        Container(
          height: 213,
          width: 428,
          decoration: BoxDecoration(
            color: Color(0xffc2ccd2),
            borderRadius: BorderRadius.all(Radius.circular(25.0,),),
          ),
          child: Column(
            children: [
              SizedBox(height: 5.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('To School'),
                  SizedBox(width: 150.0,),
                  Text('6:00 AM'),
                ],
              ),
              SizedBox(height: 20.0,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                children: [
                    Image.asset(
                      'assets/image_row.png',
                      height: 60,
                    ),
                    Image.asset(
                      'assets/image_row_two.png',
                      height: 60,
                    ),
                    Image.asset(
                      'assets/image_row.png',
                      height: 60,
                    ),
                    Image.asset(
                      'assets/image_row_two.png',
                      height: 60,
                    ),
                    Image.asset(
                      'assets/image_row.png',
                      height: 60,
                    ),
                    Image.asset(
                      'assets/image_row_two.png',
                      height: 60,
                    ),
                    Image.asset(
                      'assets/image_row.png',
                      height: 60,
                    ),
                    Image.asset(
                      'assets/image_row_two.png',
                      height: 60,
                    ),
                    Image.asset(
                      'assets/image_row.png',
                      height: 60,
                    ),
                    Image.asset(
                      'assets/image_row_two.png',
                      height: 60,
                    ),
                    Image.asset('assets/image_row_two.png', height: 60),
                    Image.asset('assets/image_row.png', height: 60),
                    Image.asset('assets/image_row_two.png', height: 60),
                    Image.asset('assets/image_row.png', height: 60),
                    Image.asset('assets/image_row_two.png', height: 60),
                    Image.asset('assets/image_row.png', height: 60),
                    Image.asset('assets/image_row_two.png', height: 60),
                    Image.asset('assets/image_row.png', height: 60),
                    Image.asset('assets/image_row_two.png', height: 60),
                    Image.asset('assets/image_row.png', height: 60),
                  ],
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              InkWell(
                child: Image.asset('assets/start_button.png'),
                onTap: () => Navigator.pushNamed(context, Live.routeName),
              ),
            ],
          ),
        ),
        //Image(image: AssetImage('assets/today_trip_container.png'),height: 250,width: 386,),
        SizedBox(height: 40.0,),
        Padding(padding: EdgeInsets.only(right: 250.0),child: Text('After Noon',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),),
        SizedBox(height: 10.0,),
        Container(
          height: 213,
          width: 428,
          decoration: BoxDecoration(
            color: Color(0xffc2ccd2),
            borderRadius: BorderRadius.all(Radius.circular(25.0,),),
          ),
          child: Column(
            children: [
              SizedBox(height: 5.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('To Home'),
                  SizedBox(width: 150.0,),
                  Text('2:00 AM'),
                ],
              ),
              SizedBox(height: 20.0,),
              SingleChildScrollView(scrollDirection: Axis.horizontal,child: Row(
                children: [
                    Image.asset('assets/image_row_two.png', height: 60),
                    Image.asset('assets/image_row.png', height: 60),
                    Image.asset('assets/image_row_two.png', height: 60),
                    Image.asset('assets/image_row.png', height: 60),
                    Image.asset('assets/image_row_two.png', height: 60),
                    Image.asset('assets/image_row.png', height: 60),
                    Image.asset('assets/image_row_two.png', height: 60),
                    Image.asset('assets/image_row.png', height: 60),
                    Image.asset('assets/image_row_two.png', height: 60),
                    Image.asset('assets/image_row.png', height: 60),
                    Image.asset(
                      'assets/image_row.png',
                      height: 60,
                    ),
                    Image.asset(
                      'assets/image_row_two.png',
                      height: 60,
                    ),
                    Image.asset(
                      'assets/image_row.png',
                      height: 60,
                    ),
                    Image.asset(
                      'assets/image_row_two.png',
                      height: 60,
                    ),
                    Image.asset(
                      'assets/image_row.png',
                      height: 60,
                    ),
                    Image.asset(
                      'assets/image_row_two.png',
                      height: 60,
                    ),
                    Image.asset(
                      'assets/image_row.png',
                      height: 60,
                    ),
                    Image.asset(
                      'assets/image_row_two.png',
                      height: 60,
                    ),
                    Image.asset(
                      'assets/image_row.png',
                      height: 60,
                    ),
                    Image.asset(
                      'assets/image_row_two.png',
                      height: 60,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Image.asset('assets/start_button.png'),
            ],
          ),
        ),
        //Image(image: AssetImage('assets/today_trip_container.png'),height: 250,width: 386,),
      ],
    );*/
  }

  Widget BuildPersonToTrack(BuildContext context, String name, String image) {
    return Padding(
      padding: EdgeInsets.all(
        15,
      ),
      child: Container(
        height: 166,
        width: 396,
        decoration: BoxDecoration(
          color: Color(0xffc1cbd1),
          borderRadius: BorderRadius.all(
            Radius.circular(
              25,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 35),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30.0, // Adjust the radius as needed
                child: ClipOval(
                  child: Image.network(
                    image,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Class 3-B',
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        'Time to go out',
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w400,
                            fontSize: 12),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '2.00',
                        style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.w400,
                            fontSize: 12),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      CircleAvatar(backgroundColor: Colors.green, radius: 5),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'In Bus',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 13),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, BusInfo.routeName),
                    child: Row(
                      children: [
                        Icon(
                          Icons.info,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Bus Info')
                      ],
                    ),
                  )
                ],
              ),
              Spacer(),
              GestureDetector(
                child: Container(
                  width: 90,
                  height: 33,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: Color(0xff0450E3),
                  ),
                  child: Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text('Track', textAlign: TextAlign.center)),
                ),
                onTap: () {
                  Navigator.pushNamed(context, Live.routeName);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget BuildPersonNotToTrack(
      BuildContext context, String name, String image) {
    return Padding(
      padding: EdgeInsets.all(
        15,
      ),
      child: Container(
        height: 166,
        width: 396,
        decoration: BoxDecoration(
          color: Color(0xffc1cbd1),
          borderRadius: BorderRadius.all(
            Radius.circular(
              25,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 35),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30.0, // Adjust the radius as needed
                child: ClipOval(
                  child: Image.network(
                    image,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Class 3-C',
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        'Time to go out',
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w400,
                            fontSize: 12),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '2.00',
                        style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.w400,
                            fontSize: 12),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      CircleAvatar(backgroundColor: Colors.orange, radius: 5),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'In School',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 13),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, BusInfo.routeName),
                    child: Row(
                      children: [
                        Icon(
                          Icons.info,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Bus Info')
                      ],
                    ),
                  )
                ],
              ),
              Spacer(),
              Container(
                width: 90,
                height: 33,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: Color(0xff98BBFF),
                ),
                child: Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text('Track', textAlign: TextAlign.center)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}