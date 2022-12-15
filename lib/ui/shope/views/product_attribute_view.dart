import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linger/cubits/shop/shop_cubit.dart';
import 'package:linger/data/model/shop_dashboard_model/shop_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Basepackage/baseclass.dart';
import '../../../Utils/colors.dart';
import '../../../Utils/customText.dart';
import '../../widgets/my_outline_button.dart';
import '../../widgets/primary_button.dart';

class ProductAttributeView extends StatelessWidget with baseclass {
  const ProductAttributeView({Key? key, required this.product}) : super(key: key);

  final ShopProduct product;

  @override
  Widget build(BuildContext context) {
    final sizes = [
      'S',
      'M',
      'SM',
      'L',
      'XL',
      '2XL',
      '3XL',
    ];
    final theme = Theme.of(context);

    return FractionallySizedBox(
      heightFactor: 0.64,
      child: Container(
        // height: 64.h,
        padding: EdgeInsets.symmetric(
          vertical: 1.77.h,
          horizontal: 3.8.w,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30.sp), topRight: Radius.circular(30.sp)),
          color: getColorFromHex(ColorConstants.white).withOpacity(0.8),
        ),

        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 13.h,
                child: Stack(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(14.sp)),
                          child: Image.network(
                            '${product.image}',
                            height: 11.84.h,
                            width: 11.84.h,
                          ),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: '${product.discountprice} ₹',
                              familytype: 2,
                              textcolor: getColorFromHex(ColorConstants.greencolor),
                              textsize: 20.sp,
                            ),
                            SizedBox(
                              height: 1.18.h,
                            ),
                            CustomText(
                              text: '${product.saleprice} ₹',
                              familytype: 1,
                              textcolor: getColorFromHex(ColorConstants.greycolor).withOpacity(0.6),
                              textsize: 15.sp,
                              decorationval: TextDecoration.lineThrough,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          iconSize: 20.sp,
                          icon: Icon(
                            Icons.close,
                            color: theme.textTheme.caption?.color,
                          )),
                    )
                  ],
                ),
              ),
              Divider(
                height: 0.2.h,
              ),
              SizedBox(
                height: 2.96.h,
              ),
              CustomText(
                text: 'Colors',
                familytype: 1,
                textcolor: getColorFromHex(ColorConstants.black),
                textsize: 15.sp,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: List.generate(
                    10,
                    (index) => Container(
                      padding: EdgeInsets.fromLTRB(1.53.w, 0.71.h, 1.53.w, 0.71.h),
                      margin: EdgeInsets.fromLTRB(0.w, 1.4.h, 3.w, 1.4.h),
                      height: 4.2.h,
                      decoration: BoxDecoration(
                        color: index == 0 ? Colors.white : const Color.fromRGBO(120, 120, 128, 0.16),
                        borderRadius: const BorderRadius.all(Radius.circular(6)),
                        border: Border.all(
                            color: index == 0
                                ? getColorFromHex(ColorConstants.greencolor)
                                : getColorFromHex(ColorConstants.greybordercolor).withOpacity(0.16),
                            width: index == 0 ? 2.0 : 0.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 2.8.h,
                            width: 2.8.h,
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(6.sp)),
                              child: Image.network('${product.image}'),
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            'Green',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'SF Pro Display',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ).toList(),
                ),
              ),
              SizedBox(
                height: 1.4.h,
              ),
              Text(
                'Sizes',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'SF Pro Display',
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                    children: List.generate(
                        sizes.length,
                        (index) => Container(
                              margin: EdgeInsets.only(right: 2.56.w, top: 1.4.h),
                              height: 5.2.h,
                              width: 5.2.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                    color: index == 4 ? Colors.green : const Color.fromRGBO(208, 208, 208, 1),
                                    width: 1,
                                  )),
                              child: Text(
                                sizes[index],
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'SF Pro Display',
                                  color: index == 4 ? Colors.green : Colors.black,
                                ),
                              ),
                            )).toList()),
              ),
              SizedBox(
                height: 2.8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Quantity',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'SF Pro Display',
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 2.56.w,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 2.56.w,
                          ),
                          height: 5.2.h,
                          width: 5.2.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: getColorFromHex(ColorConstants.bordergreycolor),
                                width: 1,
                              )),
                          child: Icon(
                            Icons.remove,
                            color: getColorFromHex(ColorConstants.greycolor).withOpacity(0.6),
                            size: 20.sp,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 2.56.w,
                          ),
                          child: Text(
                            '1',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'SF Pro Display',
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 2.56.w,
                          ),
                          height: 5.2.h,
                          width: 5.2.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: const Color.fromRGBO(208, 208, 208, 1),
                                width: 1,
                              )),
                          child: Icon(
                            Icons.add,
                            color: getColorFromHex(ColorConstants.greencolor),
                            size: 20.sp,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 7.58.h,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: MyOutlineButton(
                      title: 'Add to cart',
                      onTap: () {
                        context.read<ShopCubit>().addRemoveCartItem(context, productId: product.id ?? 0);
                      },
                    ),
                  ),
                  SizedBox(
                    width: 3.h,
                  ),
                  const Expanded(
                    flex: 1,
                    child: PrimaryButton(
                      title: 'Buy Now',
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
