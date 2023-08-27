import 'package:flutter/material.dart';

import 'views/home.dart';
import 'views/onboarding.dart';
import 'views/login.dart';
import 'views/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Constructor

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/onboarding',
        routes: <String, WidgetBuilder>{
          // All available pages
          '/onboarding': (_) => const Onboarding(),
          '/login': (_) => const Login(),
          '/home': (_) => const Home(),
          '/register': (_) => const Register(),
        },
        theme: ThemeData(
          textTheme:
              Theme.of(context).textTheme.apply(fontFamily: 'Montserrat'),
          scaffoldBackgroundColor: Colors.white,
        ),
      ),
    );
  }
}
