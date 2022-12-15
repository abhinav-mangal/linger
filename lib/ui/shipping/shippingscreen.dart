import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linger/ui/shipping/editShippingAddress.dart';
import 'package:linger/ui/shipping/shippingaddress.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../Basepackage/baseclass.dart';
import '../../Utils/colors.dart';
import '../../Utils/customText.dart';
import '../../cubits/shop/shop_cubit.dart';

class ShippingScreen extends StatefulWidget {
  const ShippingScreen({Key? key}) : super(key: key);

  @override
  State<ShippingScreen> createState() => _ShippingScreenState();
}

class _ShippingScreenState extends State<ShippingScreen> with baseclass {
  void _onSearchButtonPressed() {
    Navigator.pop(context);
  }

  late final ShopCubit shopCubit;
  @override
  void initState() {
    shopCubit = context.read<ShopCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<ShopCubit, ShopState>(
      builder: (context, state) {
        if (state.loading ?? false || state.myOrderAddress == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          final address = state.myOrderAddress?.data ?? [];
          print(state.myOrderAddress?.toJson());
          return Scaffold(
            backgroundColor:
                getColorFromHex(ColorConstants.greyBackgroundScreen),
            appBar: AppBar(
              toolbarHeight: 8.2.h,
              leading: IconButton(
                  padding: EdgeInsets.fromLTRB(4.6.w, 0, 0, 0),
                  onPressed: _onSearchButtonPressed,
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 20.sp,
                  )),
              titleSpacing: 7.3.w,
              title: CustomText(
                text: 'Shipping Info',
                familytype: 2,
                linecount: 1,
                textcolor: Colors.black,
                textsize: 20.sp,
                align: Alignment.centerLeft,
              ),
              elevation: 0,
              backgroundColor: Colors.white,
              leadingWidth: 8.2.w,
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) =>
                                  const ShippingAddressScreen()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: getColorFromHex(
                                ColorConstants.buttonBackgroundColorsGray)
                            .withOpacity(0.08),
                        borderRadius: BorderRadius.all(Radius.circular(12.sp)),
                      ),
                      height: 5.6.h,
                      margin: EdgeInsets.only(
                          left: 4.6.w, right: 4.6.w, top: 2.8.h, bottom: 2.8.h),
                      child: Row(
                        children: [
                          SizedBox(width: 2.w),
                          Icon(
                            Icons.add_circle,
                            color:
                                getColorFromHex(ColorConstants.systembluecolor),
                            size: 20.sp,
                          ),
                          CustomText(
                            text: 'Add address',
                            familytype: 1,
                            linecount: 1,
                            marginvalue: EdgeInsets.only(left: 2.w, right: 2.w),
                            textcolor: Colors.black,
                            textsize: 17.sp,
                            align: Alignment.center,
                          ),
                          const Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: getColorFromHex(ColorConstants.black),
                            size: 20.sp,
                          ),
                          SizedBox(width: 2.w),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: List.generate(
                      address.length,
                      (index) => Container(
                        // height: 19.7.h,
                        // height: getHeight(context)*0.2,
                        margin: EdgeInsets.only(
                          left: 4.6.w,
                          right: 4.6.w,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.sp)),
                        ),
                        padding: EdgeInsets.fromLTRB(4.w, 1.4.h, 4.w, 1.4.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CustomText(
                                  text: address[index].name!,
                                  familytype: 2,
                                  linecount: 1,
                                  textcolor: Colors.black,
                                  textsize: 17.sp,
                                  align: Alignment.center,
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                EditShippingAddressScreen(
                                                  name: address[index].name!,
                                                  address:
                                                      address[index].address!,
                                                  mobileNo: address[index]
                                                      .mobileNumber!,
                                                  postalCode:
                                                      address[index].postcode!,
                                                  country:
                                                      address[index].country!,
                                                  state: address[index].state!,
                                                  city: address[index].city!,
                                                  id: address[index].id!,
                                                )));
                                  },
                                  child: CustomText(
                                    text: 'Edit',
                                    familytype: 2,
                                    linecount: 1,
                                    textcolor: getColorFromHex(
                                        ColorConstants.greencolor),
                                    textsize: 17.sp,
                                    align: Alignment.center,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                CustomText(
                                  text: '(+91) ${address[index].mobileNumber}',
                                  familytype: 1,
                                  linecount: 1,
                                  textcolor:
                                      getColorFromHex(ColorConstants.greycolor)
                                          .withOpacity(0.6),
                                  textsize: 15.sp,
                                  marginvalue:
                                      const EdgeInsets.only(top: 8, bottom: 4),
                                  align: Alignment.centerLeft,
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    shopCubit.deleteMyOrderAddress(context,
                                        id: address[index].id);
                                  },
                                  child: CustomText(
                                    text: 'Remove',
                                    familytype: 2,
                                    linecount: 1,
                                    textcolor: getColorFromHex(
                                        ColorConstants.redcolor),
                                    textsize: 17.sp,
                                    align: Alignment.center,
                                  ),
                                ),
                              ],
                            ),
                            CustomText(
                              text: '${address[index].address}',
                              familytype: 1,
                              linecount: 2,
                              textcolor:
                                  getColorFromHex(ColorConstants.greycolor)
                                      .withOpacity(0.6),
                              textsize: 15.sp,
                              // marginvalue: const EdgeInsets.only(top:8,bottom: 8),
                              align: Alignment.centerLeft,
                            ),
                            CustomText(
                              text:
                                  '${address[index].state}, ${address[index].country}',
                              familytype: 1,
                              linecount: 1,
                              textcolor:
                                  getColorFromHex(ColorConstants.greycolor)
                                      .withOpacity(0.6),
                              textsize: 15.sp,
                              marginvalue:
                                  const EdgeInsets.only(top: 4, bottom: 4),
                              align: Alignment.centerLeft,
                            ),
                            CustomText(
                              text: '${address[index].postcode}',
                              familytype: 1,
                              linecount: 1,
                              textcolor:
                                  getColorFromHex(ColorConstants.greycolor)
                                      .withOpacity(0.6),
                              textsize: 15.sp,
                              align: Alignment.centerLeft,
                            ),
                          ],
                        ),
                      ),
                    ).toList(),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
