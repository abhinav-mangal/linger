import 'package:flutter/material.dart';
import 'package:linger/data/model/my_order/datum.dart';
import 'package:linger/ui/orders/myOrderReviewScreen.dart';
import 'package:linger/ui/orders/yourreview.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../Basepackage/baseclass.dart';
import '../../../Utils/AssetImage.dart';
import '../../../Utils/colors.dart';
import '../../../Utils/customText.dart';
import '../../../data/model/shop_dashboard_model/shop_model.dart';
import '../../shope/product_detail_screen.dart';
import '../../shope/review_product_screen.dart';
import '../reviewscreen.dart';
import 'order_item_list_view.dart';

Map<String, int> paymentStatusInNumbers = {
  "Preparing Order": 0,
  "To Ship": 1,
  "Shipped": 2,
  "Completed": 3,
  "Canceled": 4,
  "Unpaid": 5
};

class ProductOrderView extends StatelessWidget with baseclass {
  ProductOrderView({
    Key? key,
    this.shopProduct,
    required this.orderNumber,
    required this.statusName,
    required this.statusColor,
    this.showOrderIcon = false,
    this.buttonUI,
    this.items,
    this.totalCost,
    this.itemViews,
  }) : super(key: key);
  final List<ShopProduct>? shopProduct;
  final Widget? itemViews;
  final String orderNumber;
  final String statusName;
  final Color statusColor;
  final OrderList? items;
  final Widget? totalCost;
  final Widget? buttonUI;
  final bool? showOrderIcon;
  late ShopProduct shopProductById;
  getShopProduct() {
    if (shopProduct != null) {
      shopProductById = shopProduct!
          .where((element) => ((element.id) == (items!.productId)))
          .first;
    }
  }

  @override
  Widget build(BuildContext context) {
    getShopProduct();
    return Container(
      margin: EdgeInsets.only(top: 0.h, bottom: 1.h),
      color: getColorFromHex(ColorConstants.white),
      padding: EdgeInsets.fromLTRB(2.w, 0, 2.w, 0),
      child: Column(
        children: [
          SizedBox(
            height: 1.h,
          ),
          Visibility(
            visible: showOrderIcon ?? true,
            child: Row(
              children: [
                Visibility(
                  visible: showOrderIcon ?? true,
                  child: SizedBox(
                    width: 2.w,
                  ),
                ),
                Visibility(
                  visible: showOrderIcon ?? true,
                  child: MyAssetImage(
                    imageName: 'orders.png',
                    icontint: ColorConstants.greycolor,
                    width: 6.w,
                    height: 6.w,
                  ),
                ),
                Visibility(
                  visible: showOrderIcon ?? false,
                  child: SizedBox(
                    width: 2.w,
                  ),
                ),
                CustomText(
                  text: orderNumber,
                  familytype: 2,
                  linecount: 1,
                  textcolor: getColorFromHex(ColorConstants.greycolor),
                  textsize: 16.sp,
                  // marginvalue: EdgeInsets.only(left: 10),
                  align: Alignment.center,
                ),
                const Spacer(),
                CustomText(
                  text: statusName,
                  familytype: 2,
                  linecount: 1,
                  textcolor: statusColor,
                  textsize: 16.sp,
                  align: Alignment.center,
                ),
                SizedBox(
                  width: 2.w,
                )
              ],
            ),
          ),
          Visibility(
              visible: !showOrderIcon!,
              child: Row(
                children: [
                  Visibility(
                    visible: !showOrderIcon!,
                    child: SizedBox(
                      width: 2.w,
                    ),
                  ),
                  CustomText(
                    text: "Product($orderNumber)",
                    familytype: 2,
                    linecount: 1,
                    textcolor: getColorFromHex(ColorConstants.black),
                    textsize: 16.sp,
                    // marginvalue: EdgeInsets.only(left: 10),
                    align: Alignment.center,
                  ),
                ],
              )),
          SizedBox(
            height: 1.h,
          ),
          itemViews ??
              ItemListView(
                  orderList: items ??
                      const OrderList(
                        order: [],
                        orderid: '1',
                      )),
          SizedBox(
            height: 1.h,
          ),
          Visibility(
            visible: totalCost != null,
            child: totalCost ?? const SizedBox(),
          ),
          SizedBox(
            height: 1.h,
          ),
          Visibility(
            visible: buttonUI != null || statusName.toString() == 'unpaid',
            child: buttonUI ?? const SizedBox(),
          ),
          SizedBox(height: 1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              paymentStatusInNumbers[statusName] == 3
                  ? GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => ReviewScreen()));
                      },
                      child: Container(
                        height: getH(38),
                        width: getW(100),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14.sp),
                            color: getColorFromHex(ColorConstants.white),
                            border: Border.all(
                              color: getColorFromHex(ColorConstants.green),
                            )),
                        child: Text(
                          'Review',
                          style: TextStyle(
                              color: getColorFromHex(ColorConstants.green),
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    )
                  : const SizedBox(),
              SizedBox(
                width: 3.w,
              ),
              paymentStatusInNumbers[statusName] == 3 ||
                      paymentStatusInNumbers[statusName] == 4
                  ? GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ProductDetailScreen.newInstance(
                                      shopProductById.id.toString(),
                                      shopProductById,
                                    )));
                      },
                      child: Container(
                        height: getH(38),
                        width: getW(100),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.sp),
                          color: getColorFromHex(ColorConstants.green),
                        ),
                        child: Text(
                          'Buy again',
                          style: TextStyle(
                              color: getColorFromHex(ColorConstants.white),
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
        ],
      ),
    );
  }
}
