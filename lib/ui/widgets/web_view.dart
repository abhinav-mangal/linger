import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_pro/webview_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Basepackage/baseclass.dart';
import '../../Utils/colors.dart';
import '../../Utils/customText.dart';

class WebViewScreen extends StatefulWidget {
  final String url;
  final String? title;

  const WebViewScreen({Key? key, required this.url, this.title})
      : super(key: key);
  @override
  WebViewScreenState createState() => WebViewScreenState();
}

class WebViewScreenState extends State<WebViewScreen> with baseclass {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(top: gettoppadding(context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  padding: EdgeInsets.only(left: 4.w),
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 22.sp,
                  ),
                ),
                CustomText(
                  textalign: TextAlign.start,
                  align: Alignment.topLeft,
                  text: widget.title!,
                  familytype: 6,
                  textsize: 22.sp,
                  marginvalue: EdgeInsets.only(
                    left: getW(10),
                  ),
                  textcolor: getColorFromHex(ColorConstants.black),
                ),
              ],
            ),
          ),
          Builder(builder: (BuildContext context) {
            return SizedBox(
              height: getH(750),
              child: WebView(
                initialUrl: widget.url,
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController) {
                  _controller.complete(webViewController);
                },
                onProgress: (int progress) {
                  print("WebView is loading (progress : $progress%)");
                },
                javascriptChannels: <JavascriptChannel>{
                  _toasterJavascriptChannel(context),
                },
                navigationDelegate: (NavigationRequest request) {
                  if (request.url.startsWith('https://www.youtube.com/')) {
                    print('blocking navigation to $request}');
                    return NavigationDecision.prevent;
                  }
                  print('allowing navigation to $request');
                  return NavigationDecision.navigate;
                },
                onPageStarted: (String url) {
                  print('Page started loading: $url');
                },
                onPageFinished: (String url) {
                  print('Page finished loading: $url');
                },
                gestureNavigationEnabled: true,
                geolocationEnabled: false, //support geolocation or not
              ),
            );
          }),
        ],
      ),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          // ignore: deprecated_member_use
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }
}
