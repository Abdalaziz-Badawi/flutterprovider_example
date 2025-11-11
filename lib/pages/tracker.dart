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
        title: Text('Tracker Page', style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center,), centerTitle: true,

        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/homepage');
            },
          ),
        ],
      ),

      body: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              Container(
                height: 300,
                color: Colors.transparent,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,


                children: [                  
                  Text(
                    context.watch<TrackerProvider>().trackedNumber.toString(),
                    style: const TextStyle(color: Color.fromARGB(255, 255, 78, 78), fontSize: 48, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const Text('You can do better!', style: TextStyle(color: Color.fromARGB(255, 32, 31, 31), fontSize: 13, fontWeight: FontWeight.bold)),

                ],
              )

            ],
          ),
        ],
      ),
    );
  }
}