import 'package:flutter/material.dart';
import 'package:linger/Basepackage/baseclass.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenContainer extends StatelessWidget with baseclass{
  const ScreenContainer({
    Key? key,
    this.scaffoldKey,
    this.title,
    required this.child,
    this.subtitle,
    this.color,
    this.resizeToAvoidBottomPadding,
    this.padding = EdgeInsets.zero,
    this.safeAreaBottom = true,
    this.fab,
    this.fabLocation,
    this.actions,
    this.showAppBarBottomBorder = false,
    this.titleChild,
    this.toolbarHeight = 50,
    this.appBarElevation = 3,
    this.leading,
    this.showBackText = true,
    this.leadingCallBack,
    this.showAppBar = true,
    this.myAppBar,
    this.bottomSheet,
    this.showLeading = true,
    this.bottomAppBar,
    this.centerTitle = false,
    this.titleStyle,
    this.bigTitle = false,
    this.leadingWidth,
    this.navigationBar,
  }) : super(key: key);
  final Key? scaffoldKey;
  final Widget child;
  final Widget? titleChild;
  final String? title;
  final String? subtitle;
  final Color? color;
  final bool? resizeToAvoidBottomPadding;
  final EdgeInsetsGeometry padding;
  final bool safeAreaBottom;
  final bool showAppBarBottomBorder;
  final double? toolbarHeight;
  final Widget? fab;
  final FloatingActionButtonLocation? fabLocation;
  final List<Widget>? actions;
  final double appBarElevation;
  final Widget? leading;
  final VoidCallback? leadingCallBack;
  final bool showBackText;
  final bool showAppBar;
  final AppBar? myAppBar;
  final Widget? bottomSheet;
  final bool showLeading;
  final PreferredSizeWidget? bottomAppBar;
  final bool? centerTitle;
  final TextStyle? titleStyle;
  final bool? bigTitle;
  final double? leadingWidth;
  final Widget? navigationBar;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: resizeToAvoidBottomPadding,
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: myAppBar ??
          (title != null && showAppBar
              ? AppBar(
                  backgroundColor: color ?? theme.scaffoldBackgroundColor,
                  leadingWidth:
                      leadingWidth ?? (showLeading ? 15.38.w : 1.28.w),
                  titleSpacing: 0,
                  elevation: appBarElevation,
                  actionsIconTheme: IconThemeData(
                    color: theme.primaryColor,
                  ),
                  leading: showLeading
                      ? GestureDetector(
                          onTap: () {
                            if (leadingCallBack != null) {
                              leadingCallBack!();
                            } else {
                              Navigator.of(context).pop();
                            }
                          },
                          child: Container(
                            width: 12.82.w,
                            height: 4.7.h,
                            margin:
                                EdgeInsets.only(left: 2.56.w, right: 2.56.w),
                            child: IconTheme(
                              data: const IconThemeData(),
                              child: leading ??
                                  Icon(
                                    Icons.arrow_back_ios,
                                    size: bigTitle ?? false ? 26.sp : 22.sp,
                                  ),
                            ),
                          ),
                        )
                      : null,
                  centerTitle: centerTitle,
                  toolbarHeight: getH(50),
                  shape: showAppBarBottomBorder
                      ? const Border(
                          bottom: BorderSide(
                            color: Colors.black87,
                            width: 0.5,
                          ),
                        )
                      : null,
                  title: titleChild ??
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          DefaultTextStyle.merge(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            child: Text(title!,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: titleStyle ??
                                    theme.textTheme.titleMedium?.copyWith(
                                      fontSize: bigTitle ?? false ? 24 : 20.sp,
                                    )),
                          ),
                          if (subtitle != null)
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 5,
                              ),
                              child: DefaultTextStyle.merge(
                                style: const TextStyle(
                                  fontFamily: 'Metropolis',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  height: 1.25,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                child: Text(subtitle!,
                                    style:
                                        theme.textTheme.titleSmall?.copyWith()),
                              ),
                            ),
                        ],
                      ),
                  actions: actions,
                  bottom: bottomAppBar,
                )
              : null),
      body: SafeArea(
        bottom: safeAreaBottom,
        child: GestureDetector(
          child: Container(
            padding: padding,
            child: child,
          ),
        ),
      ),
      bottomSheet: bottomSheet ?? const SizedBox(),
      floatingActionButton: fab,
      floatingActionButtonLocation: fabLocation,
      bottomNavigationBar: navigationBar,
    );
  }
}
