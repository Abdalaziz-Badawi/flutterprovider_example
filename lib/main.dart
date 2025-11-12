import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/homepage.dart';
import 'package:flutter_application_1/pages/tracker.dart';
// import 'package:flutter_application_1/pages/';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/providers/tracker_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => TrackerProvider())],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          // colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 0, 0)),
          colorScheme: ColorScheme.light(
            surface: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        home: const MyHomePage(title: 'Homepage'),

        routes: {
          '/tracker': (context) => const Tracker(),
          '/homepage': (context) => const MyHomePage(title: 'Homepage'),
        },
      ),
    );
  }
}
