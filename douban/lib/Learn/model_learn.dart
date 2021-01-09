 
import 'package:flutter/material.dart';

class KLCounterModel with ChangeNotifier {
  int _rCounter = 55;

 int get rCounter {
    return _rCounter;
  }

  set rCounter(int value) {
    _rCounter = value;
    notifyListeners();
  }
}
