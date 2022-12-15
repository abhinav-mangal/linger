import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linger/app/app_provider.dart';
import 'package:linger/cubits/shop/shop_cubit.dart';
import 'package:linger/data/model/shop_dashboard_model/shop_model.dart';
import 'package:linger/ui/orders/order_summary_screen.dart';
import 'package:linger/ui/widgets/primary_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Basepackage/baseclass.dart';
import '../../Utils/AssetImage.dart';
import '../../Utils/colors.dart';
import '../../Utils/customText.dart';
import '../../data/model/my_cart/cart.dart';
import 'cubit/cart_view_cubit.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> with baseclass {
  Widget titleui(String title) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: SizedBox(
            height: 6.6.h,
            child: ListTile(
              leading: Icon(
                Icons.close,
                color: Colors.black,
                size: 19.sp,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 6.6.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 8,
                child: Center(
                  child: CustomText(
                    text: title,
                    familytype: 2,
                    linecount: 1,
                    textcolor: Colors.black,
                    textsize: 17.sp,
                    align: Alignment.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopCubit, ShopState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 8.2.h,
            leading: Container(
              // color: Colors.blue,
              child: IconButton(
                  padding: EdgeInsets.fromLTRB(4.2.w, 0, 0, 0),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 20.sp,
                  )),
            ),
            titleSpacing: 7.3.w,
            title: CustomText(
              text: 'Cart',
              familytype: 2,
              linecount: 1,
              textcolor: Colors.black,
              // marginvalue:  EdgeInsets.only(left: 4.w),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(state.cart?.length ?? 0, (index) {
                  final cart = state.cart![index];

                  return CartView.newInstance(
                      cart, state.seeAllproducts!.product);
                })),
          ),
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 1.h),
                padding: EdgeInsets.fromLTRB(4.w, 1.h, 4.w, 1.h),
                color: Colors.white,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'Total ',
                            familytype: 2,
                            linecount: 1,
                            textcolor: getColorFromHex(ColorConstants.black),
                            // marginvalue: EdgeInsets.fromLTRB(2.w, 0, 2.w, 0),
                            textsize: 15.sp,
                          ),
                          CustomText(
                            text: '${state.total} ₹',
                            familytype: 2,
                            linecount: 1,
                            textcolor: getColorFromHex(ColorConstants.green),
                            // marginvalue: EdgeInsets.fromLTRB(2.w, 0, 2.w, 0),
                            textsize: 18.sp,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (state.cart?.length != 0) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const OrderSummaryScreen()));
                        }
                      },
                      child: Container(
                        width: 100.w,
                        decoration: BoxDecoration(
                            color: getColorFromHex(ColorConstants.greencolor)
                                .withOpacity(0.16),
                            borderRadius: BorderRadius.circular(14.sp)),
                        height: 5.92.h,
                        margin: EdgeInsets.only(bottom: 4.73.h),
                        child: Center(
                          child: Text(
                            'Check out',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget scrollableui() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: TextFormField(
              decoration: const InputDecoration.collapsed(
                  hintText: 'Enter message for seller'),
              maxLength: 200,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(
            height: 2,
          ),
          const SizedBox(
            height: 20,
          ),
          const PrimaryButton(
            title: 'Save',
          )
        ],
      ),
    );
  }
}

class CartView extends StatefulWidget {
  const CartView({Key? key, required this.cart, this.product})
      : super(key: key);

  final Cart cart;
  final List<ShopProduct>? product;

  static Widget newInstance(Cart cart, List<ShopProduct>? product) {
    return BlocProvider<CartViewCubit>(
      create: (context) => CartViewCubit(cart),
      child: CartView(cart: cart, product: product),
    );
  }

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> with baseclass {
  late final CartViewCubit cartViewCubit;

  @override
  void initState() {
    // TODO: implement initState
    cartViewCubit = context.read<CartViewCubit>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<CartViewCubit, CartViewState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.fromLTRB(2.w, 1.4.h, 2.w, 1.4.h),
          margin: EdgeInsets.fromLTRB(4.w, 1.h, 4.w, 1.h),
          height: 17.18.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12.sp)),
            boxShadow: [
              BoxShadow(
                color: getColorFromHex(ColorConstants.shadowcolor)
                    .withOpacity(0.06),
                spreadRadius: 0,
                blurRadius: 12,
                offset: const Offset(0, 2), // changes position of shadow
              )
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 11.37.h,
                width: 11.37.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12.sp)),
                  child: CachedNetworkImage(
                    imageUrl: widget.cart.productImage ??
                        'https://img.freepik.com/free-psd/cosmetic-product-packaging-mockup_1150-40284.jpg?w=2000&t=st=1662393117~exp=1662393717~hmac=39e8c5f7400ac09523f3fa71767e618b450636ceaf8f54a0d08d0308ee5b69d1',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // SizedBox(
                    //   height: 1.4.h,
                    // ),
                    SizedBox(
                      // color: Colors.blue,
                      // width: 68.w,
                      height: 2.6.h,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(3.w, 0, 2.w, 0),
                        child: Row(
                          // mainAxisSize: MainAxisSize.min,

                          children: [
                            CustomText(
                              textalign: TextAlign.start,
                              text: widget.cart.productName ??
                                  "Men Cotton Silk Only Kurta",
                              familytype: 1,
                              textsize: 15.sp,
                              // marginvalue: EdgeInsets.only(left: 4.w,top:gettoppadding(context) ),
                              textcolor: getColorFromHex(ColorConstants.black),
                            ),
                            const Spacer(),
                            IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                cartViewCubit.onRemoveTap(
                                    context, widget.product);
                              },
                              icon: Icon(
                                Icons.close,
                                color: Colors.black,
                                size: 17.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 0.9.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: getColorFromHex(ColorConstants.greyishcolor)
                              .withOpacity(0.12),
                          borderRadius:
                              BorderRadius.all(Radius.circular(6.sp))),
                      width: 20.w,
                      height: 2.6.h,
                      margin: EdgeInsets.only(left: 3.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 13.w,
                            height: 2.13.h,
                            child: Center(
                              child: CustomText(
                                text: widget.cart.userName ?? "Green,XL",
                                familytype: 1,
                                linecount: 3,
                                textsize: 15.sp,
                                textcolor:
                                    getColorFromHex(ColorConstants.greycolor)
                                        .withOpacity(0.6),
                              ),
                            ),
                          ),
                          MyAssetImage(
                            imageName: "downarrow.png",
                            // marginvalue:  EdgeInsets.only(right: 1.92.w),
                            icontint: ColorConstants.grey,
                            width: 1.3.h,
                            height: 1.3.h,
                            customfit: BoxFit.contain,
                          ),
                          // Icon(Icons.)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2.0.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 31.w,
                          child: Column(
                            children: [
                              CustomText(
                                text: '${widget.cart.discountprice} ₹',
                                familytype: 1,
                                linecount: 2,
                                textcolor:
                                    getColorFromHex(ColorConstants.greencolor),
                                marginvalue: EdgeInsets.only(left: 3.w),
                                textsize: 16.sp,
                                align: Alignment.centerLeft,
                              ),
                              CustomText(
                                text: '${widget.cart.saleprice} ₹',
                                familytype: 1,
                                linecount: 2,
                                textcolor:
                                    getColorFromHex(ColorConstants.greycolor),
                                marginvalue: EdgeInsets.only(left: 3.w),
                                textsize: 13.sp,
                                decorationval: TextDecoration.lineThrough,
                                align: Alignment.topLeft,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            cartViewCubit.onDecreaseTap(context);
                          },
                          child: Container(
                            height: 3.3.h,
                            width: 3.3.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.sp),
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: const Color.fromRGBO(208, 208, 208, 1),
                                  width: 1,
                                )),
                            child: Center(
                              child: Icon(
                                Icons.remove,
                                color: Colors.green,
                                size: 15.sp,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 4.2.w,
                            right: 4.2.w,
                          ),
                          child: Text(
                            '${widget.cart.quantity}',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'SF Pro Display',
                              color: Colors.black,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            cartViewCubit.onIncreaseTap(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 3.3.h,
                              width: 3.3.h,
                              margin: EdgeInsets.fromLTRB(0, 0, 2.w, 0),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.sp),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                    color:
                                        const Color.fromRGBO(208, 208, 208, 1),
                                    width: 1,
                                  )),
                              child: Center(
                                child: Icon(
                                  Icons.add,
                                  color: Colors.green,
                                  size: 15.sp,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
