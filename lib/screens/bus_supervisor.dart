import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:mobile_tracker_two/screens/login.dart';

import '../shared/components.dart';
import '../shared/constant.dart';
import 'forgot_password.dart';

class BusSupervisor extends StatelessWidget {
  static const String routeName = 'bus-supervisor';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: whiteColor,
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/bus_supervisor.png',
                      width: 372,
                      height: 372,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Bus Supervisor',
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 32,color: Colors.white),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Coordinating appointments wit the bus driver',
                      style: TextStyle(fontSize: 15,color: Colors.white),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'and the students families, Supervising',
                      style: TextStyle(fontSize: 15,color: Colors.white),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'children during the trip',
                      style: TextStyle(fontSize: 15,color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    DotsIndicator(
                      dotsCount: 2,
                      position: 1,
                      decorator: DotsDecorator(
                        activeColors: [Colors.black, Color(0xfff2ba52)],
                        size: const Size.square(9.0),
                        activeSize: const Size(35.0, 9.0),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    defaultButton(
                        textStyle: Colors.black,
                        background: primaryColor,
                        function: () => Navigator.pushNamedAndRemoveUntil(
                            context, Login.routeName, (route) => false),
                        text: 'Next'),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
