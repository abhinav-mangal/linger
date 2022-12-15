import 'dart:ui';

import 'package:flutter/animation.dart';

class CustomTween extends Tween<Offset> {
  @override
  final Offset? begin;
  @override
  final Offset? end;
  final Offset? control;

  CustomTween({this.begin, this.end, this.control})
      : super(begin: begin, end: end);

  @override
  Offset lerp(double t) {
    assert(begin != null);
    assert(end != null);
    assert(control != null);
    final t1 = 1 - t;
    return begin! * t1 * t1 + control! * 2 * t1 * t + end! * t * t;
  }
}
