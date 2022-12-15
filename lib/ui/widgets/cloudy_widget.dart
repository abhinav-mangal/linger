import 'dart:math';

import 'package:flutter/material.dart';

import '../../asset_path.dart';

class CloudyWidget extends AnimatedWidget {
  const CloudyWidget({Key? key, required Animation<Offset> listenable})
      : super(key: key, listenable: listenable);

  // Cast the Listenable to an Animation<Offset> object
  Animation<Offset> get _animation => listenable as Animation<Offset>;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final minSize = min(constraints.maxWidth, constraints.maxHeight);
      final moonSize = minSize / 2;
      return Transform.translate(
        offset: _animation.value,
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.3,
          height: MediaQuery.of(context).size.height / 3.5,
          child: Image.asset(
            AssetPath.cloud5,
            width: MediaQuery.of(context).size.width / 1.3,
            height: MediaQuery.of(context).size.height / 3.5,
            fit: BoxFit.fill,
          ),
        ),
      );
    });
  }
}
