import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:linger/Utils/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Basepackage/baseclass.dart';
import '../../Utils/customText.dart';
import '../../Utils/customrating.dart';

class YourReviewScreen extends StatefulWidget {
  const YourReviewScreen({Key? key}) : super(key: key);

  @override
  State<YourReviewScreen> createState() => _YourReviewScreenState();
}

class _YourReviewScreenState extends State<YourReviewScreen>
    with baseclass, SingleTickerProviderStateMixin {
  double userrattingcount = 5.0;
  bool starclick = false;
  String text = "";
  int maxLength = 200;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 8.2.h,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
              color: Colors.transparent,
              child: Padding(
                  padding: EdgeInsets.fromLTRB(4.w, 0.0, 0.0, 0.0),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ))),
        ),
        titleSpacing: 7.3.w,
        title: CustomText(
          text: 'Your Review',
          familytype: 2,
          linecount: 1,
          textcolor: Colors.black,
          marginvalue: const EdgeInsets.only(left: 16.0),
          textsize: 22,
          align: Alignment.centerLeft,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        leadingWidth: 8.2.w,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 80,
                  width: 80,
                  margin: const EdgeInsets.only(right: 10),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://img.freepik.com/free-psd/cosmetic-product-packaging-mockup_1150-40284.jpg?w=2000&t=st=1662393117~exp=1662393717~hmac=39e8c5f7400ac09523f3fa71767e618b450636ceaf8f54a0d08d0308ee5b69d1',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Arabic Milky Qahwa - 50 Gms',
                      familytype: 1,
                      linecount: 1,
                      textcolor: getColorFromHex(ColorConstants.black),
                      textsize: 17,
                      align: Alignment.centerLeft,
                    ),
                    CustomText(
                      text: '50g',
                      familytype: 1,
                      linecount: 1,
                      textcolor: getColorFromHex(ColorConstants.greycolor)
                          .withOpacity(0.6),
                      textsize: 13,
                      align: Alignment.centerLeft,
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Customrating(
                rating: userrattingcount,
                starCount: 5,
                above: 10,
                side: 6,
                color: getColorFromHex(ColorConstants.staryellow),
              ),
              const Spacer(),
              CustomText(
                text: 'Apr 18 ',
                familytype: 1,
                linecount: 1,
                textcolor:
                    getColorFromHex(ColorConstants.greycolor).withOpacity(0.6),
                textsize: 14,
                align: Alignment.centerLeft,
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              CustomText(
                text: 'I’m very satisfied with this product, good quality.',
                familytype: 1,
                linecount: 1,
                marginvalue: const EdgeInsets.only(top: 20),
                textcolor: getColorFromHex(ColorConstants.black),
                textsize: 17,
                align: Alignment.centerLeft,
              ),
            ],
          ),
        ],
      )),
    );
  }
}
