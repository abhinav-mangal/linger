import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Basepackage/baseclass.dart';

const double DEFAULT_BAR_HEIGHT = 69;

const double DEFAULT_INDICATOR_HEIGHT = 6;

// ignore: must_be_immutable
class TitledBottomNavigationBar extends StatefulWidget {
  final bool reverse;
  final Curve curve;
  final Color activeColor;
  final Color inactiveColor;
  final Color inactiveStripColor;
  final Color indicatorColor;
  final bool enableShadow;
  int currentIndex;

  /// Called when a item is tapped.
  ///
  /// This provide the selected item's index.
  final ValueChanged<int> onTap;

  /// The items of this navigation bar.
  ///
  /// This should contain at least two items and five at most.
  final List<TitledNavigationBarItem> items;

  /// The selected item is indicator height.
  ///
  /// Defaults to [DEFAULT_INDICATOR_HEIGHT].
  final double indicatorHeight;

  /// Change the navigation bar's size.
  ///
  /// Defaults to [DEFAULT_BAR_HEIGHT].
  final double heght;

  TitledBottomNavigationBar({
    Key? key,
    this.reverse = false,
    this.curve = Curves.linear,
    required this.onTap,
    required this.items,
    required this.activeColor,
    required this.inactiveColor,
    required this.inactiveStripColor,
    required this.indicatorColor,
    this.enableShadow = true,
    this.currentIndex = 0,
    this.heght = DEFAULT_BAR_HEIGHT,
    this.indicatorHeight = DEFAULT_INDICATOR_HEIGHT,
  })  : assert(items.length >= 2 && items.length <= 5),
        super(key: key);

  @override
  State createState() => _TitledBottomNavigationBarState();
}

class _TitledBottomNavigationBarState extends State<TitledBottomNavigationBar>
    with baseclass {
  bool get reverse => widget.reverse;

  Curve get curve => widget.curve;

  List<TitledNavigationBarItem> get items => widget.items;

  double width = 0;
  Color? activeColor;
  Duration duration = const Duration(milliseconds: 400);

  double _getIndicatorPosition(int index) {
    var isLtr = Directionality.of(context) == TextDirection.ltr;
    if (isLtr) {
      return lerpDouble(-1.0, 1.0, index / (items.length - 1))!;
    } else {
      return lerpDouble(1.0, -1.0, index / (items.length - 1))!;
    }
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    // activeColor = widget.activeColor ?? Theme.of(context).indicatorColor;

    return Container(
      height: 8.1.h,
      width: width,
      decoration: BoxDecoration(
        color: widget.inactiveStripColor,
        boxShadow: widget.enableShadow
            ? [
                const BoxShadow(color: Colors.black12, blurRadius: 10),
              ]
            : null,
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: items.map((item) {
                var index = items.indexOf(item);
                return GestureDetector(
                  onTap: () => _select(index),
                  child: _buildItemWidget(item, index == widget.currentIndex),
                );
              }).toList(),
            ),
          ),
          Visibility(
            visible: widget.currentIndex != 2,
            child: Positioned(
              bottom: 0.1.h,
              width: width,
              child: AnimatedAlign(
                alignment:
                    Alignment(_getIndicatorPosition(widget.currentIndex), 0),
                curve: curve,
                duration: duration,
                child: SizedBox(
                  width: width / items.length,
                  child: Center(
                    child: Container(
                      // color: widget.indicatorColor ?? activeColor,
                      width: 18.w,
                      height: widget.indicatorHeight,
                      decoration: BoxDecoration(
                        color: widget.indicatorColor,
                        border: Border.all(
                          color: widget.indicatorColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _select(int index) {
    widget.currentIndex = index;
    widget.onTap(widget.currentIndex);

    setState(() {});
  }

  Widget _buildIcon(TitledNavigationBarItem item) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 2.3.h,
        ),
        IconTheme(
          data: const IconThemeData(),
          // data: IconThemeData(
          //   color: reverse ? widget.inactiveColor : activeColor,
          // ),
          child: item.icon,
        ),
        SizedBox(
          child: DefaultTextStyle.merge(
            child: item.title,
            style:
                TextStyle(color: !reverse ? activeColor : widget.inactiveColor),
          ),
        ),
        // SizedBox(height: 23.h,),
      ],
    );
  }

  Widget _buildItemWidget(TitledNavigationBarItem item, bool isSelected) {
    return Container(
        color: item.backgroundColor,
        height: widget.heght,
        width: width / items.length,
        child: _buildIcon(item));
  }
}

class TitledNavigationBarItem {
  /// The title of this item.
  final Widget title;

  /// The icon of this item.
  ///
  /// If this is not a [Icon] widget, you must handle the color manually.
  final Widget icon;

  /// The background color of this item.
  ///
  /// Defaults to [Colors.white].
  final Color backgroundColor;

  TitledNavigationBarItem({
    required this.icon,
    required this.title,
    this.backgroundColor = Colors.white,
  });
}
