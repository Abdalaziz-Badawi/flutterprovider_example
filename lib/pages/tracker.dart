import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/providers/tracker_provider.dart';






class Tracker extends StatefulWidget {
  const Tracker({super.key});

  @override
  State<Tracker> createState() => _TrackerState();
}

class _TrackerState extends State<Tracker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Tracker Page'),

        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.pushNamed(context, '/homepage');
            },
          ),
        ],

      ),

      body: Column(
        children: [
          const Text('Tracker Page'),
          const Text('The latest number reached in the homepage will be mirrored here!'),

          // You can add a Consumer widget here to listen to changes in the provider
          // Consumer<TrackerProvider>(
          //   builder: (context, trackerProvider, child) {
          //     return Text(
          //       'Tracked Number: ${trackerProvider.trackedNumber}',
          //       style: TextStyle(fontSize: 24),
          //     );
          //   },
          // ),

          Text(
            context.watch<TrackerProvider>().trackedNumber.toString(),
            style: const TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),


        ],
      ),
    );
  }
}