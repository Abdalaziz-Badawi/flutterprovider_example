import 'package:flutter/material.dart';

class TrackerProvider extends ChangeNotifier {
  int trackedNumber = 0;

  void updateTracker(int newNumber) {
    trackedNumber = newNumber;
    notifyListeners();
  }

  void incrementTracker() {
    trackedNumber++;
    notifyListeners();

    // if (trackedNumber == 10) {
    //   trackedNumber =  trackedNumber + 25;
    //   notifyListeners();
    // }    else if (trackedNumber == 100) {
    //   trackedNumber = trackedNumber + 50;
    //   notifyListeners();
    // }    else {
    //   trackedNumber = trackedNumber + 75;
    //   notifyListeners();
    // }


  }

  void resetTracker() {
    trackedNumber = 0;
    notifyListeners();
  }
}
