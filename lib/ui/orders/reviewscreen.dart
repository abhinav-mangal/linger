import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:linger/Utils/colors.dart';
import 'package:linger/data/model/my_order/datum.dart';
import 'package:linger/ui/orders/yourreview.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Basepackage/baseclass.dart';
import '../../Utils/customText.dart';
import '../../Utils/customrating.dart';

class ReviewScreen extends StatefulWidget {
  OrderList? items;
  ReviewScreen({Key? key, this.items}) : super(key: key);

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen>
    with baseclass, SingleTickerProviderStateMixin {
  double userrattingcount = 0.0;
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
                  padding: EdgeInsets.fromLTRB(4.w, 0.0, 4.w, 0.0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 20.sp,
                  ))),
        ),
        titleSpacing: 7.3.w,
        title: CustomText(
          text: 'Write a Review',
          familytype: 2,
          linecount: 1,
          textcolor: Colors.black,
          marginvalue: const EdgeInsets.only(left: 16.0),
          textsize: 20.sp,
          align: Alignment.centerLeft,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        leadingWidth: 8.2.w,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 4.7.h, bottom: 5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Customrating(
                    rating: userrattingcount,
                    starCount: 5,
                    height: 3.79.h,
                    width: 57.w,
                    onRatingChanged: (rating) => setState(() {
                      userrattingcount = rating;
                      starclick = true;
                    }),
                    color: getColorFromHex(ColorConstants.staryellow),
                  ),
                  const Spacer(),
                ],
              )),
          Padding(
            padding: EdgeInsets.fromLTRB(4.w, 0, 4.w, 0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                      controller: controller,
                      decoration: InputDecoration(
                          hintText: 'Write your review',
                          hintStyle: TextStyle(
                              fontSize: 15.sp,
                              fontFamily: 'Reguler',
                              color: getColorFromHex(ColorConstants.greycolor)
                                  .withOpacity(0.6))),
                      onChanged: (tet) {
                        setState(() {
                          if (tet.length <= maxLength) {
                            text = tet;
                          } else {
                            controller.text = text;
                          }
                        });
                      },
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(200),
                      ]),
                  CustomText(
                    text: "${text.length}/200",
                    familytype: 1,
                    linecount: 1,
                    marginvalue: const EdgeInsets.only(top: 10),
                    textcolor: getColorFromHex(ColorConstants.greycolor)
                        .withOpacity(0.6),
                    textsize: 11.sp,
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
      bottomNavigationBar: InkWell(
        onTap: () {
          if (text.isNotEmpty) {
            Navigator.of(context).push(CupertinoPageRoute(
                builder: (context) => const YourReviewScreen()));
          }
          // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignUp()));
        },
        child: Container(
          width: getWidth(context),
          height: 50,
          margin: EdgeInsets.fromLTRB(4.w, 0, 4.w, 40),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: text.isEmpty
                ? getColorFromHex(ColorConstants.green).withOpacity(0.2)
                : getColorFromHex(ColorConstants.green),
            borderRadius: BorderRadius.circular(10.sp),
          ),
          child: Text(
            'Submit',
            style: TextStyle(
                fontSize: 15.sp, color: Colors.white, fontFamily: 'SemiBold'),
          ),
        ),
      ),
    );
  }
}
