import 'package:flutter/material.dart';

// class TrackerProvider extends ChangeNotifier {
//   int trackedNumber ;

//   TrackerProvider({
//     this.trackedNumber = 0,
//   });

//   void updateTracker({
//     required int newNumber,
//   }) {
//     trackedNumber = newNumber;
//     notifyListeners();
//   }


// }



class TrackerProvider extends ChangeNotifier {
  int trackedNumber = 0;

  void updateTracker(int newNumber) {
    trackedNumber = newNumber;
    notifyListeners();
  }

  void incrementTracker() {
    trackedNumber++;
    notifyListeners();


  }



}