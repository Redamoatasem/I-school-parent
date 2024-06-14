import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import '../shared/components.dart';
import '../shared/constant.dart';
import 'take_care_of_child.dart';

class BusArrived extends StatelessWidget {
  static const String routeName = 'bus-arrived';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: thirdColor,
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child:Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/bus_arrived.png',
                      width: 372,
                      height: 372,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'The Bus Has Arrived',
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 32,color: whiteColor),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'When the bus arrives in front of your house',
                      style: TextStyle(fontSize: 15,color: whiteColor),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'you will be notified of its arrival',
                      style: TextStyle(fontSize: 15,color: whiteColor),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //
                    DotsIndicator(
                      dotsCount: 2,
                      position: 0,
                      decorator: DotsDecorator(
                        activeColors: [Color(0xfff2ba52), Colors.black],
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
                            context, TakeCareOfChild.routeName, (route) => false),
                        text: 'Next'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
