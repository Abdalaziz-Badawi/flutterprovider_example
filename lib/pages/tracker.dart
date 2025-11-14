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
      // backgroundColor: Theme.of(context).colorScheme.inversePrimary,

      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Tracker'),

        centerTitle: true,

        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/homepage');
            },
          ),
        ],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            // Container(
            //   height: 300,
            //   color: Colors.transparent,
            // ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                // Text(
                //   context.watch<TrackerProvider>().trackedNumber.toString(),
                //   style: const TextStyle(
                //     color: Color.fromARGB(255, 255, 0, 0),
                //     fontSize: 48,
                //     fontWeight: FontWeight.bold,
                //   ),
                //   textAlign: TextAlign.center,
                // ),

                Consumer<TrackerProvider>(
                  builder: (context, trackerProvider, child) {
                    return Text(
                      trackerProvider.trackedNumber.toString(),
                      style: const TextStyle(
                        // color: Color.fromARGB(255, 29, 88, 213),
                        color: Colors.black,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    );
                  },
                ),
                const Text(
                  'You can do better!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<TrackerProvider>().resetTracker();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Counter Reset to 0')),
          );
        },
        tooltip: 'Reset',
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        child: const Icon(Icons.refresh),

      ),
    );
  }
}
