import 'package:flutter/material.dart';

import 'views/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        // All available pages
        '/': (_) => const Login(),
      },
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Montserrat'),
      ),
    );
  }
}
