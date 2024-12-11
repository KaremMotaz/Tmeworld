import 'dart:io';
import 'package:flutter/material.dart';
import 'package:timeworld/pages/home_page.dart';
import 'package:timeworld/pages/loading_page.dart';
import 'package:timeworld/pages/location_page.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoadingPage(),
        '/home': (context) => const HomePage(),
        '/location': (context) => const LocationPage(),
      },
    );
  }
}
