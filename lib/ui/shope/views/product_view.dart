import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linger/cubits/shop/shop_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Basepackage/baseclass.dart';
import '../../../Utils/CommonUtils.dart';
import '../../../Utils/colors.dart';
import '../../../Utils/customText.dart';
import '../../../data/model/shop_dashboard_model/shop_product.dart';
import '../cubit/product_view_cubit.dart';
import '../product_detail_screen.dart';

class ProductView extends StatelessWidget {
  const ProductView({
    Key? key,
    required this.product,
    required this.onProductUpdate,
  }) : super(key: key);

  final ShopProduct product;
  final Function(ShopProduct product) onProductUpdate;

  @override
  Widget build(BuildContext context) {
    return MyProductView.newInstance(product, onProductUpdate);
  }
}

class MyProductView extends StatefulWidget {
  const MyProductView({
    Key? key,
    required this.product,
    required this.onProductUpdate,
  }) : super(key: key);

  final ShopProduct product;
  final Function(ShopProduct product) onProductUpdate;

  static Widget newInstance(ShopProduct product, Function(ShopProduct product) onProductUpdate) {
    return BlocProvider(
      create: (_) => ProductViewCubit(
        product: product,
        onProductUpdate: onProductUpdate,
      )..init(),
      child: MyProductView(
        product: product,
        onProductUpdate: onProductUpdate,
      ),
    );
  }

  @override
  State<MyProductView> createState() => _MyProductViewState();
}

class _MyProductViewState extends State<MyProductView> with baseclass {
  late final ProductViewCubit productViewCubit;

  @override
  void initState() {
    // TODO: implement initState
    productViewCubit = context.read<ProductViewCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<ProductViewCubit, ProductViewState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => ProductDetailScreen.newInstance(
                          widget.product.id?.toString() ?? '',
                          widget.product,
                        )));
          },
          child: Container(
            margin: EdgeInsets.only(right: 2.5.w),
            height: 32.h,
            width: 44.w,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(14.sp)),
                border: Border.all(color: getColorFromHex(ColorConstants.bordercolor))),
            child: Padding(
              padding: EdgeInsets.all(2.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(14.sp)),
                        child: CachedNetworkImage(
                          height: 17.5.h,
                          width: 41.w,
                          imageUrl: widget.product != null
                              ? widget.product?.image ?? ''
                              : 'https://img.freepik.com/free-psd/cosmetic-product-packaging-mockup_1150-40284.jpg?w=2000&t=st=1662393117~exp=1662393717~hmac=39e8c5f7400ac09523f3fa71767e618b450636ceaf8f54a0d08d0308ee5b69d1',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        width: 41.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                productViewCubit.likeDislikeProduct(context);
                              },
                              child: Container(
                                  margin: EdgeInsets.fromLTRB(2.w, 1.h, 2.w, 0),
                                  child: Icon(
                                   state.isLiked ==
                                        true
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: state.isLiked ==
                                        true?Colors.red:Colors.grey,
                                    size: 20.sp,
                                  ),),
                            ),
                            Container(
                              width: 15.w,
                              height: 3.08.h,
                              margin: EdgeInsets.fromLTRB(2.w, 0, 2.w, 0),
                              decoration: BoxDecoration(
                                  color: CommonUtils.getColorFromHex(ColorConstants.greencolor),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(14.sp),
                                    bottomLeft: Radius.circular(14.sp),
                                  )),
                              child: Center(
                                child: Text(
                                  widget.product?.discountprice != null
                                      ? "${getdiscountprice(double.parse(widget.product.saleprice as String),double.parse(widget.product.discountprice as String))}% Off" ?? ''
                                      : '50% Off',
                                  style: theme.textTheme.titleSmall?.copyWith(
                                    color: Colors.white,
                                    fontSize: 11.sp,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  CustomText(
                    text: widget.product != null ? widget.product?.name ?? '' : 'Door Athkar Bell',
                    familytype: 2,
                    linecount: 2,
                    textcolor: Colors.black,
                    // marginvalue: EdgeInsets.only(left: 2.w),
                    textsize: 16.sp,
                    align: Alignment.centerLeft,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomText(
                    text: '${widget.product != null ? widget.product?.saleprice : '1.523,68'} ₹',
                    familytype: 1,
                    linecount: 2,
                    textcolor: getColorFromHex(ColorConstants.greycolor),
                    // marginvalue: EdgeInsets.only(left: 2.w),
                    textsize: 14.sp,
                    decorationval: TextDecoration.lineThrough,
                    align: Alignment.topLeft,
                  ),
                  CustomText(
                    text: '${widget.product != null ? widget.product?.discountprice : '1.523,68'} ₹',
                    familytype: 1,
                    linecount: 2,
                    textcolor: getColorFromHex(ColorConstants.greencolor),
                    // marginvalue: EdgeInsets.only(left: 2.w),
                    textsize: 16.sp,
                    align: Alignment.centerLeft,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
