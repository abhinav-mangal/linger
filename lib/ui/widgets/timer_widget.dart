import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class BeautifulTimer extends StatefulWidget {
  final AnimationController? animationController;
  final AnimationController? animationController2;
  const BeautifulTimer(
      {Key? key, this.animationController, this.animationController2})
      : super(key: key);

  @override
  _BeautifulTimerState createState() => _BeautifulTimerState();
}

class _BeautifulTimerState extends State<BeautifulTimer> {
  CurvedAnimation? curvendAnimation;
  CurvedAnimation? curvendAnimation2;
  @override
  void initState() {
    super.initState();
    curvendAnimation = CurvedAnimation(
      parent: widget.animationController!,
      curve: Curves.decelerate,
    );
    curvendAnimation2 = CurvedAnimation(
      parent: widget.animationController2!,
      curve: Curves.decelerate,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: curvendAnimation2!,
        builder: (_, __) {
          return AnimatedBuilder(
            animation: curvendAnimation!,
            builder: (_, __) {
              return CustomPaint(
                painter: TimerPainter(
                    curvendAnimation!.value, curvendAnimation2!.value),
              );
            },
          );
        });
  }
}

class TimerPainter extends CustomPainter {
  double animationValue;
  double animationValue2;

  TimerPainter(this.animationValue, this.animationValue2);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color(0xFFF6F6F8).withOpacity(.5)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..shader;
    Path drawCircle = this.drawCircle(const Offset(0, 0));

    ui.PathMetrics pathMetrics = drawCircle.computeMetrics();
    for (ui.PathMetric pathMetric in pathMetrics) {
      Path extractPath = pathMetric.extractPath(
        0.0,
        pathMetric.length * animationValue,
      );
      canvas.drawPath(extractPath, paint);
    }

    if (animationValue == 1.0) {
      paint = Paint()
        ..strokeWidth = 15
        ..style = PaintingStyle.stroke
        ..shader
        ..strokeCap = StrokeCap.round
        ..shader =
            ui.Gradient.linear(const Offset(30, 30), const Offset(-35, -35), [
          const Color(0xFFC034EB),
          const Color(0xFFE23535),
        ]);

      drawCircle = this.drawCircle(const Offset(0, 0));
      ui.PathMetrics pathMetrics = drawCircle.computeMetrics();
      for (ui.PathMetric pathMetric in pathMetrics) {
        Path extractPath = pathMetric.extractPath(
          0.0,
          pathMetric.length * animationValue2,
        );
        canvas.drawPath(extractPath, paint);
      }
    }
  }

  Path drawCircle(Offset center) {
    var path = Path();

    path.addOval(Rect.fromCircle(center: center, radius: 70));
    return path;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
