import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:linger/cubits/shop/shop_cubit.dart';
import 'package:linger/data/model/shop_dashboard_model/shop_model.dart';
import 'package:linger/ui/shope/cubit/product_view_cubit.dart';
import 'package:linger/ui/shope/review_product_screen.dart';
import 'package:linger/ui/shope/views/cart_count_view.dart';
import 'package:linger/ui/shope/views/product_attribute_view.dart';
import 'package:linger/ui/shope/views/product_detail_view.dart';
import 'package:linger/ui/shope/views/product_view.dart';
import 'package:linger/ui/shope/views/select_all_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Basepackage/baseclass.dart';
import '../../Utils/colors.dart';
import '../../Utils/customText.dart';
import '../../Utils/progress_utility.dart';
import '../../Utils/videowidget.dart';
import '../widgets/screen_conatiner.dart';
import 'cartscreen.dart';
import 'cubit/product_detail_view_cubit.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key, required this.productId})
      : super(key: key);
  final String productId;

  static Widget newInstance(String productId, ShopProduct product) {
    return BlocProvider(
      create: (context) =>
          ProductDetailVewCubit(onProductUpdate: (v) {}, shopProduct: product)
            ..init(
              productId,
            ),
      child: ProductDetailScreen(productId: productId),
    );
  }

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen>
    with baseclass {
  final currentPageNotifier = ValueNotifier<int>(0);
  final int _currentIndex = 0;
  String url =
      "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4";
  String url1 =
      'https://img.freepik.com/free-photo/young-indian-guy-with-hands-up-dancing-white-wall-isolated_1157-47469.jpg?w=2000';
  late final ShopCubit shopCubit;
  late final ProductDetailVewCubit productDetailVewCubit;
  late final ShopProduct product;
  // late final ProductViewCubit productViewCubit;
  int currentPage = 0;

  @override
  void initState() {
    // initializeVideoPlayer();
    // productViewCubit = context.read<ProductViewCubit>();
    productDetailVewCubit = context.read<ProductDetailVewCubit>();

    shopCubit = context.read<ShopCubit>();
    shopCubit.getProductReviews(widget.productId);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<ShopCubit, ShopState>(
      builder: (context, shopState) {
        return BlocBuilder<ProductDetailVewCubit, ProductDetailViewState>(
          builder: (context, state) {
            if (!(state.loading) && state.productDetailModel != null) {
              if (state.productDetailModel!.data != null &&
                  state.productDetailModel!.data!.product != null &&
                  state.productDetailModel!.data!.product!.isNotEmpty) {
                final product = state.productDetailModel?.data?.product?.first;
                final reviews = state.productDetailModel?.data?.review;
                final torev = state.productDetailModel?.data?.totalReview;
                final torat = state.productDetailModel?.data?.totalRating;
                final relPro = state.productDetailModel?.data?.relatedProduct;

                return Scaffold(
                  body: Padding(
                    padding: EdgeInsets.only(top: gettoppadding(context)),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 45.h,
                                width: 100.w,
                                child: Stack(
                                  children: [
                                    PageView.builder(
                                      controller: PageController(
                                          initialPage: currentPage),
                                      onPageChanged: (int newIndex) {
                                        setState(() {
                                          currentPage = newIndex;
                                        });
                                      },
                                      itemCount:
                                          (product?.galleryFile!.length)! + 1,
                                      itemBuilder: (context, index) {
                                        if ((index + 1) <=
                                            (product?.galleryFile!.length)!) {
                                          String? urrl =
                                              product?.galleryFile![index];
                                          return ProductDetailMedia(
                                            mediaType: "Image",
                                            url: urrl!,
                                          );
                                        } else {
                                          return isImages(product?.video ?? '')
                                              ? ProductDetailMedia(
                                                  mediaType: "Image",
                                                  url: product?.video ?? '',
                                                )
                                              : CommonVideoWidget(
                                                  product?.video ?? '');
                                        }
                                      },
                                    ),
                                    Visibility(
                                      visible: product?.galleryFile!.isNotEmpty
                                          as bool,
                                      child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: Container(
                                          margin: EdgeInsets.only(
                                            left: 4.w,
                                            right: 4.w,
                                          ),
                                          padding: EdgeInsets.only(
                                              left: 3.w,
                                              right: 3.w,
                                              top: 0.53.h,
                                              bottom: 0.53.h),
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.black.withOpacity(0.2),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(62.sp),
                                              )),
                                          child: Text(
                                            '${currentPage + 1}/${(product?.galleryFile!.length)! + 1}',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12.sp),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            left: 4.w, right: 4.w, top: 2.h),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 4.h,
                                        // color: Colors.blue,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              padding: EdgeInsets.fromLTRB(
                                                  0.w, 1.h, 0.w, 0),
                                              icon: Icon(
                                                Icons.arrow_back_ios,
                                                color: Colors.black,
                                                size: 22.sp,
                                              ),
                                            ),
                                            const Spacer(),
                                            IconButton(
                                                padding: EdgeInsets.fromLTRB(
                                                    4.w, 1.h, 4.w, 0),
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.search,
                                                  color: Colors.black,
                                                  size: 22.sp,
                                                )),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    CupertinoPageRoute(
                                                        builder: (context) =>
                                                            const CartScreen()));
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    1.w, 1.h, 0, 0),
                                                child: CartCountButton(
                                                  count:
                                                      shopState.cart?.length ??
                                                          0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 4.w, top: 1.18.h, right: 4.w),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: '${product?.name}',
                                      familytype: 2,
                                      textcolor:
                                          getColorFromHex(ColorConstants.black),
                                      textsize: 20.sp,
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    CustomText(
                                      text: '${product?.saleprice} ₹',
                                      familytype: 1,
                                      textcolor: getColorFromHex(
                                              ColorConstants.greycolor)
                                          .withOpacity(0.6),
                                      textsize: 15.sp,
                                      decorationval: TextDecoration.lineThrough,
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    CustomText(
                                      text: '${product?.discountprice} ₹',
                                      familytype: 2,
                                      textcolor: getColorFromHex(
                                          ColorConstants.greencolor),
                                      textsize: 20.sp,
                                    ),
                                    Row(
                                      children: [
                                        RatingBar.builder(
                                          itemBuilder: (_, index) {
                                            return const Icon(
                                              Icons.star,
                                              color: Colors.orange,
                                            );
                                          },
                                          onRatingUpdate: (value) {},
                                          itemSize: 15.sp,
                                          allowHalfRating: true,
                                          glowColor: Colors.orange,
                                          itemCount: 5,
                                          initialRating:
                                              getRating(product?.rating),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        CustomText(
                                          text: getRating(product?.rating)
                                              .toString(),
                                          familytype: 1,
                                          textcolor: getColorFromHex(
                                              ColorConstants.black),
                                          textsize: 13.sp,
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  productDetailVewCubit
                                                      .likeDislikeProduct(
                                                    context,
                                                  );

                                                  // productViewCubit
                                                  //     .likeDislikeProduct(
                                                  //         context);
                                                },
                                                icon: Icon(
                                                  Icons.favorite,
                                                  size: 18.sp,
                                                  color:
                                                      state.shopProduct.isLiked
                                                          ? Colors.red
                                                          : Colors.grey,
                                                ),
                                                padding: EdgeInsets.zero,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 1.1.h,
                          ),
                          SelectAllView(
                            title: 'Select options',
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                // backgroundColor: Colors.white.withOpacity(0.8),
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20))),
                                builder: (context) {
                                  return ProductAttributeView(
                                    product: product!,
                                  );
                                },
                              );
                            },
                          ),
                          SizedBox(
                            height: 1.1.h,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 4.w, right: 4.w, top: 2.h),
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Product Description',
                                  style: theme.textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.sp,
                                    fontFamily: 'fontWeight: fontWeight',
                                  ),
                                ),
                                SizedBox(
                                  height: 1.89.h,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        product?.shortDetails ?? '',
                                        style: theme.textTheme.titleLarge
                                            ?.copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                          fontFamily: 'SF Pro Display',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.46.h,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    final bool? status =
                                        await shopCubit.addRemoveCartItem(
                                      context,
                                      productId: product?.id ?? 0,
                                    );
                                    if (status != null) {
                                      ProgressUtil.showProgress(
                                          context: context);
                                      await productDetailVewCubit
                                          .updateProductCartStatus();
                                      ProgressUtil.hideProgress();
                                    }
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(
                                      top: 1.9.h,
                                      bottom: 1.9.h,
                                    ),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(14.sp)),
                                      color: const Color.fromRGBO(
                                          13, 144, 14, 0.16),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          product?.isCart ?? false
                                              ? Icons.remove_shopping_cart
                                              : Icons.shopping_cart_outlined,
                                          color: Colors.green,
                                          size: 18.sp,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          product?.isCart ?? false
                                              ? 'Remove from Cart'
                                              : 'Add to Cart',
                                          style: theme.textTheme.titleLarge
                                              ?.copyWith(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.green,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 1.46.h,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        product?.description ?? '',
                                        style: theme.textTheme.titleLarge
                                            ?.copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                          fontFamily: 'SF Pro Display',
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 2.36.h,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 1.77.h,
                          ),
                          Center(
                            child: Container(
                              color: Colors.white,
                              padding: EdgeInsets.only(
                                  left: 4.w, right: 4.w, top: 2.h),
                              child: Column(
                                children: [
                                  ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    title: Text(
                                      'Reviews',
                                      style:
                                          theme.textTheme.titleMedium?.copyWith(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    subtitle: Row(
                                      children: [
                                        RatingBar.builder(
                                          itemBuilder: (_, index) {
                                            return const Icon(
                                              Icons.star,
                                              color: Colors.orange,
                                            );
                                          },
                                          onRatingUpdate: (value) {},
                                          itemSize: 15.sp,
                                          allowHalfRating: true,
                                          glowColor: Colors.orange,
                                          itemCount: 5,
                                          initialRating: getRating(torat),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          getRating(torat).toString(),
                                          style: theme.textTheme.titleMedium
                                              ?.copyWith(
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '(${torev ?? 0} reviews)',
                                          style:
                                              theme.textTheme.caption?.copyWith(
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment: Alignment.topRight,
                                            child: IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.arrow_forward_ios,
                                                color: Colors.green,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: List.generate(
                                      reviews!.length >= 3 ? 3 : reviews.length,
                                      (index) => Padding(
                                        padding:
                                            const EdgeInsets.only(top: 5.0),
                                        child: ListTile(
                                          leading: reviews[index].userImage !=
                                                  null
                                              ? CircleAvatar(
                                                  radius: 2.13.h,
                                                  backgroundImage: NetworkImage(
                                                      "${reviews[index].userImage}"),
                                                )
                                              : CircleAvatar(
                                                  radius: 2.13.h,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: getColorFromHex(
                                                          ColorConstants
                                                              .greybordercolor),
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                                ),
                                          contentPadding: EdgeInsets.zero,
                                          title: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8.0, bottom: 5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  allWordsCapitilize(
                                                      reviews[index].userName!),
                                                  style: theme
                                                      .textTheme.titleMedium
                                                      ?.copyWith(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14.sp,
                                                    fontFamily:
                                                        'SF Pro Display',
                                                  ),
                                                ),
                                                Text(
                                                  "${(reviews[index].productName)}",
                                                  style: theme.textTheme.caption
                                                      ?.copyWith(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14.sp,
                                                    fontFamily:
                                                        'SF Pro Display',
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          subtitle: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 5.0,
                                                  bottom: 5.0,
                                                ),
                                                child: RatingBar.builder(
                                                  itemBuilder: (_, index) {
                                                    return const Icon(
                                                      Icons.star,
                                                      color: Colors.orange,
                                                    );
                                                  },
                                                  onRatingUpdate: (value) {},
                                                  itemSize: 25,
                                                  allowHalfRating: true,
                                                  glowColor: Colors.orange,
                                                  initialRating: getRating(
                                                      reviews[index].rating),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 5.0,
                                                  bottom: 5.0,
                                                ),
                                                child: Text(
                                                  '${reviews[index].message}',
                                                  style: theme
                                                      .textTheme.titleMedium
                                                      ?.copyWith(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14.sp,
                                                    fontFamily:
                                                        'SF Pro Display',
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 5.0,
                                                  bottom: 5.0,
                                                ),
                                                child: Text(
                                                  convertdatetime(reviews[index]
                                                      .createdAt!),
                                                  style: theme.textTheme.caption
                                                      ?.copyWith(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 12.sp,
                                                    fontFamily:
                                                        'SF Pro Display',
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ).toList(),
                                  ),
                                  SizedBox(
                                    height: 1.18.h,
                                  ),
                                  Divider(
                                    height: 0.47.h,
                                  ),
                                  SizedBox(
                                    height: 1.18.h,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  ReviewProductScreen(
                                                      data: state
                                                          .productDetailModel
                                                          ?.data
                                                          ?.review)));
                                    },
                                    child: Text(
                                      'View all ($torev)',
                                      style:
                                          theme.textTheme.titleMedium?.copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15.sp,
                                        fontFamily: 'SF Pro Display',
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                            color: Colors.white,
                            padding: EdgeInsets.only(
                                left: 4.w, right: 4.w, top: 0.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 20,
                                  ),
                                  child: Text(
                                    'Related items',
                                    style:
                                        theme.textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15.sp,
                                      fontFamily: 'SF Pro Display',
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                                relPro != null
                                    ? SingleChildScrollView(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        scrollDirection: Axis.horizontal,
                                        physics: const BouncingScrollPhysics(),
                                        child: Row(
                                          children: List.generate(
                                            relPro.length,
                                            (index) => ProductView(
                                              onProductUpdate: (value) {},
                                              product: relPro[index],
                                            ),
                                          ),
                                        ),
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return const Scaffold(
                  body: Center(
                    child: Text('No content found!'),
                  ),
                );
              }
            } else {
              return const ScreenContainer(
                title: '    ',
                child: Center(child: CircularProgressIndicator()),
              );
            }
          },
        );
      },
    );
  }

  getRating(String? rating) {
    try {
      return double.parse(rating ?? '0');
    } catch (e) {
      return 0;
    }
  }
}
