import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/providers/tracker_provider.dart';
import 'package:flutter_application_1/assets/components/floating_appbar.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    context.read<TrackerProvider>().incrementTracker();
  }

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      appBar: FloatingAppbar(
        backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
        key: const Key('floating_appbar_homepage'),
        title: 'Homepage',
        actions: [
          IconButton(
            icon: const Icon(Icons.track_changes),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/tracker');
            },
          ),
        ],
      ),
      // appBar: AppBar(
      //   // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: Text('Homepage'),
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.track_changes),
      //       onPressed: () {
      //         Navigator.pushReplacementNamed(context, '/tracker');
      //       },
      //     ),
      //   ],
      // ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              context.watch<TrackerProvider>().trackedNumber.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Text('Is the current value tracked'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _incrementCounter();
          // ScaffoldMessenger.of(context).showSnackBar(
          //   const SnackBar(content: Text('Value Incremented by 1')),
          // );
        },

        tooltip: 'Increment',
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        icon: const Icon(Icons.add),
        label: const Text('Increment'),
      ),
    );
    return scaffold;
  }
}
