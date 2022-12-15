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
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:linger/Basepackage/baseclass.dart';

import 'cloudy_widget.dart';
import 'model/customtween.dart';
import 'moon_widget.dart';
import 'sun_widget.dart';

class AnimationView extends StatefulWidget {
  /// Knowing the [width] of the widget will allow us to make the UI responsive
  final double width;
  final double height;

  const AnimationView({Key? key, this.width = 500, this.height = 1000})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AnimationViewState();
  }
}

class _AnimationViewState extends State<AnimationView>
    with baseclass, SingleTickerProviderStateMixin {
  bool _isDayTheme = true;

  DateFormat hourFormat = DateFormat.Hm();
  DateFormat dayFormat = DateFormat.EEEE();
  Gradient _color = const LinearGradient(
    colors: [
      Colors.blue,
      Colors.blue,
    ],
  );

  // Day/Night transition

  late DateTime sunrise;
  late DateTime sunset;
  late AnimationController _animationController;
  late Animation<Offset> _sunMoveAnim;
  late Animation<Offset> _cloudMoveAnim;
  late Animation<Offset> _moonMoveAnim;
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000))
      ..repeat();
    //stream();
  }

  void _initThemeAnims({required String dayToNight}) {
    switch (dayToNight) {
      case "00":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 0.36, widget.height * 0.2),
            Offset(widget.width * 0.36, widget.height * 0.2),
            Offset(widget.width * 0.36, widget.height * 0.2),
            Offset(widget.width * 0.71, -widget.height * 0.06),
            Offset(widget.width * 0.71, -widget.height * 0.06),
            Offset(widget.width * 0.71, -widget.height * 0.06),
            LinearGradient(
              colors: [
                getColorFromHex("#1E566A"),
                getColorFromHex("#307180"),
              ],
            ),
            false);
        break;
      case "01":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 0.355, widget.height * 0.2),
            Offset(widget.width * 0.355, widget.height * 0.2),
            Offset(widget.width * 0.355, widget.height * 0.2),
            Offset(widget.width * 0.705, -widget.height * 0.065),
            Offset(widget.width * 0.705, -widget.height * 0.065),
            Offset(widget.width * 0.705, -widget.height * 0.065),
            LinearGradient(
              colors: [
                getColorFromHex("#1E566A"),
                getColorFromHex("#307180"),
              ],
            ),
            false);
        break;
      case "02":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 0.35, widget.height * 0.2),
            Offset(widget.width * 0.35, widget.height * 0.2),
            Offset(widget.width * 0.35, widget.height * 0.2),
            Offset(widget.width * 0.70, -widget.height * 0.07),
            Offset(widget.width * 0.70, -widget.height * 0.07),
            Offset(widget.width * 0.70, -widget.height * 0.07),
            LinearGradient(
              colors: [
                getColorFromHex("#1E566A"),
                getColorFromHex("#307180"),
              ],
            ),
            false);
        break;
      case "03":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 0.34, widget.height * 0.2),
            Offset(widget.width * 0.34, widget.height * 0.2),
            Offset(widget.width * 0.34, widget.height * 0.2),
            Offset(widget.width * 0.695, -widget.height * 0.075),
            Offset(widget.width * 0.695, -widget.height * 0.075),
            Offset(widget.width * 0.695, -widget.height * 0.075),
            LinearGradient(
              colors: [
                getColorFromHex("#1E566A"),
                getColorFromHex("#307180"),
              ],
            ),
            false);
        break;
      case "04":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 0.335, widget.height * 0.2),
            Offset(widget.width * 0.335, widget.height * 0.2),
            Offset(widget.width * 0.335, widget.height * 0.2),
            Offset(widget.width * 0.69, -widget.height * 0.08),
            Offset(widget.width * 0.69, -widget.height * 0.08),
            Offset(widget.width * 0.69, -widget.height * 0.08),
            LinearGradient(
              colors: [
                getColorFromHex("#1E566A"),
                getColorFromHex("#307180"),
              ],
            ),
            false);
        break;
      case "05":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 0.33, widget.height * 0.2),
            Offset(widget.width * 0.33, widget.height * 0.2),
            Offset(widget.width * 0.33, widget.height * 0.2),
            Offset(widget.width * 0.685, -widget.height * 0.09),
            Offset(widget.width * 0.685, -widget.height * 0.09),
            Offset(widget.width * 0.685, -widget.height * 0.09),
            LinearGradient(
              colors: [
                getColorFromHex("#1E566A"),
                getColorFromHex("#307180"),
              ],
            ),
            false);
        break;
      case "10":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 0.32, widget.height * 0.2),
            Offset(widget.width * 0.32, widget.height * 0.2),
            Offset(widget.width * 0.32, widget.height * 0.2),
            Offset(widget.width * 0.67, -widget.height * 0.1),
            Offset(widget.width * 0.67, -widget.height * 0.1),
            Offset(widget.width * 0.67, -widget.height * 0.1),
            LinearGradient(colors: [
              getColorFromHex("#164459"),
              getColorFromHex("#2F707E"),
            ]),
            false);
        break;
      case "11":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 0.315, widget.height * 0.2),
            Offset(widget.width * 0.315, widget.height * 0.2),
            Offset(widget.width * 0.315, widget.height * 0.2),
            Offset(widget.width * 0.665, -widget.height * 0.105),
            Offset(widget.width * 0.665, -widget.height * 0.105),
            Offset(widget.width * 0.665, -widget.height * 0.105),
            LinearGradient(colors: [
              getColorFromHex("#164459"),
              getColorFromHex("#2F707E"),
            ]),
            false);
        break;
      case "12":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 0.31, widget.height * 0.2),
            Offset(widget.width * 0.31, widget.height * 0.2),
            Offset(widget.width * 0.31, widget.height * 0.2),
            Offset(widget.width * 0.66, -widget.height * 0.11),
            Offset(widget.width * 0.66, -widget.height * 0.11),
            Offset(widget.width * 0.66, -widget.height * 0.11),
            LinearGradient(colors: [
              getColorFromHex("#164459"),
              getColorFromHex("#2F707E"),
            ]),
            false);
        break;
      case "13":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 0.305, widget.height * 0.2),
            Offset(widget.width * 0.305, widget.height * 0.2),
            Offset(widget.width * 0.305, widget.height * 0.2),
            Offset(widget.width * 0.655, -widget.height * 0.115),
            Offset(widget.width * 0.655, -widget.height * 0.115),
            Offset(widget.width * 0.655, -widget.height * 0.115),
            LinearGradient(colors: [
              getColorFromHex("#164459"),
              getColorFromHex("#2F707E"),
            ]),
            false);
        break;
      case "14":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 0.3, widget.height * 0.2),
            Offset(widget.width * 0.3, widget.height * 0.2),
            Offset(widget.width * 0.3, widget.height * 0.2),
            Offset(widget.width * 0.65, -widget.height * 0.12),
            Offset(widget.width * 0.65, -widget.height * 0.12),
            Offset(widget.width * 0.65, -widget.height * 0.12),
            LinearGradient(colors: [
              getColorFromHex("#164459"),
              getColorFromHex("#2F707E"),
            ]),
            false);
        break;
      case "15":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 0.29, widget.height * 0.2),
            Offset(widget.width * 0.29, widget.height * 0.2),
            Offset(widget.width * 0.29, widget.height * 0.2),
            Offset(widget.width * 0.64, -widget.height * 0.13),
            Offset(widget.width * 0.64, -widget.height * 0.13),
            Offset(widget.width * 0.64, -widget.height * 0.13),
            LinearGradient(colors: [
              getColorFromHex("#164459"),
              getColorFromHex("#2F707E"),
            ]),
            false);
        break;
      case "20":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 0.28, widget.height * 0.2),
            Offset(widget.width * 0.28, widget.height * 0.2),
            Offset(widget.width * 0.28, widget.height * 0.2),
            Offset(widget.width * 0.63, -widget.height * 0.1),
            Offset(widget.width * 0.63, -widget.height * 0.1),
            Offset(widget.width * 0.63, -widget.height * 0.1),
            LinearGradient(colors: [
              getColorFromHex("#134359"),
              getColorFromHex("#246372"),
            ]),
            false);
        break;
      case "21":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 0.29, widget.height * 0.2),
            Offset(widget.width * 0.29, widget.height * 0.2),
            Offset(widget.width * 0.29, widget.height * 0.2),
            Offset(widget.width * 0.62, -widget.height * 0.11),
            Offset(widget.width * 0.62, -widget.height * 0.11),
            Offset(widget.width * 0.62, -widget.height * 0.11),
            LinearGradient(colors: [
              getColorFromHex("#134359"),
              getColorFromHex("#246372"),
            ]),
            false);
        break;
      case "22":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 0.27, widget.height * 0.2),
            Offset(widget.width * 0.27, widget.height * 0.2),
            Offset(widget.width * 0.27, widget.height * 0.2),
            Offset(widget.width * 0.61, -widget.height * 0.12),
            Offset(widget.width * 0.61, -widget.height * 0.12),
            Offset(widget.width * 0.61, -widget.height * 0.12),
            LinearGradient(colors: [
              getColorFromHex("#134359"),
              getColorFromHex("#246372"),
            ]),
            false);
        break;
      case "23":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 0.25, widget.height * 0.2),
            Offset(widget.width * 0.25, widget.height * 0.2),
            Offset(widget.width * 0.25, widget.height * 0.2),
            Offset(widget.width * 0.6, -widget.height * 0.125),
            Offset(widget.width * 0.6, -widget.height * 0.125),
            Offset(widget.width * 0.6, -widget.height * 0.125),
            LinearGradient(colors: [
              getColorFromHex("#134359"),
              getColorFromHex("#246372"),
            ]),
            false);
        break;
      case "24":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 0.23, widget.height * 0.2),
            Offset(widget.width * 0.23, widget.height * 0.2),
            Offset(widget.width * 0.23, widget.height * 0.2),
            Offset(widget.width * 0.59, -widget.height * 0.13),
            Offset(widget.width * 0.59, -widget.height * 0.13),
            Offset(widget.width * 0.59, -widget.height * 0.13),
            LinearGradient(colors: [
              getColorFromHex("#134359"),
              getColorFromHex("#246372"),
            ]),
            false);
        break;
      case "25":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 0.21, widget.height * 0.2),
            Offset(widget.width * 0.21, widget.height * 0.2),
            Offset(widget.width * 0.21, widget.height * 0.2),
            Offset(widget.width * 0.58, -widget.height * 0.135),
            Offset(widget.width * 0.58, -widget.height * 0.135),
            Offset(widget.width * 0.58, -widget.height * 0.135),
            LinearGradient(colors: [
              getColorFromHex("#134359"),
              getColorFromHex("#246372"),
            ]),
            false);
        break;
      case "30":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 0.2, widget.height * 0.2),
            Offset(widget.width * 0.2, widget.height * 0.2),
            Offset(widget.width * 0.2, widget.height * 0.2),
            Offset(widget.width * 0.55, -widget.height * 0.14),
            Offset(widget.width * 0.55, -widget.height * 0.14),
            Offset(widget.width * 0.55, -widget.height * 0.14),
            LinearGradient(colors: [
              getColorFromHex("#134359"),
              getColorFromHex("#246572"),
            ]),
            false);
        break;
      case "31":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 0.15, widget.height * 0.2),
            Offset(widget.width * 0.15, widget.height * 0.2),
            Offset(widget.width * 15, widget.height * 0.2),
            Offset(widget.width * 0.54, -widget.height * 0.145),
            Offset(widget.width * 0.54, -widget.height * 0.145),
            Offset(widget.width * 0.54, -widget.height * 0.145),
            LinearGradient(colors: [
              getColorFromHex("#134359"),
              getColorFromHex("#246572"),
            ]),
            false);
        break;
      case "32":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 0.1, widget.height * 0.2),
            Offset(widget.width * 0.1, widget.height * 0.2),
            Offset(widget.width * 0.1, widget.height * 0.2),
            Offset(widget.width * 0.53, -widget.height * 0.15),
            Offset(widget.width * 0.53, -widget.height * 0.15),
            Offset(widget.width * 0.53, -widget.height * 0.15),
            LinearGradient(colors: [
              getColorFromHex("#134359"),
              getColorFromHex("#246572"),
            ]),
            false);
        break;
      case "33":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 0.05, widget.height * 0.2),
            Offset(widget.width * 0.05, widget.height * 0.2),
            Offset(widget.width * 0.05, widget.height * 0.2),
            Offset(widget.width * 0.525, -widget.height * 0.16),
            Offset(widget.width * 0.525, -widget.height * 0.16),
            Offset(widget.width * 0.525, -widget.height * 0.16),
            LinearGradient(colors: [
              getColorFromHex("#134359"),
              getColorFromHex("#246572"),
            ]),
            false);
        break;
      case "34":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 0, widget.height * 0.2),
            Offset(widget.width * 0, widget.height * 0.2),
            Offset(widget.width * 0, widget.height * 0.2),
            Offset(widget.width * 0.52, -widget.height * 0.165),
            Offset(widget.width * 0.52, -widget.height * 0.165),
            Offset(widget.width * 0.52, -widget.height * 0.165),
            LinearGradient(colors: [
              getColorFromHex("#134359"),
              getColorFromHex("#246572"),
            ]),
            false);
        break;
      case "35":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 0.0, widget.height * 0.2),
            Offset(widget.width * 0.0, widget.height * 0.2),
            Offset(widget.width * 0.0, widget.height * 0.2),
            Offset(widget.width * 0.51, -widget.height * 0.18),
            Offset(widget.width * 0.51, -widget.height * 0.18),
            Offset(widget.width * 0.51, -widget.height * 0.18),
            LinearGradient(colors: [
              getColorFromHex("#134359"),
              getColorFromHex("#246572"),
            ]),
            false);
        break;
      case "40":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(-widget.width * 0.05, widget.height * 0.2),
            Offset(-widget.width * 0.05, widget.height * 0.2),
            Offset(-widget.width * 0.05, widget.height * 0.2),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            LinearGradient(colors: [
              getColorFromHex("#003642"),
              getColorFromHex("#3F4F6B"),
            ]),
            false);
        break;
      case "41":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(-widget.width * 0.1, widget.height * 0.2),
            Offset(-widget.width * 0.1, widget.height * 0.2),
            Offset(-widget.width * 0.1, widget.height * 0.2),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            LinearGradient(colors: [
              getColorFromHex("#003642"),
              getColorFromHex("#3F4F6B"),
            ]),
            false);
        break;
      case "42":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(-widget.width * 0.15, widget.height * 0.2),
            Offset(-widget.width * 0.15, widget.height * 0.2),
            Offset(-widget.width * 0.15, widget.height * 0.2),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            LinearGradient(colors: [
              getColorFromHex("#003642"),
              getColorFromHex("#3F4F6B"),
            ]),
            false);
        break;
      case "43":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(-widget.width * 0.155, widget.height * 0.2),
            Offset(-widget.width * 0.155, widget.height * 0.2),
            Offset(-widget.width * 0.155, widget.height * 0.2),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            LinearGradient(colors: [
              getColorFromHex("#003642"),
              getColorFromHex("#3F4F6B"),
            ]),
            false);
        break;
      case "44":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(-widget.width * 0.2, widget.height * 0.2),
            Offset(-widget.width * 0.2, widget.height * 0.2),
            Offset(-widget.width * 0.2, widget.height * 0.2),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            LinearGradient(colors: [
              getColorFromHex("#003642"),
              getColorFromHex("#3F4F6B"),
            ]),
            false);
        break;
      case "45":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(-widget.width * 0.2, widget.height * 0.2),
            Offset(-widget.width * 0.2, widget.height * 0.2),
            Offset(-widget.width * 0.2, widget.height * 0.2),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            LinearGradient(colors: [
              getColorFromHex("#003642"),
              getColorFromHex("#3F4F6B"),
            ]),
            false);
        break;
      case "50":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(-widget.width * 0.21, widget.height * 0.2),
            Offset(-widget.width * 0.21, widget.height * 0.2),
            Offset(-widget.width * 0.21, widget.height * 0.2),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            LinearGradient(colors: [
              getColorFromHex("#1A6678"),
              getColorFromHex("#5EA1B0"),
            ]),
            false);
        break;
      case "51":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(-widget.width * 0.23, widget.height * 0.2),
            Offset(-widget.width * 0.23, widget.height * 0.2),
            Offset(-widget.width * 0.23, widget.height * 0.2),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            LinearGradient(colors: [
              getColorFromHex("#1A6678"),
              getColorFromHex("#5EA1B0"),
            ]),
            false);
        break;
      case "52":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(-widget.width * 0.25, widget.height * 0.2),
            Offset(-widget.width * 0.25, widget.height * 0.2),
            Offset(-widget.width * 0.25, widget.height * 0.2),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            LinearGradient(colors: [
              getColorFromHex("#1A6678"),
              getColorFromHex("#5EA1B0"),
            ]),
            false);
        break;
      case "53":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(-widget.width * 0.27, widget.height * 0.2),
            Offset(-widget.width * 0.27, widget.height * 0.2),
            Offset(-widget.width * 0.27, widget.height * 0.2),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            LinearGradient(colors: [
              getColorFromHex("#1A6678"),
              getColorFromHex("#5EA1B0"),
            ]),
            false);
        break;
      case "54":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(-widget.width * 0.28, widget.height * 0.2),
            Offset(-widget.width * 0.28, widget.height * 0.2),
            Offset(-widget.width * 0.28, widget.height * 0.2),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            LinearGradient(colors: [
              getColorFromHex("#1A6678"),
              getColorFromHex("#5EA1B0"),
            ]),
            false);
        break;
      case "55":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(-widget.width * 0.3, widget.height * 0.2),
            Offset(-widget.width * 0.3, widget.height * 0.2),
            Offset(-widget.width * 0.3, widget.height * 0.2),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            LinearGradient(colors: [
              getColorFromHex("#1A6678"),
              getColorFromHex("#5EA1B0"),
            ]),
            false);
        break;
      case "60":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(-widget.width * 0.3, widget.height * 0.2),
            Offset(-widget.width * 0.3, widget.height * 0.2),
            Offset(-widget.width * 0.3, widget.height * 0.2),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            LinearGradient(colors: [
              getColorFromHex("#339DB5"),
              getColorFromHex("#6AC0D4"),
            ]),
            false);
        break;
      case "61":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(-widget.width * 0.33, widget.height * 0.2),
            Offset(-widget.width * 0.33, widget.height * 0.2),
            Offset(-widget.width * 0.33, widget.height * 0.2),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            LinearGradient(colors: [
              getColorFromHex("#339DB5"),
              getColorFromHex("#6AC0D4"),
            ]),
            false);
        break;
      case "62":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(-widget.width * 0.4, widget.height * 0.2),
            Offset(-widget.width * 0.4, widget.height * 0.2),
            Offset(-widget.width * 0.4, widget.height * 0.2),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            LinearGradient(colors: [
              getColorFromHex("#339DB5"),
              getColorFromHex("#6AC0D4"),
            ]),
            false);
        break;
      case "63":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(-widget.width * 0.5, widget.height * 0.2),
            Offset(-widget.width * 0.5, widget.height * 0.2),
            Offset(-widget.width * 0.5, widget.height * 0.2),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            LinearGradient(colors: [
              getColorFromHex("#339DB5"),
              getColorFromHex("#6AC0D4"),
            ]),
            false);
        break;
      case "64":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(-widget.width * 0.55, widget.height * 0.2),
            Offset(-widget.width * 0.55, widget.height * 0.2),
            Offset(-widget.width * 0.55, widget.height * 0.2),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            LinearGradient(colors: [
              getColorFromHex("#339DB5"),
              getColorFromHex("#6AC0D4"),
            ]),
            false);
        break;
      case "65":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(-widget.width * 0.7, widget.height * 0.2),
            Offset(-widget.width * 0.7, widget.height * 0.2),
            Offset(-widget.width * 0.7, widget.height * 0.2),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            LinearGradient(colors: [
              getColorFromHex("#339DB5"),
              getColorFromHex("#6AC0D4"),
            ]),
            false);
        break;
      case "70":
        animatedrelated(
            Offset(-widget.width * 0.2, widget.height * 0.15),
            Offset(-widget.width * 0.2, widget.height * 0.15),
            Offset(-widget.width * 0.2, widget.height * 0.15),
            Offset(-widget.width * 0.7, widget.height * 0.2),
            Offset(-widget.width * 0.7, widget.height * 0.2),
            Offset(-widget.width * 0.7, widget.height * 0.2),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#E8CE75"),
                getColorFromHex("#71D0E5"),
                getColorFromHex("#3FB6D1"),
              ],
            ),
            true);
        break;
      case "71":
        animatedrelated(
            Offset(-widget.width * 0.195, widget.height * 0.145),
            Offset(-widget.width * 0.195, widget.height * 0.145),
            Offset(-widget.width * 0.195, widget.height * 0.145),
            Offset(-widget.width * 0.68, widget.height * 0.2),
            Offset(-widget.width * 0.68, widget.height * 0.2),
            Offset(-widget.width * 0.68, widget.height * 0.2),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#E8CE75"),
                getColorFromHex("#71D0E5"),
                getColorFromHex("#3FB6D1"),
              ],
            ),
            true);
        break;
      case "72":
        animatedrelated(
            Offset(-widget.width * 0.19, widget.height * 0.14),
            Offset(-widget.width * 0.19, widget.height * 0.14),
            Offset(-widget.width * 0.19, widget.height * 0.14),
            Offset(-widget.width * 0.65, widget.height * 0.2),
            Offset(-widget.width * 0.65, widget.height * 0.2),
            Offset(-widget.width * 0.65, widget.height * 0.2),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#E8CE75"),
                getColorFromHex("#71D0E5"),
                getColorFromHex("#3FB6D1"),
              ],
            ),
            true);
        break;
      case "73":
        animatedrelated(
            Offset(-widget.width * 0.18, widget.height * 0.145),
            Offset(-widget.width * 0.18, widget.height * 0.145),
            Offset(-widget.width * 0.18, widget.height * 0.145),
            Offset(-widget.width * 0.64, widget.height * 0.2),
            Offset(-widget.width * 0.64, widget.height * 0.2),
            Offset(-widget.width * 0.64, widget.height * 0.2),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#E8CE75"),
                getColorFromHex("#71D0E5"),
                getColorFromHex("#3FB6D1"),
              ],
            ),
            true);
        break;
      case "74":
        animatedrelated(
            Offset(-widget.width * 0.175, widget.height * 0.14),
            Offset(-widget.width * 0.175, widget.height * 0.14),
            Offset(-widget.width * 0.175, widget.height * 0.14),
            Offset(-widget.width * 0.62, widget.height * 0.2),
            Offset(-widget.width * 0.62, widget.height * 0.2),
            Offset(-widget.width * 0.62, widget.height * 0.2),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#E8CE75"),
                getColorFromHex("#71D0E5"),
                getColorFromHex("#3FB6D1"),
              ],
            ),
            true);
        break;
      case "75":
        animatedrelated(
            Offset(-widget.width * 0.16, widget.height * 0.13),
            Offset(-widget.width * 0.16, widget.height * 0.13),
            Offset(-widget.width * 0.16, widget.height * 0.13),
            Offset(-widget.width * 0.6, widget.height * 0.2),
            Offset(-widget.width * 0.6, widget.height * 0.2),
            Offset(-widget.width * 0.6, widget.height * 0.2),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#E8CE75"),
                getColorFromHex("#71D0E5"),
                getColorFromHex("#3FB6D1"),
              ],
            ),
            true);
        break;
      case "80":
        animatedrelated(
            Offset(-widget.width * 0.16, widget.height * 0.13),
            Offset(-widget.width * 0.16, widget.height * 0.13),
            Offset(-widget.width * 0.16, widget.height * 0.13),
            Offset(-widget.width * 0.6, widget.height * 0.2),
            Offset(-widget.width * 0.6, widget.height * 0.2),
            Offset(-widget.width * 0.6, widget.height * 0.2),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#F6D86A"),
                getColorFromHex("#78E6FF"),
                getColorFromHex("#3FB6D1"),
              ],
            ),
            true);
        break;
      case "81":
        animatedrelated(
            Offset(-widget.width * 0.155, widget.height * 0.125),
            Offset(-widget.width * 0.155, widget.height * 0.125),
            Offset(-widget.width * 0.155, widget.height * 0.125),
            Offset(-widget.width * 0.58, widget.height * 0.2),
            Offset(-widget.width * 0.58, widget.height * 0.2),
            Offset(-widget.width * 0.58, widget.height * 0.2),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#F6D86A"),
                getColorFromHex("#78E6FF"),
                getColorFromHex("#3FB6D1"),
              ],
            ),
            true);
        break;
      case "82":
        animatedrelated(
            Offset(-widget.width * 0.15, widget.height * 0.122),
            Offset(-widget.width * 0.15, widget.height * 0.122),
            Offset(-widget.width * 0.15, widget.height * 0.122),
            Offset(-widget.width * 0.57, widget.height * 0.2),
            Offset(-widget.width * 0.57, widget.height * 0.2),
            Offset(-widget.width * 0.57, widget.height * 0.2),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#F6D86A"),
                getColorFromHex("#78E6FF"),
                getColorFromHex("#3FB6D1"),
              ],
            ),
            true);
        break;
      case "83":
        animatedrelated(
            Offset(-widget.width * 0.145, widget.height * 0.12),
            Offset(-widget.width * 0.145, widget.height * 0.12),
            Offset(-widget.width * 0.145, widget.height * 0.12),
            Offset(-widget.width * 0.55, widget.height * 0.2),
            Offset(-widget.width * 0.55, widget.height * 0.2),
            Offset(-widget.width * 0.55, widget.height * 0.2),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#F6D86A"),
                getColorFromHex("#78E6FF"),
                getColorFromHex("#3FB6D1"),
              ],
            ),
            true);
        break;
      case "84":
        animatedrelated(
            Offset(-widget.width * 0.135, widget.height * 0.115),
            Offset(-widget.width * 0.135, widget.height * 0.115),
            Offset(-widget.width * 0.135, widget.height * 0.115),
            Offset(-widget.width * 0.53, widget.height * 0.2),
            Offset(-widget.width * 0.53, widget.height * 0.2),
            Offset(-widget.width * 0.53, widget.height * 0.2),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#F6D86A"),
                getColorFromHex("#78E6FF"),
                getColorFromHex("#3FB6D1"),
              ],
            ),
            true);
        break;
      case "85":
        animatedrelated(
            Offset(-widget.width * 0.12, widget.height * 0.11),
            Offset(-widget.width * 0.12, widget.height * 0.11),
            Offset(-widget.width * 0.12, widget.height * 0.11),
            Offset(-widget.width * 0.5, widget.height * 0.2),
            Offset(-widget.width * 0.5, widget.height * 0.2),
            Offset(-widget.width * 0.5, widget.height * 0.2),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#F6D86A"),
                getColorFromHex("#78E6FF"),
                getColorFromHex("#3FB6D1"),
              ],
            ),
            true);
        break;
      case "90":
        animatedrelated(
            Offset(-widget.width * 0.12, widget.height * 0.11),
            Offset(-widget.width * 0.12, widget.height * 0.11),
            Offset(-widget.width * 0.12, widget.height * 0.11),
            Offset(-widget.width * 0.5, widget.height * 0.2),
            Offset(-widget.width * 0.5, widget.height * 0.2),
            Offset(-widget.width * 0.5, widget.height * 0.2),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#FBD963"),
                getColorFromHex("#94EBFF"),
                getColorFromHex("#55D3EF"),
              ],
            ),
            true);
        break;
      case "91":
        animatedrelated(
            Offset(-widget.width * 0.115, widget.height * 0.105),
            Offset(-widget.width * 0.115, widget.height * 0.105),
            Offset(-widget.width * 0.115, widget.height * 0.105),
            Offset(-widget.width * 0.48, widget.height * 0.2),
            Offset(-widget.width * 0.48, widget.height * 0.2),
            Offset(-widget.width * 0.48, widget.height * 0.2),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#FBD963"),
                getColorFromHex("#94EBFF"),
                getColorFromHex("#55D3EF"),
              ],
            ),
            true);
        break;
      case "92":
        animatedrelated(
            Offset(-widget.width * 0.11, widget.height * 0.10),
            Offset(-widget.width * 0.11, widget.height * 0.10),
            Offset(-widget.width * 0.11, widget.height * 0.10),
            Offset(-widget.width * 0.46, widget.height * 0.2),
            Offset(-widget.width * 0.46, widget.height * 0.2),
            Offset(-widget.width * 0.46, widget.height * 0.2),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#FBD963"),
                getColorFromHex("#94EBFF"),
                getColorFromHex("#55D3EF"),
              ],
            ),
            true);
        break;
      case "93":
        animatedrelated(
            Offset(-widget.width * 0.1, widget.height * 0.09),
            Offset(-widget.width * 0.1, widget.height * 0.09),
            Offset(-widget.width * 0.1, widget.height * 0.09),
            Offset(-widget.width * 0.44, widget.height * 0.2),
            Offset(-widget.width * 0.44, widget.height * 0.2),
            Offset(-widget.width * 0.44, widget.height * 0.2),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#FBD963"),
                getColorFromHex("#94EBFF"),
                getColorFromHex("#55D3EF"),
              ],
            ),
            true);
        break;
      case "94":
        animatedrelated(
            Offset(-widget.width * 0.09, widget.height * 0.08),
            Offset(-widget.width * 0.09, widget.height * 0.08),
            Offset(-widget.width * 0.09, widget.height * 0.08),
            Offset(-widget.width * 0.42, widget.height * 0.2),
            Offset(-widget.width * 0.42, widget.height * 0.2),
            Offset(-widget.width * 0.42, widget.height * 0.2),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#FBD963"),
                getColorFromHex("#94EBFF"),
                getColorFromHex("#55D3EF"),
              ],
            ),
            true);
        break;
      case "95":
        animatedrelated(
            Offset(-widget.width * 0.08, widget.height * 0.07),
            Offset(-widget.width * 0.08, widget.height * 0.07),
            Offset(-widget.width * 0.08, widget.height * 0.07),
            Offset(-widget.width * 0.4, widget.height * 0.2),
            Offset(-widget.width * 0.4, widget.height * 0.2),
            Offset(-widget.width * 0.4, widget.height * 0.2),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#FBD963"),
                getColorFromHex("#94EBFF"),
                getColorFromHex("#55D3EF"),
              ],
            ),
            true);
        break;
      case "100":
        animatedrelated(
            Offset(-widget.width * 0.08, widget.height * 0.07),
            Offset(-widget.width * 0.08, widget.height * 0.07),
            Offset(-widget.width * 0.08, widget.height * 0.07),
            Offset(-widget.width * 0.4, widget.height * 0.2),
            Offset(-widget.width * 0.4, widget.height * 0.2),
            Offset(-widget.width * 0.4, widget.height * 0.2),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#FBD963"),
                getColorFromHex("#94EBFFB2"),
                getColorFromHex("#55D3EFB2"),
              ],
            ),
            true);
        break;
      case "101":
        animatedrelated(
            Offset(-widget.width * 0.07, widget.height * 0.06),
            Offset(-widget.width * 0.07, widget.height * 0.06),
            Offset(-widget.width * 0.07, widget.height * 0.06),
            Offset(-widget.width * 0.38, widget.height * 0.2),
            Offset(-widget.width * 0.38, widget.height * 0.2),
            Offset(-widget.width * 0.38, widget.height * 0.2),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#FBD963"),
                getColorFromHex("#94EBFFB2"),
                getColorFromHex("#55D3EFB2"),
              ],
            ),
            true);
        break;
      case "102":
        animatedrelated(
            Offset(-widget.width * 0.06, widget.height * 0.05),
            Offset(-widget.width * 0.06, widget.height * 0.05),
            Offset(-widget.width * 0.06, widget.height * 0.05),
            Offset(-widget.width * 0.36, widget.height * 0.2),
            Offset(-widget.width * 0.36, widget.height * 0.2),
            Offset(-widget.width * 0.36, widget.height * 0.2),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#FBD963"),
                getColorFromHex("#94EBFFB2"),
                getColorFromHex("#55D3EFB2"),
              ],
            ),
            true);
        break;
      case "103":
        animatedrelated(
            Offset(-widget.width * 0.05, widget.height * 0.04),
            Offset(-widget.width * 0.05, widget.height * 0.04),
            Offset(-widget.width * 0.05, widget.height * 0.04),
            Offset(-widget.width * 0.34, widget.height * 0.2),
            Offset(-widget.width * 0.34, widget.height * 0.2),
            Offset(-widget.width * 0.34, widget.height * 0.2),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#FBD963"),
                getColorFromHex("#94EBFFB2"),
                getColorFromHex("#55D3EFB2"),
              ],
            ),
            true);
        break;
      case "104":
        animatedrelated(
            Offset(-widget.width * 0.03, widget.height * 0.045),
            Offset(-widget.width * 0.03, widget.height * 0.045),
            Offset(-widget.width * 0.03, widget.height * 0.045),
            Offset(-widget.width * 0.32, widget.height * 0.2),
            Offset(-widget.width * 0.32, widget.height * 0.2),
            Offset(-widget.width * 0.32, widget.height * 0.2),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#FBD963"),
                getColorFromHex("#94EBFFB2"),
                getColorFromHex("#55D3EFB2"),
              ],
            ),
            true);
        break;
      case "105":
        animatedrelated(
            Offset(-widget.width * 0.0, widget.height * 0.03),
            Offset(-widget.width * 0.0, widget.height * 0.03),
            Offset(-widget.width * 0.0, widget.height * 0.03),
            Offset(-widget.width * 0.3, widget.height * 0.2),
            Offset(-widget.width * 0.3, widget.height * 0.2),
            Offset(-widget.width * 0.3, widget.height * 0.2),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#FBD963"),
                getColorFromHex("#94EBFFB2"),
                getColorFromHex("#55D3EFB2"),
              ],
            ),
            true);
        break;
      case "110":
        animatedrelated(
            Offset(widget.width * 0.0, widget.height * 0.03),
            Offset(widget.width * 0.0, widget.height * 0.03),
            Offset(widget.width * 0.0, widget.height * 0.03),
            Offset(-widget.width * 0.3, widget.height * 0.2),
            Offset(-widget.width * 0.3, widget.height * 0.2),
            Offset(-widget.width * 0.3, widget.height * 0.2),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#F4D462"),
                getColorFromHex("#FFE194"),
                getColorFromHex("#F09553"),
              ],
            ),
            true);
        break;
      case "111":
        animatedrelated(
            Offset(widget.width * 0.02, widget.height * 0.035),
            Offset(widget.width * 0.02, widget.height * 0.035),
            Offset(widget.width * 0.02, widget.height * 0.035),
            Offset(-widget.width * 0.28, widget.height * 0.2),
            Offset(-widget.width * 0.28, widget.height * 0.2),
            Offset(-widget.width * 0.28, widget.height * 0.2),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#F4D462"),
                getColorFromHex("#FFE194"),
                getColorFromHex("#F09553"),
              ],
            ),
            true);
        break;
      case "112":
        animatedrelated(
            Offset(widget.width * 0.04, widget.height * 0.02),
            Offset(widget.width * 0.04, widget.height * 0.02),
            Offset(widget.width * 0.04, widget.height * 0.02),
            Offset(-widget.width * 0.26, widget.height * 0.2),
            Offset(-widget.width * 0.26, widget.height * 0.2),
            Offset(-widget.width * 0.26, widget.height * 0.2),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#F4D462"),
                getColorFromHex("#FFE194"),
                getColorFromHex("#F09553"),
              ],
            ),
            true);
        break;
      case "113":
        animatedrelated(
            Offset(widget.width * 0.055, -widget.height * 0.01),
            Offset(widget.width * 0.055, -widget.height * 0.01),
            Offset(widget.width * 0.055, -widget.height * 0.01),
            Offset(-widget.width * 0.24, widget.height * 0.2),
            Offset(-widget.width * 0.24, widget.height * 0.2),
            Offset(-widget.width * 0.24, widget.height * 0.2),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#F4D462"),
                getColorFromHex("#FFE194"),
                getColorFromHex("#F09553"),
              ],
            ),
            true);
        break;
      case "114":
        animatedrelated(
            Offset(widget.width * 0.07, -widget.height * 0.04),
            Offset(widget.width * 0.07, -widget.height * 0.04),
            Offset(widget.width * 0.07, -widget.height * 0.04),
            Offset(-widget.width * 0.22, widget.height * 0.2),
            Offset(-widget.width * 0.22, widget.height * 0.2),
            Offset(-widget.width * 0.22, widget.height * 0.2),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#F4D462"),
                getColorFromHex("#FFE194"),
                getColorFromHex("#F09553"),
              ],
            ),
            true);
        break;
      case "115":
        animatedrelated(
            Offset(widget.width * 0.08, -widget.height * 0.05),
            Offset(widget.width * 0.08, -widget.height * 0.05),
            Offset(widget.width * 0.08, -widget.height * 0.05),
            Offset(-widget.width * 0.2, widget.height * 0.2),
            Offset(-widget.width * 0.2, widget.height * 0.2),
            Offset(-widget.width * 0.2, widget.height * 0.2),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#F4D462"),
                getColorFromHex("#FFE194"),
                getColorFromHex("#F09553"),
              ],
            ),
            true);
        break;
      case "120":
        animatedrelated(
            Offset(widget.width * 0.08, -widget.height * 0.05),
            Offset(widget.width * 0.08, -widget.height * 0.05),
            Offset(widget.width * 0.08, -widget.height * 0.05),
            Offset(-widget.width * 0.2, widget.height * 0.2),
            Offset(-widget.width * 0.2, widget.height * 0.2),
            Offset(-widget.width * 0.2, widget.height * 0.2),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#FFE898"),
                getColorFromHex("#FFE7AA"),
                getColorFromHex("#FFD186"),
              ],
            ),
            true);
        break;
      case "121":
        animatedrelated(
            Offset(widget.width * 0.1, -widget.height * 0.06),
            Offset(widget.width * 0.1, -widget.height * 0.06),
            Offset(widget.width * 0.1, -widget.height * 0.06),
            Offset(-widget.width * 0.18, widget.height * 0.2),
            Offset(-widget.width * 0.18, widget.height * 0.2),
            Offset(-widget.width * 0.18, widget.height * 0.2),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#FFE898"),
                getColorFromHex("#FFE7AA"),
                getColorFromHex("#FFD186"),
              ],
            ),
            true);
        break;
      case "122":
        animatedrelated(
            Offset(widget.width * 0.12, -widget.height * 0.065),
            Offset(widget.width * 0.12, -widget.height * 0.065),
            Offset(widget.width * 0.12, -widget.height * 0.065),
            Offset(-widget.width * 0.16, widget.height * 0.2),
            Offset(-widget.width * 0.16, widget.height * 0.2),
            Offset(-widget.width * 0.16, widget.height * 0.2),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#FFE898"),
                getColorFromHex("#FFE7AA"),
                getColorFromHex("#FFD186"),
              ],
            ),
            true);
        break;
      case "123":
        animatedrelated(
            Offset(widget.width * 0.13, -widget.height * 0.07),
            Offset(widget.width * 0.13, -widget.height * 0.07),
            Offset(widget.width * 0.13, -widget.height * 0.07),
            Offset(-widget.width * 0.14, widget.height * 0.2),
            Offset(-widget.width * 0.14, widget.height * 0.2),
            Offset(-widget.width * 0.14, widget.height * 0.2),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#FFE898"),
                getColorFromHex("#FFE7AA"),
                getColorFromHex("#FFD186"),
              ],
            ),
            true);
        break;
      case "124":
        animatedrelated(
            Offset(widget.width * 0.145, -widget.height * 0.085),
            Offset(widget.width * 0.145, -widget.height * 0.085),
            Offset(widget.width * 0.145, -widget.height * 0.085),
            Offset(-widget.width * 0.12, widget.height * 0.2),
            Offset(-widget.width * 0.12, widget.height * 0.2),
            Offset(-widget.width * 0.12, widget.height * 0.2),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#FFE898"),
                getColorFromHex("#FFE7AA"),
                getColorFromHex("#FFD186"),
              ],
            ),
            true);
        break;
      case "125":
        animatedrelated(
            Offset(widget.width * 0.16, -widget.height * 0.09),
            Offset(widget.width * 0.16, -widget.height * 0.09),
            Offset(widget.width * 0.16, -widget.height * 0.09),
            Offset(-widget.width * 0.1, widget.height * 0.2),
            Offset(-widget.width * 0.1, widget.height * 0.2),
            Offset(-widget.width * 0.1, widget.height * 0.2),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#FFE898"),
                getColorFromHex("#FFE7AA"),
                getColorFromHex("#FFD186"),
              ],
            ),
            true);
        break;
      case "130":
        animatedrelated(
            Offset(widget.width * 0.16, -widget.height * 0.09),
            Offset(widget.width * 0.16, -widget.height * 0.09),
            Offset(widget.width * 0.16, -widget.height * 0.09),
            Offset(-widget.width * 0.1, widget.height * 0.2),
            Offset(-widget.width * 0.1, widget.height * 0.2),
            Offset(-widget.width * 0.1, widget.height * 0.2),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#FDE17E"),
                getColorFromHex("#FFE092"),
                getColorFromHex("#FFCA76"),
              ],
            ),
            true);
        break;
      case "131":
        animatedrelated(
            Offset(widget.width * 0.18, -widget.height * 0.10),
            Offset(widget.width * 0.18, -widget.height * 0.10),
            Offset(widget.width * 0.18, -widget.height * 0.10),
            Offset(-widget.width * 0.08, widget.height * 0.2),
            Offset(-widget.width * 0.08, widget.height * 0.2),
            Offset(-widget.width * 0.08, widget.height * 0.2),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#FDE17E"),
                getColorFromHex("#FFE092"),
                getColorFromHex("#FFCA76"),
              ],
            ),
            true);
        break;
      case "132":
        animatedrelated(
            Offset(widget.width * 0.2, -widget.height * 0.11),
            Offset(widget.width * 0.2, -widget.height * 0.11),
            Offset(widget.width * 0.2, -widget.height * 0.11),
            Offset(-widget.width * 0.06, widget.height * 0.2),
            Offset(-widget.width * 0.06, widget.height * 0.2),
            Offset(-widget.width * 0.06, widget.height * 0.2),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#FDE17E"),
                getColorFromHex("#FFE092"),
                getColorFromHex("#FFCA76"),
              ],
            ),
            true);
        break;
      case "133":
        animatedrelated(
            Offset(widget.width * 0.21, -widget.height * 0.12),
            Offset(widget.width * 0.21, -widget.height * 0.12),
            Offset(widget.width * 0.21, -widget.height * 0.12),
            Offset(-widget.width * 0.04, widget.height * 0.2),
            Offset(-widget.width * 0.04, widget.height * 0.2),
            Offset(-widget.width * 0.04, widget.height * 0.2),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#FDE17E"),
                getColorFromHex("#FFE092"),
                getColorFromHex("#FFCA76"),
              ],
            ),
            true);
        break;
      case "134":
        animatedrelated(
            Offset(widget.width * 0.23, -widget.height * 0.125),
            Offset(widget.width * 0.23, -widget.height * 0.125),
            Offset(widget.width * 0.23, -widget.height * 0.125),
            Offset(-widget.width * 0.02, widget.height * 0.2),
            Offset(-widget.width * 0.02, widget.height * 0.2),
            Offset(-widget.width * 0.02, widget.height * 0.2),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#FDE17E"),
                getColorFromHex("#FFE092"),
                getColorFromHex("#FFCA76"),
              ],
            ),
            true);
        break;
      case "135":
        animatedrelated(
            Offset(widget.width * 0.24, -widget.height * 0.13),
            Offset(widget.width * 0.24, -widget.height * 0.13),
            Offset(widget.width * 0.24, -widget.height * 0.13),
            Offset(-widget.width * 0.0, widget.height * 0.2),
            Offset(-widget.width * 0.0, widget.height * 0.2),
            Offset(-widget.width * 0.0, widget.height * 0.2),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#FDE17E"),
                getColorFromHex("#FFE092"),
                getColorFromHex("#FFCA76"),
              ],
            ),
            true);
        break;
      case "140":
        animatedrelated(
            Offset(widget.width * 0.44, -widget.height * 0.13),
            Offset(widget.width * 0.44, -widget.height * 0.13),
            Offset(widget.width * 0.44, -widget.height * 0.13),
            Offset(-widget.width * 0.0, widget.height * 0.2),
            Offset(-widget.width * 0.0, widget.height * 0.2),
            Offset(-widget.width * 0.0, widget.height * 0.2),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#FFDC8F"),
                getColorFromHex("#FFD192"),
                getColorFromHex("#FFC68C"),
              ],
            ),
            true);
        break;
      case "141":
        animatedrelated(
            Offset(widget.width * 0.445, -widget.height * 0.125),
            Offset(widget.width * 0.445, -widget.height * 0.125),
            Offset(widget.width * 0.445, -widget.height * 0.125),
            Offset(widget.width * 0.02, widget.height * 0.2),
            Offset(widget.width * 0.02, widget.height * 0.2),
            Offset(widget.width * 0.02, widget.height * 0.2),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#FFDC8F"),
                getColorFromHex("#FFD192"),
                getColorFromHex("#FFC68C"),
              ],
            ),
            true);
        break;
      case "142":
        animatedrelated(
            Offset(widget.width * 0.45, -widget.height * 0.12),
            Offset(widget.width * 0.45, -widget.height * 0.12),
            Offset(widget.width * 0.45, -widget.height * 0.12),
            Offset(widget.width * 0.04, widget.height * 0.2),
            Offset(widget.width * 0.04, widget.height * 0.2),
            Offset(widget.width * 0.04, widget.height * 0.2),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#FFDC8F"),
                getColorFromHex("#FFD192"),
                getColorFromHex("#FFC68C"),
              ],
            ),
            true);
        break;
      case "143":
        animatedrelated(
            Offset(widget.width * 0.46, -widget.height * 0.11),
            Offset(widget.width * 0.46, -widget.height * 0.11),
            Offset(widget.width * 0.46, -widget.height * 0.11),
            Offset(widget.width * 0.05, widget.height * 0.2),
            Offset(widget.width * 0.05, widget.height * 0.2),
            Offset(widget.width * 0.05, widget.height * 0.2),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#FFDC8F"),
                getColorFromHex("#FFD192"),
                getColorFromHex("#FFC68C"),
              ],
            ),
            true);
        break;
      case "144":
        animatedrelated(
            Offset(widget.width * 0.47, -widget.height * 0.1),
            Offset(widget.width * 0.47, -widget.height * 0.1),
            Offset(widget.width * 0.47, -widget.height * 0.1),
            Offset(widget.width * 0.08, widget.height * 0.2),
            Offset(widget.width * 0.08, widget.height * 0.2),
            Offset(widget.width * 0.08, widget.height * 0.2),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#FFDC8F"),
                getColorFromHex("#FFD192"),
                getColorFromHex("#FFC68C"),
              ],
            ),
            true);
        break;
      case "145":
        animatedrelated(
            Offset(widget.width * 0.48, -widget.height * 0.09),
            Offset(widget.width * 0.48, -widget.height * 0.09),
            Offset(widget.width * 0.48, -widget.height * 0.09),
            Offset(widget.width * 0.1, widget.height * 0.2),
            Offset(widget.width * 0.1, widget.height * 0.2),
            Offset(widget.width * 0.1, widget.height * 0.2),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#FFDC8F"),
                getColorFromHex("#FFD192"),
                getColorFromHex("#FFC68C"),
              ],
            ),
            true);
        break;
      case "150":
        animatedrelated(
            Offset(widget.width * 0.48, -widget.height * 0.09),
            Offset(widget.width * 0.48, -widget.height * 0.09),
            Offset(widget.width * 0.48, -widget.height * 0.09),
            Offset(-widget.width * 0.1, widget.height * 0.2),
            Offset(-widget.width * 0.1, widget.height * 0.2),
            Offset(-widget.width * 0.1, widget.height * 0.2),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#F5CB71"),
                getColorFromHex("#F5C98C"),
                getColorFromHex("#F5BE87"),
              ],
            ),
            true);
        break;
      case "151":
        animatedrelated(
            Offset(widget.width * 0.485, -widget.height * 0.085),
            Offset(widget.width * 0.485, -widget.height * 0.085),
            Offset(widget.width * 0.485, -widget.height * 0.085),
            Offset(widget.width * 0.12, widget.height * 0.2),
            Offset(widget.width * 0.12, widget.height * 0.2),
            Offset(widget.width * 0.12, widget.height * 0.2),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#F5CB71"),
                getColorFromHex("#F5C98C"),
                getColorFromHex("#F5BE87"),
              ],
            ),
            true);
        break;
      case "152":
        animatedrelated(
            Offset(widget.width * 0.49, -widget.height * 0.08),
            Offset(widget.width * 0.49, -widget.height * 0.08),
            Offset(widget.width * 0.49, -widget.height * 0.08),
            Offset(widget.width * 0.14, widget.height * 0.2),
            Offset(widget.width * 0.14, widget.height * 0.2),
            Offset(widget.width * 0.14, widget.height * 0.2),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#F5CB71"),
                getColorFromHex("#F5C98C"),
                getColorFromHex("#F5BE87"),
              ],
            ),
            true);
        break;
      case "153":
        animatedrelated(
            Offset(widget.width * 0.50, -widget.height * 0.07),
            Offset(widget.width * 0.50, -widget.height * 0.07),
            Offset(widget.width * 0.50, -widget.height * 0.07),
            Offset(widget.width * 0.16, widget.height * 0.2),
            Offset(widget.width * 0.16, widget.height * 0.2),
            Offset(widget.width * 0.16, widget.height * 0.2),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#F5CB71"),
                getColorFromHex("#F5C98C"),
                getColorFromHex("#F5BE87"),
              ],
            ),
            true);
        break;
      case "154":
        animatedrelated(
            Offset(widget.width * 0.51, -widget.height * 0.06),
            Offset(widget.width * 0.51, -widget.height * 0.06),
            Offset(widget.width * 0.51, -widget.height * 0.06),
            Offset(widget.width * 0.18, widget.height * 0.2),
            Offset(widget.width * 0.18, widget.height * 0.2),
            Offset(widget.width * 0.18, widget.height * 0.2),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#F5CB71"),
                getColorFromHex("#F5C98C"),
                getColorFromHex("#F5BE87"),
              ],
            ),
            true);
        break;
      case "155":
        animatedrelated(
            Offset(widget.width * 0.52, -widget.height * 0.05),
            Offset(widget.width * 0.52, -widget.height * 0.05),
            Offset(widget.width * 0.52, -widget.height * 0.05),
            Offset(widget.width * 0.2, widget.height * 0.2),
            Offset(widget.width * 0.2, widget.height * 0.2),
            Offset(widget.width * 0.2, widget.height * 0.2),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#F5CB71"),
                getColorFromHex("#F5C98C"),
                getColorFromHex("#F5BE87"),
              ],
            ),
            true);
        break;
      case "160":
        animatedrelated(
            Offset(widget.width * 0.52, -widget.height * 0.05),
            Offset(widget.width * 0.52, -widget.height * 0.05),
            Offset(widget.width * 0.52, -widget.height * 0.05),
            Offset(widget.width * 0.2, widget.height * 0.2),
            Offset(widget.width * 0.2, widget.height * 0.2),
            Offset(widget.width * 0.2, widget.height * 0.2),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#88E1F5"),
                getColorFromHex("#B5D3CD"),
                getColorFromHex("#F5C98C"),
                getColorFromHex("#F5CB71"),
              ],
            ),
            true);
        break;
      case "161":
        animatedrelated(
            Offset(widget.width * 0.54, -widget.height * 0.045),
            Offset(widget.width * 0.54, -widget.height * 0.045),
            Offset(widget.width * 0.54, -widget.height * 0.045),
            Offset(widget.width * 0.22, widget.height * 0.2),
            Offset(widget.width * 0.22, widget.height * 0.2),
            Offset(widget.width * 0.22, widget.height * 0.2),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#88E1F5"),
                getColorFromHex("#B5D3CD"),
                getColorFromHex("#F5C98C"),
                getColorFromHex("#F5CB71"),
              ],
            ),
            true);
        break;
      case "162":
        animatedrelated(
            Offset(widget.width * 0.55, -widget.height * 0.04),
            Offset(widget.width * 0.55, -widget.height * 0.04),
            Offset(widget.width * 0.55, -widget.height * 0.04),
            Offset(widget.width * 0.24, widget.height * 0.2),
            Offset(widget.width * 0.24, widget.height * 0.2),
            Offset(widget.width * 0.24, widget.height * 0.2),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#88E1F5"),
                getColorFromHex("#B5D3CD"),
                getColorFromHex("#F5C98C"),
                getColorFromHex("#F5CB71"),
              ],
            ),
            true);
        break;
      case "163":
        animatedrelated(
            Offset(widget.width * 0.57, -widget.height * 0.03),
            Offset(widget.width * 0.57, -widget.height * 0.03),
            Offset(widget.width * 0.57, -widget.height * 0.03),
            Offset(widget.width * 0.26, widget.height * 0.2),
            Offset(widget.width * 0.26, widget.height * 0.2),
            Offset(widget.width * 0.26, widget.height * 0.2),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#88E1F5"),
                getColorFromHex("#B5D3CD"),
                getColorFromHex("#F5C98C"),
                getColorFromHex("#F5CB71"),
              ],
            ),
            true);
        break;
      case "164":
        animatedrelated(
            Offset(widget.width * 0.58, -widget.height * 0.02),
            Offset(widget.width * 0.58, -widget.height * 0.02),
            Offset(widget.width * 0.58, -widget.height * 0.02),
            Offset(widget.width * 0.28, widget.height * 0.2),
            Offset(widget.width * 0.28, widget.height * 0.2),
            Offset(widget.width * 0.28, widget.height * 0.2),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#88E1F5"),
                getColorFromHex("#B5D3CD"),
                getColorFromHex("#F5C98C"),
                getColorFromHex("#F5CB71"),
              ],
            ),
            true);
        break;
      case "165":
        animatedrelated(
            Offset(widget.width * 0.60, -widget.height * 0.01),
            Offset(widget.width * 0.60, -widget.height * 0.01),
            Offset(widget.width * 0.60, -widget.height * 0.01),
            Offset(widget.width * 0.3, widget.height * 0.2),
            Offset(widget.width * 0.3, widget.height * 0.2),
            Offset(widget.width * 0.3, widget.height * 0.2),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#88E1F5"),
                getColorFromHex("#B5D3CD"),
                getColorFromHex("#F5C98C"),
                getColorFromHex("#F5CB71"),
              ],
            ),
            true);
        break;
      case "170":
        animatedrelated(
            Offset(widget.width * 0.60, -widget.height * 0.01),
            Offset(widget.width * 0.60, -widget.height * 0.01),
            Offset(widget.width * 0.60, -widget.height * 0.01),
            Offset(widget.width * 0.3, widget.height * 0.2),
            Offset(widget.width * 0.3, widget.height * 0.2),
            Offset(widget.width * 0.3, widget.height * 0.2),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#67C3D7"),
                getColorFromHex("#76B6C4"),
                getColorFromHex("#D4D695"),
              ],
            ),
            true);
        break;
      case "171":
        animatedrelated(
            Offset(widget.width * 0.62, widget.height * 0.0),
            Offset(widget.width * 0.62, widget.height * 0.0),
            Offset(widget.width * 0.62, widget.height * 0.0),
            Offset(widget.width * 0.32, widget.height * 0.2),
            Offset(widget.width * 0.32, widget.height * 0.2),
            Offset(widget.width * 0.32, widget.height * 0.2),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#67C3D7"),
                getColorFromHex("#76B6C4"),
                getColorFromHex("#D4D695"),
              ],
            ),
            true);
        break;
      case "172":
        animatedrelated(
            Offset(widget.width * 0.64, widget.height * 0.005),
            Offset(widget.width * 0.64, widget.height * 0.005),
            Offset(widget.width * 0.64, widget.height * 0.005),
            Offset(widget.width * 0.34, widget.height * 0.2),
            Offset(widget.width * 0.34, widget.height * 0.2),
            Offset(widget.width * 0.34, widget.height * 0.2),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#67C3D7"),
                getColorFromHex("#76B6C4"),
                getColorFromHex("#D4D695"),
              ],
            ),
            true);
        break;
      case "173":
        animatedrelated(
            Offset(widget.width * 0.66, widget.height * 0.01),
            Offset(widget.width * 0.66, widget.height * 0.01),
            Offset(widget.width * 0.66, widget.height * 0.01),
            Offset(widget.width * 0.36, widget.height * 0.2),
            Offset(widget.width * 0.36, widget.height * 0.2),
            Offset(widget.width * 0.36, widget.height * 0.2),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#67C3D7"),
                getColorFromHex("#76B6C4"),
                getColorFromHex("#D4D695"),
              ],
            ),
            true);
        break;
      case "174":
        animatedrelated(
            Offset(widget.width * 0.68, widget.height * 0.02),
            Offset(widget.width * 0.68, widget.height * 0.02),
            Offset(widget.width * 0.68, widget.height * 0.02),
            Offset(widget.width * 0.38, widget.height * 0.2),
            Offset(widget.width * 0.38, widget.height * 0.2),
            Offset(widget.width * 0.38, widget.height * 0.2),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#67C3D7"),
                getColorFromHex("#76B6C4"),
                getColorFromHex("#D4D695"),
              ],
            ),
            true);
        break;
      case "175":
        animatedrelated(
            Offset(widget.width * 0.70, widget.height * 0.03),
            Offset(widget.width * 0.70, widget.height * 0.03),
            Offset(widget.width * 0.70, widget.height * 0.03),
            Offset(widget.width * 0.4, widget.height * 0.2),
            Offset(widget.width * 0.4, widget.height * 0.2),
            Offset(widget.width * 0.4, widget.height * 0.2),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#67C3D7"),
                getColorFromHex("#76B6C4"),
                getColorFromHex("#D4D695"),
              ],
            ),
            true);
        break;
      case "180":
        animatedrelated(
            Offset(widget.width * 0.70, widget.height * 0.03),
            Offset(widget.width * 0.70, widget.height * 0.03),
            Offset(widget.width * 0.70, widget.height * 0.03),
            Offset(widget.width * 0.4, widget.height * 0.2),
            Offset(widget.width * 0.4, widget.height * 0.2),
            Offset(widget.width * 0.4, widget.height * 0.2),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#67C3D7"),
                getColorFromHex("#76B6C4"),
                getColorFromHex("#BCBD97"),
              ],
            ),
            true);
        break;
      case "181":
        animatedrelated(
            Offset(widget.width * 0.72, widget.height * 0.04),
            Offset(widget.width * 0.72, widget.height * 0.04),
            Offset(widget.width * 0.72, widget.height * 0.04),
            Offset(widget.width * 0.42, widget.height * 0.2),
            Offset(widget.width * 0.42, widget.height * 0.2),
            Offset(widget.width * 0.42, widget.height * 0.2),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#67C3D7"),
                getColorFromHex("#76B6C4"),
                getColorFromHex("#BCBD97"),
              ],
            ),
            true);
        break;
      case "182":
        animatedrelated(
            Offset(widget.width * 0.74, widget.height * 0.045),
            Offset(widget.width * 0.74, widget.height * 0.045),
            Offset(widget.width * 0.74, widget.height * 0.045),
            Offset(widget.width * 0.44, widget.height * 0.2),
            Offset(widget.width * 0.44, widget.height * 0.2),
            Offset(widget.width * 0.44, widget.height * 0.2),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#67C3D7"),
                getColorFromHex("#76B6C4"),
                getColorFromHex("#BCBD97"),
              ],
            ),
            true);
        break;
      case "183":
        animatedrelated(
            Offset(widget.width * 0.76, widget.height * 0.05),
            Offset(widget.width * 0.76, widget.height * 0.05),
            Offset(widget.width * 0.76, widget.height * 0.05),
            Offset(widget.width * 0.46, widget.height * 0.2),
            Offset(widget.width * 0.46, widget.height * 0.2),
            Offset(widget.width * 0.46, widget.height * 0.2),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#67C3D7"),
                getColorFromHex("#76B6C4"),
                getColorFromHex("#BCBD97"),
              ],
            ),
            true);
        break;
      case "184":
        animatedrelated(
            Offset(widget.width * 0.78, widget.height * 0.06),
            Offset(widget.width * 0.78, widget.height * 0.06),
            Offset(widget.width * 0.78, widget.height * 0.06),
            Offset(widget.width * 0.48, widget.height * 0.2),
            Offset(widget.width * 0.48, widget.height * 0.2),
            Offset(widget.width * 0.48, widget.height * 0.2),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#67C3D7"),
                getColorFromHex("#76B6C4"),
                getColorFromHex("#BCBD97"),
              ],
            ),
            true);
        break;
      case "185":
        animatedrelated(
            Offset(widget.width * 0.80, widget.height * 0.07),
            Offset(widget.width * 0.80, widget.height * 0.07),
            Offset(widget.width * 0.80, widget.height * 0.07),
            Offset(widget.width * 0.5, widget.height * 0.2),
            Offset(widget.width * 0.5, widget.height * 0.2),
            Offset(widget.width * 0.5, widget.height * 0.2),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#67C3D7"),
                getColorFromHex("#76B6C4"),
                getColorFromHex("#BCBD97"),
              ],
            ),
            true);
        break;
      case "190":
        animatedrelated(
            Offset(widget.width * 0.80, widget.height * 0.07),
            Offset(widget.width * 0.80, widget.height * 0.07),
            Offset(widget.width * 0.80, widget.height * 0.07),
            Offset(widget.width * 0.5, widget.height * 0.2),
            Offset(widget.width * 0.5, widget.height * 0.2),
            Offset(widget.width * 0.5, widget.height * 0.2),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#67C3D7"),
                getColorFromHex("#76B6C4"),
                getColorFromHex("#BBBC96"),
              ],
            ),
            true);
        break;
      case "191":
        animatedrelated(
            Offset(widget.width * 1.0, widget.height * 0.09),
            Offset(widget.width * 1.0, widget.height * 0.09),
            Offset(widget.width * 1.0, widget.height * 0.09),
            Offset(widget.width * 0.6, widget.height * 0.2),
            Offset(widget.width * 0.6, widget.height * 0.2),
            Offset(widget.width * 0.6, widget.height * 0.2),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#67C3D7"),
                getColorFromHex("#76B6C4"),
                getColorFromHex("#BBBC96"),
              ],
            ),
            true);
        break;
      case "192":
        animatedrelated(
            Offset(widget.width * 1.2, widget.height * 0.12),
            Offset(widget.width * 1.2, widget.height * 0.12),
            Offset(widget.width * 1.2, widget.height * 0.12),
            Offset(widget.width * 0.65, widget.height * 0.2),
            Offset(widget.width * 0.65, widget.height * 0.2),
            Offset(widget.width * 0.65, widget.height * 0.2),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#67C3D7"),
                getColorFromHex("#76B6C4"),
                getColorFromHex("#BBBC96"),
              ],
            ),
            true);
        break;
      case "193":
        animatedrelated(
            Offset(widget.width * 1.4, widget.height * 0.14),
            Offset(widget.width * 1.4, widget.height * 0.14),
            Offset(widget.width * 1.4, widget.height * 0.14),
            Offset(widget.width * 0.7, widget.height * 0.2),
            Offset(widget.width * 0.7, widget.height * 0.2),
            Offset(widget.width * 0.7, widget.height * 0.2),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#67C3D7"),
                getColorFromHex("#76B6C4"),
                getColorFromHex("#BBBC96"),
              ],
            ),
            true);
        break;
      case "194":
        animatedrelated(
            Offset(widget.width * 1.8, widget.height * 0.18),
            Offset(widget.width * 1.8, widget.height * 0.18),
            Offset(widget.width * 1.8, widget.height * 0.18),
            Offset(widget.width * 0.8, widget.height * 0.2),
            Offset(widget.width * 0.8, widget.height * 0.2),
            Offset(widget.width * 0.8, widget.height * 0.2),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#67C3D7"),
                getColorFromHex("#76B6C4"),
                getColorFromHex("#BBBC96"),
              ],
            ),
            true);
        break;
      case "195":
        animatedrelated(
            Offset(widget.width * 2, widget.height * 0.2),
            Offset(widget.width * 2, widget.height * 0.2),
            Offset(widget.width * 2, widget.height * 0.2),
            Offset(widget.width * 0.9, widget.height * 0.2),
            Offset(widget.width * 0.9, widget.height * 0.2),
            Offset(widget.width * 0.9, widget.height * 0.2),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            Offset(widget.width, 0),
            LinearGradient(
              colors: [
                getColorFromHex("#67C3D7"),
                getColorFromHex("#76B6C4"),
                getColorFromHex("#BBBC96"),
              ],
            ),
            true);
        break;
      case "200":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 0.60, widget.height * 0.2),
            Offset(widget.width * 0.60, widget.height * 0.2),
            Offset(widget.width * 0.60, widget.height * 0.2),
            Offset(widget.width * 0.9, widget.height * 0.1),
            Offset(widget.width * 0.9, widget.height * 0.1),
            Offset(widget.width * 0.9, widget.height * 0.1),
            LinearGradient(
              colors: [
                getColorFromHex("#4C9EB0"),
                getColorFromHex("#779EA7"),
              ],
            ),
            false);
        break;
      case "201":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 0.58, widget.height * 0.2),
            Offset(widget.width * 0.58, widget.height * 0.2),
            Offset(widget.width * 0.58, widget.height * 0.2),
            Offset(widget.width * 0.895, widget.height * 0.09),
            Offset(widget.width * 0.895, widget.height * 0.09),
            Offset(widget.width * 0.895, widget.height * 0.09),
            LinearGradient(
              colors: [
                getColorFromHex("#4C9EB0"),
                getColorFromHex("#779EA7"),
              ],
            ),
            false);
        break;
      case "202":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 0.56, widget.height * 0.2),
            Offset(widget.width * 0.56, widget.height * 0.2),
            Offset(widget.width * 0.56, widget.height * 0.2),
            Offset(widget.width * 0.89, widget.height * 0.085),
            Offset(widget.width * 0.89, widget.height * 0.085),
            Offset(widget.width * 0.89, widget.height * 0.085),
            LinearGradient(
              colors: [
                getColorFromHex("#4C9EB0"),
                getColorFromHex("#779EA7"),
              ],
            ),
            false);
        break;
      case "203":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 0.54, widget.height * 0.2),
            Offset(widget.width * 0.54, widget.height * 0.2),
            Offset(widget.width * 0.54, widget.height * 0.2),
            Offset(widget.width * 0.87, widget.height * 0.08),
            Offset(widget.width * 0.87, widget.height * 0.08),
            Offset(widget.width * 0.87, widget.height * 0.08),
            LinearGradient(
              colors: [
                getColorFromHex("#4C9EB0"),
                getColorFromHex("#779EA7"),
              ],
            ),
            false);
        break;
      case "204":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 0.52, widget.height * 0.2),
            Offset(widget.width * 0.52, widget.height * 0.2),
            Offset(widget.width * 0.52, widget.height * 0.2),
            Offset(widget.width * 0.86, widget.height * 0.07),
            Offset(widget.width * 0.86, widget.height * 0.07),
            Offset(widget.width * 0.86, widget.height * 0.07),
            LinearGradient(
              colors: [
                getColorFromHex("#4C9EB0"),
                getColorFromHex("#779EA7"),
              ],
            ),
            false);
        break;
      case "205":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 0.50, widget.height * 0.2),
            Offset(widget.width * 0.50, widget.height * 0.2),
            Offset(widget.width * 0.50, widget.height * 0.2),
            Offset(widget.width * 0.85, widget.height * 0.06),
            Offset(widget.width * 0.85, widget.height * 0.06),
            Offset(widget.width * 0.85, widget.height * 0.06),
            LinearGradient(
              colors: [
                getColorFromHex("#4C9EB0"),
                getColorFromHex("#779EA7"),
              ],
            ),
            false);
        break;
      case "210":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 0.5, widget.height * 0.2),
            Offset(widget.width * 0.5, widget.height * 0.2),
            Offset(widget.width * 0.5, widget.height * 0.2),
            Offset(widget.width * 0.85, widget.height * 0.06),
            Offset(widget.width * 0.85, widget.height * 0.06),
            Offset(widget.width * 0.85, widget.height * 0.06),
            LinearGradient(
              colors: [
                getColorFromHex("#418EA4"),
                getColorFromHex("#6A97A0"),
              ],
            ),
            false);
        break;
      case "211":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 0.495, widget.height * 0.2),
            Offset(widget.width * 0.495, widget.height * 0.2),
            Offset(widget.width * 0.495, widget.height * 0.2),
            Offset(widget.width * 0.845, widget.height * 0.055),
            Offset(widget.width * 0.845, widget.height * 0.055),
            Offset(widget.width * 0.845, widget.height * 0.055),
            LinearGradient(
              colors: [
                getColorFromHex("#418EA4"),
                getColorFromHex("#6A97A0"),
              ],
            ),
            false);
        break;
      case "212":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 0.49, widget.height * 0.2),
            Offset(widget.width * 0.49, widget.height * 0.2),
            Offset(widget.width * 0.49, widget.height * 0.2),
            Offset(widget.width * 0.84, widget.height * 0.05),
            Offset(widget.width * 0.84, widget.height * 0.05),
            Offset(widget.width * 0.84, widget.height * 0.05),
            LinearGradient(
              colors: [
                getColorFromHex("#418EA4"),
                getColorFromHex("#6A97A0"),
              ],
            ),
            false);
        break;
      case "213":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 0.48, widget.height * 0.2),
            Offset(widget.width * 0.48, widget.height * 0.2),
            Offset(widget.width * 0.48, widget.height * 0.2),
            Offset(widget.width * 0.83, widget.height * 0.04),
            Offset(widget.width * 0.83, widget.height * 0.04),
            Offset(widget.width * 0.83, widget.height * 0.04),
            LinearGradient(
              colors: [
                getColorFromHex("#418EA4"),
                getColorFromHex("#6A97A0"),
              ],
            ),
            false);
        break;
      case "214":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 0.47, widget.height * 0.2),
            Offset(widget.width * 0.47, widget.height * 0.2),
            Offset(widget.width * 0.47, widget.height * 0.2),
            Offset(widget.width * 0.82, widget.height * 0.03),
            Offset(widget.width * 0.82, widget.height * 0.03),
            Offset(widget.width * 0.82, widget.height * 0.03),
            LinearGradient(
              colors: [
                getColorFromHex("#418EA4"),
                getColorFromHex("#6A97A0"),
              ],
            ),
            false);
        break;
      case "215":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 0.46, widget.height * 0.2),
            Offset(widget.width * 0.46, widget.height * 0.2),
            Offset(widget.width * 0.46, widget.height * 0.2),
            Offset(widget.width * 0.81, widget.height * 0.02),
            Offset(widget.width * 0.81, widget.height * 0.02),
            Offset(widget.width * 0.81, widget.height * 0.02),
            LinearGradient(
              colors: [
                getColorFromHex("#418EA4"),
                getColorFromHex("#6A97A0"),
              ],
            ),
            false);
        break;
      case "220":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 0.44, widget.height * 0.2),
            Offset(widget.width * 0.44, widget.height * 0.2),
            Offset(widget.width * 0.44, widget.height * 0.2),
            Offset(widget.width * 0.81, widget.height * 0.02),
            Offset(widget.width * 0.81, widget.height * 0.02),
            Offset(widget.width * 0.81, widget.height * 0.02),
            LinearGradient(
              colors: [
                getColorFromHex("#357A8F"),
                getColorFromHex("#529093"),
              ],
            ),
            false);
        break;
      case "221":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 0.435, widget.height * 0.2),
            Offset(widget.width * 0.435, widget.height * 0.2),
            Offset(widget.width * 0.435, widget.height * 0.2),
            Offset(widget.width * 0.80, widget.height * 0.015),
            Offset(widget.width * 0.80, widget.height * 0.015),
            Offset(widget.width * 0.80, widget.height * 0.015),
            LinearGradient(
              colors: [
                getColorFromHex("#357A8F"),
                getColorFromHex("#529093"),
              ],
            ),
            false);
        break;
      case "222":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 0.43, widget.height * 0.2),
            Offset(widget.width * 0.43, widget.height * 0.2),
            Offset(widget.width * 0.43, widget.height * 0.2),
            Offset(widget.width * 0.80, widget.height * 0.01),
            Offset(widget.width * 0.80, widget.height * 0.01),
            Offset(widget.width * 0.80, widget.height * 0.01),
            LinearGradient(
              colors: [
                getColorFromHex("#357A8F"),
                getColorFromHex("#529093"),
              ],
            ),
            false);
        break;
      case "223":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 0.42, widget.height * 0.2),
            Offset(widget.width * 0.42, widget.height * 0.2),
            Offset(widget.width * 0.42, widget.height * 0.2),
            Offset(widget.width * 0.79, widget.height * 0.00),
            Offset(widget.width * 0.79, widget.height * 0.00),
            Offset(widget.width * 0.79, widget.height * 0.00),
            LinearGradient(
              colors: [
                getColorFromHex("#357A8F"),
                getColorFromHex("#529093"),
              ],
            ),
            false);
        break;
      case "224":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 0.41, widget.height * 0.2),
            Offset(widget.width * 0.41, widget.height * 0.2),
            Offset(widget.width * 0.41, widget.height * 0.2),
            Offset(widget.width * 0.78, -widget.height * 0.01),
            Offset(widget.width * 0.78, -widget.height * 0.01),
            Offset(widget.width * 0.78, -widget.height * 0.01),
            LinearGradient(
              colors: [
                getColorFromHex("#357A8F"),
                getColorFromHex("#529093"),
              ],
            ),
            false);
        break;
      case "225":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 0.40, widget.height * 0.2),
            Offset(widget.width * 0.40, widget.height * 0.2),
            Offset(widget.width * 0.40, widget.height * 0.2),
            Offset(widget.width * 0.77, -widget.height * 0.02),
            Offset(widget.width * 0.77, -widget.height * 0.02),
            Offset(widget.width * 0.77, -widget.height * 0.02),
            LinearGradient(
              colors: [
                getColorFromHex("#357A8F"),
                getColorFromHex("#529093"),
              ],
            ),
            false);
        break;
      case "230":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 0.40, widget.height * 0.2),
            Offset(widget.width * 0.40, widget.height * 0.2),
            Offset(widget.width * 0.40, widget.height * 0.2),
            Offset(widget.width * 0.77, -widget.height * 0.02),
            Offset(widget.width * 0.77, -widget.height * 0.02),
            Offset(widget.width * 0.77, -widget.height * 0.02),
            LinearGradient(
              colors: [
                getColorFromHex("#29677D"),
                getColorFromHex("#417B88"),
              ],
            ),
            false);
        break;
      case "231":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 0.39, widget.height * 0.2),
            Offset(widget.width * 0.39, widget.height * 0.2),
            Offset(widget.width * 0.39, widget.height * 0.2),
            Offset(widget.width * 0.76, -widget.height * 0.03),
            Offset(widget.width * 0.76, -widget.height * 0.03),
            Offset(widget.width * 0.76, -widget.height * 0.03),
            LinearGradient(
              colors: [
                getColorFromHex("#29677D"),
                getColorFromHex("#417B88"),
              ],
            ),
            false);
        break;
      case "232":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 0.385, widget.height * 0.2),
            Offset(widget.width * 0.385, widget.height * 0.2),
            Offset(widget.width * 0.385, widget.height * 0.2),
            Offset(widget.width * 0.765, -widget.height * 0.035),
            Offset(widget.width * 0.765, -widget.height * 0.035),
            Offset(widget.width * 0.765, -widget.height * 0.035),
            LinearGradient(
              colors: [
                getColorFromHex("#29677D"),
                getColorFromHex("#417B88"),
              ],
            ),
            false);
        break;
      case "233":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 0.38, widget.height * 0.2),
            Offset(widget.width * 0.38, widget.height * 0.2),
            Offset(widget.width * 0.38, widget.height * 0.2),
            Offset(widget.width * 0.75, -widget.height * 0.04),
            Offset(widget.width * 0.75, -widget.height * 0.04),
            Offset(widget.width * 0.75, -widget.height * 0.04),
            LinearGradient(
              colors: [
                getColorFromHex("#29677D"),
                getColorFromHex("#417B88"),
              ],
            ),
            false);
        break;
      case "234":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 0.39, widget.height * 0.2),
            Offset(widget.width * 0.39, widget.height * 0.2),
            Offset(widget.width * 0.39, widget.height * 0.2),
            Offset(widget.width * 0.74, -widget.height * 0.05),
            Offset(widget.width * 0.74, -widget.height * 0.05),
            Offset(widget.width * 0.74, -widget.height * 0.05),
            LinearGradient(
              colors: [
                getColorFromHex("#29677D"),
                getColorFromHex("#417B88"),
              ],
            ),
            false);
        break;
      case "235":
        animatedrelated(
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 2, 0),
            Offset(widget.width * 0.36, widget.height * 0.2),
            Offset(widget.width * 0.36, widget.height * 0.2),
            Offset(widget.width * 0.36, widget.height * 0.2),
            Offset(widget.width * 0.73, -widget.height * 0.06),
            Offset(widget.width * 0.73, -widget.height * 0.06),
            Offset(widget.width * 0.73, -widget.height * 0.06),
            LinearGradient(
              colors: [
                getColorFromHex("#29677D"),
                getColorFromHex("#417B88"),
              ],
            ),
            false);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Stream.periodic(const Duration(seconds: 1)),
        builder: (context, snapshot) {
          final dt = DateTime.now();
          _initThemeAnims(
              dayToNight: "${dt.hour}${"${dt.minute}".padLeft(2, '0')[0]}");
          // _initThemeAnims(dayToNight: "122");

          return _content();
        });
  }

  Widget _content() {
    return AnimatedContainer(
      decoration: BoxDecoration(
        gradient: _color,
      ),
      curve: const Interval(
        0.0,
        1.0,
        curve: Curves.easeIn,
      ),
      duration: const Duration(seconds: 1),
      child: Stack(children: [
        Positioned.fill(
            child: Align(
          alignment: Alignment.centerLeft,
          child: _sunOrMoon(),
        )),
        Positioned.fill(
            child: Align(
          alignment: Alignment.centerLeft,
          child: CloudyWidget(listenable: _cloudMoveAnim),
        )),
      ]),
    );
  }

  Widget _sunOrMoon() {
    if (_isDayTheme) {
      return SunWidget(listenable: _sunMoveAnim);
    } else {
      return MoonWidget(listenable: _moonMoveAnim);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void animatedrelated(
      Offset sunbo,
      Offset sunco,
      Offset sunen,
      Offset cloudbo,
      Offset cloudco,
      Offset clouden,
      Offset moonbo,
      Offset moonco,
      Offset moonen,
      LinearGradient colr,
      bool isDayThme) {
    final sunAnim = CustomTween(
      begin: sunbo,
      control: sunco,
      end: sunen,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.0,
        1.0,
        curve: Curves.ease,
      ),
    ));
    final cloudAnim = CustomTween(
      begin: cloudbo,
      control: cloudco,
      end: clouden,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.0,
        1.0,
        curve: Curves.ease,
      ),
    ));
    final moonAnim = CustomTween(begin: moonbo, control: moonco, end: moonen)
        .animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.0,
        1.0,
        curve: Curves.ease,
      ),
    ));

    _sunMoveAnim = sunAnim;

    _moonMoveAnim = moonAnim;

    _cloudMoveAnim = cloudAnim;
    _color = colr;
    _isDayTheme = isDayThme;
  }
}
