/*
Copyright (c) 2022 Razeware LLC

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
distribute, sublicense, create a derivative work, and/or sell copies of the
Software in any work that is designed, intended, or marketed for pedagogical or
instructional purposes related to programming, coding, application development,
or information technology.  Permission for such use, copying, modification,
merger, publication, distribution, sublicensing, creation of derivative works,
or sale is expressly withheld.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
 */

import 'dart:math';

import 'package:flutter/material.dart';

import '../../asset_path.dart';

class SunWidget extends AnimatedWidget {
  const SunWidget({Key? key, required Animation<Offset> listenable})
      : super(key: key, listenable: listenable);

  Animation<Offset> get _animation => listenable as Animation<Offset>;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final minSize = min(constraints.maxWidth, constraints.maxHeight);
      final sunSize = minSize / 3.5;

      return Transform.translate(
        offset: _animation.value,
        child: Container(
          // width: sunSize,
          // height: sunSize,
          decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
            BoxShadow(
                color: Colors.amberAccent,
                spreadRadius: sunSize * 0.3,
                blurRadius: sunSize * 2)
          ]),
          // width: sunSize,
          // height: sunSize,
          child: Image.asset(
            AssetPath.sunny1,
            width: sunSize,
            height: sunSize,
          ),
          // decoration: BoxDecoration(
          //     shape: BoxShape.circle,
          //     color: Colors.amberAccent,
          //     border: Border.all(color: Colors.amber, width: 1),
          //     boxShadow: [
          //       const BoxShadow(color: Colors.black87, blurRadius: 15),
          //       BoxShadow(
          //           color: Colors.amberAccent,
          //           spreadRadius: sunSize * 0.3,
          //           blurRadius: sunSize * 2)
          //     ]),
        ),
      );
    });
  }
}
