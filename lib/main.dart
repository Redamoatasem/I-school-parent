import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobile_tracker_two/screens/bus_driver.dart';
import 'package:mobile_tracker_two/screens/bus_info.dart';
import 'package:mobile_tracker_two/screens/create_new_password.dart';
import 'package:mobile_tracker_two/screens/forgot_password.dart';
import 'package:mobile_tracker_two/screens/live.dart';
import 'package:mobile_tracker_two/screens/notification.dart';
import 'package:mobile_tracker_two/screens/otp_verification.dart';
import 'package:mobile_tracker_two/screens/profile.dart';
import 'package:mobile_tracker_two/screens/setting.dart';
import 'package:mobile_tracker_two/screens/support.dart';
import 'package:mobile_tracker_two/screens/take_care_of_child.dart';
import 'package:mobile_tracker_two/screens/home.dart';
import 'package:mobile_tracker_two/screens/login.dart';
import 'package:mobile_tracker_two/screens/register.dart';
import 'package:mobile_tracker_two/screens/splash.dart';
import 'package:mobile_tracker_two/screens/bus_arrived.dart';
import 'package:mobile_tracker_two/screens/today_trip.dart';
import 'package:mobile_tracker_two/shared/app_provider.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  var provider = AppProvider();
  runApp(ChangeNotifierProvider(
      create: (buildContext) {
        return provider;
      },
      child:MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Splash.routeName,
      routes: {
        Splash.routeName:(context) => Splash(),
        Login.routeName:(context) => Login(),
        Register.routeName:(context) => Register(),
        TakeCareOfChild.routeName:(context) => TakeCareOfChild(),
        BusArrived.routeName:(context) => BusArrived(),
        Home.routeName:(context) => Home(),
        Live.routeName:(context) => Live(),
        ForgotPassword.routeName:(context) => ForgotPassword(),
        CreateNewPassword.routeName:(context) => CreateNewPassword(),
        OtpVerification.routeName:(context) => OtpVerification(),
        TodayTrip.routeName:(context) => TodayTrip(),
        BusInfo.routeName:(context) => BusInfo(),
        BusDriver.routeName:(context) => BusDriver(),
        Notifications.routeName:(context) => Notifications(),
        Profile.routeName:(context) => Profile(),
        Setting.routeName:(context) => Setting(),
        Support.routeName:(context) => Support(),
      },
    );
  }
}