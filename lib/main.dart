import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:night_in/views/home.dart';
import 'package:night_in/views/login.dart';
import 'package:night_in/views/maps.dart';
import 'package:night_in/views/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Constructor

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFFF6F6F6),
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/onboarding',
        routes: <String, WidgetBuilder>{
          // All available pages
          '/onboarding': (_) => const Onboarding(),
          '/login': (_) => const Login(),
          '/home': (_) => const Home(),
          '/maps': (_) => const Maps(),
        },
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFF6F6F6),
          fontFamily: 'Montserrat',
        ),
      ),
    );
  }
}
