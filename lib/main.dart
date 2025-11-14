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
    
    // To use provider state management, we wrap MaterialApp widget with MultiProvider widget, 
    // that takes a list of providers.
    // And a child (MaterialApp) that will be able to access those providers.
    
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => TrackerProvider())],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          // colorScheme: ColorScheme.light(surface: Color.fromARGB(255, 189, 98, 98),),
          appBarTheme: const AppBarTheme(
            elevation: 80,
            // backgroundColor: Color.fromARGB(255, 255, 255, 255),
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.transparent,
            foregroundColor: Color.fromARGB(255, 0, 0, 0),
            centerTitle: true,
            
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          colorScheme: ColorScheme.light(surface: Color.fromARGB(255, 223, 223, 223),),
        
        
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            // backgroundColor: Colors.white,
            elevation: 10,
            foregroundColor: Color.fromARGB(255, 0, 0, 0),
            // shape: CircleBorder(),
          ),

        ),
        home: const MyHomePage(title: 'Homepage'),

        // Navigation routes 
        routes: {
          '/tracker': (context) => const Tracker(),
          '/homepage': (context) => const MyHomePage(title: 'Homepage'),
        },


      ),
    );
  }
}
