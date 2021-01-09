import 'dart:math';

import 'package:flutter/material.dart';

extension KLColorExt on Colors {
   Color  randomColor()  {
    return Color.fromRGBO(
        Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1);
  }
}
