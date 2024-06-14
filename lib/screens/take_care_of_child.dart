import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import '../shared/components.dart';
import '../shared/constant.dart';
import 'login.dart';

class TakeCareOfChild extends StatelessWidget {
  static const String routeName = 'take-care';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: thirdColor,
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
                      'assets/take_care_of_child.png',
                      width: 372,
                      height: 372,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Take Care Of Your Child',
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 32,color: whiteColor),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'When your child boards the bus your child\'s',
                      style: TextStyle(fontSize: 15,color: Colors.white),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'attendance will be registered and you can monitor',
                      style: TextStyle(fontSize: 15,color: whiteColor),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'them safely until he reaches at school',
                      style: TextStyle(fontSize: 15,color: whiteColor),
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
