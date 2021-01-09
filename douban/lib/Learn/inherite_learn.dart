


import 'package:flutter/material.dart';

class KLICounterWidget extends InheritedWidget {

final int rCounter  ;

    final Widget child;

      KLICounterWidget({Key key, this.child,this.rCounter = 100}) : super(key: key, child: child);



  static KLICounterWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<KLICounterWidget>();
  }

  @override
  bool updateShouldNotify(KLICounterWidget oldWidget) {
    return true;
  }
}


 