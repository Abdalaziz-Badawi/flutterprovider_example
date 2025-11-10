import 'package:flutter/material.dart';

class TrackerProvider extends ChangeNotifier {
  int trackedNumber ;

  TrackerProvider({
    this.trackedNumber = 0,
  });

  void updateTracker({
    required int newNumber,
  }) {
    trackedNumber = newNumber;
    notifyListeners();
  }


}