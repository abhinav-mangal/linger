import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linger/cubits/shop/shop_cubit.dart';
import 'package:linger/ui/shope/cubit/article_detail_view_cubit.dart';
import 'package:linger/ui/shope/product_detail_screen.dart';
import 'package:linger/ui/shope/views/cart_count_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Basepackage/baseclass.dart';
import '../../Utils/colors.dart';
import '../../Utils/customText.dart';
import '../../data/model/shop_dashboard_model/article.dart';
import '../../data/model/shop_dashboard_model/shop_product.dart';
import '../../locator.dart';
import '../../router/app_routes.gr.dart';
import '../widgets/content_not_found_view.dart';
import '../widgets/screen_conatiner.dart';
import 'cartscreen.dart';

class ArticleDescriptionScreen extends StatefulWidget {
  const ArticleDescriptionScreen({Key? key, required this.productId})
      : super(key: key);
  final String productId;
  @override
  State<ArticleDescriptionScreen> createState() =>
      ArticleDescriptionScreenState();
}

class ArticleDescriptionScreenState extends State<ArticleDescriptionScreen>
    with baseclass {
  late final ArticleViewCubit articleViewCubit;
  Future<ShopProduct> getProductData(Article article) async {
    Map<String, dynamic> json = {
      "id": article.id!,
      "image": article.articleimage!,
      "name": article.title!,
      "short_details": article.subtitle!,
      "saleprice": article.price!,
      "description": article.description!
    };
    ShopProduct product = ShopProduct.fromJson(json);
    return product;
  }

  @override
  void initState() {
    // TODO: implement initState
    articleViewCubit = context.read<ArticleViewCubit>();
    articleViewCubit.getArticleDetail(widget.productId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<ArticleViewCubit, ArticleViewState>(
      builder: (context, state) {
        if (state.shopDashboardModel?.data == null) {
          return const ScreenContainer(
            title: '    ',
            child: Center(child: CircularProgressIndicator()),
          );
        } else {
          final article = state.shopDashboardModel?.data?.article![0];
          return Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: EdgeInsets.only(top: gettoppadding(context)),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Container(
                  margin: EdgeInsets.only(
                    left: 2.w,
                    right: 2.w,
                  ),
                  child: Column(children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        // margin: EdgeInsets.only(
                        //   left: 4.w,
                        //   right: 4.w,
                        // ),
                        width: MediaQuery.of(context).size.width,
                        height: getH(50),
                        // color: Colors.blue,
                        child: Row(
                          children: [
                            IconButton(
                                padding: EdgeInsets.fromLTRB(0.w, 0, 0, 0),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.black,
                                  size: 20.sp,
                                )),
                            CustomText(
                              text: "Article",
                              familytype: 6,
                              textsize: 20.sp,
                              textcolor: getColorFromHex(ColorConstants.black),
                              textalign: TextAlign.left,
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            const CartScreen()));
                              },
                              child: CartCountButton(
                                count: state.cart?.length ?? 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 38.h,
                      width: double.infinity,
                      child: CachedNetworkImage(
                        imageUrl: article?.articleimage ?? '',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 1.89.h, horizontal: 4.1.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            article?.title ?? '',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontFamily: 'SF Pro Display',
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 2.36.h,
                          ),
                          Text(
                            article?.description ?? '',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontFamily: 'SF Pro Display',
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
            ),
            bottomNavigationBar: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(
                      left: 4.w,
                      right: 4.w,
                    ),
                    padding: EdgeInsets.fromLTRB(4.w, 0.7.h, 4.w, 0.7.h),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(10.sp)),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 6.6.h,
                            width: 6.6.h,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: CachedNetworkImage(
                                imageUrl: article?.articleimage ?? '',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(left: 2.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  article?.title ?? '',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  '${article?.price}.00 ₹',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: GestureDetector(
                            onTap: () async {
                              // ShopProduct product =
                              //     await getProductData(article!);
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (_) =>
                              //             ProductDetailScreen.newInstance(
                              //                 article!.id!.toString(),
                              //                 product)));
                            },
                            child: Container(
                              alignment: Alignment.topRight,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Buy now',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.55.h,
                )
              ],
            ),
          );
          // return ScreenContainer(
          //   title: 'Article',
          //   actions: [
          //     GestureDetector(
          //       onTap: () {
          //         Navigator.push(context, CupertinoPageRoute(builder: (context) => const CartScreen()));
          //       },
          //       child: CartCountButton(
          //         count: state.cart?.length ?? 0,
          //       ),
          //     ),
          //   ],
          //   appBarElevation: 1,
          //   bottomSheet: Column(
          //     mainAxisSize: MainAxisSize.min,
          //     children: [
          //       Align(
          //         alignment: Alignment.bottomCenter,
          //         child: Container(
          //           alignment: Alignment.bottomCenter,
          //           margin: EdgeInsets.only(
          //             left: 4.w,
          //             right: 4.w,
          //           ),
          //           padding: EdgeInsets.fromLTRB(2.w, 0.7.h, 2.w, 0.7.h),
          //           decoration: BoxDecoration(
          //             color: Colors.green,
          //             borderRadius: BorderRadius.all(Radius.circular(10.sp)),
          //           ),
          //           child: Row(
          //             children: [
          //               Expanded(
          //                 flex: 1,
          //                 child: Container(
          //                   height: 6.6.h,
          //                   width: 6.6.h,
          //                   decoration: const BoxDecoration(
          //                     borderRadius: BorderRadius.all(Radius.circular(8)),
          //                   ),
          //                   child: ClipRRect(
          //                     borderRadius: BorderRadius.circular(20.0),
          //                     child: CachedNetworkImage(
          //                       imageUrl:article?.articleimage??'',
          //                       fit: BoxFit.contain,
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //               Expanded(
          //                 flex: 5,
          //                 child: Container(
          //                   alignment: Alignment.centerLeft,
          //                   margin: EdgeInsets.only(left: 2.w),
          //                   child: Column(
          //                     mainAxisAlignment: MainAxisAlignment.start,
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       Text(
          //                         article?.title??'',
          //                         style: TextStyle(color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.w600),
          //                       ),
          //                       Text(
          //                         '${article?.price}.00 ₹',
          //                         style: TextStyle(color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.w600),
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //               ),
          //               Expanded(
          //                 flex: 3,
          //                 child: GestureDetector(
          //                   onTap: (){
          //
          //                   },
          //                   child: Container(
          //                     alignment: Alignment.topRight,
          //                     child: Row(
          //                       mainAxisSize: MainAxisSize.min,
          //                       children: [
          //                         Text(
          //                           'Buy now',
          //                           style: TextStyle(color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.w600),
          //                         ),
          //                         const SizedBox(
          //                           width: 10,
          //                         ),
          //                         const Icon(
          //                           Icons.arrow_forward_ios_outlined,
          //                           color: Colors.white,
          //                         )
          //                       ],
          //                     ),
          //                   ),
          //                 ),
          //               )
          //             ],
          //           ),
          //         ),
          //       ),
          //       SizedBox(
          //         height: 3.55.h,
          //       )
          //     ],
          //   ),
          //   child: SingleChildScrollView(
          //     physics: const BouncingScrollPhysics(),
          //     child: Column(children: [
          //       SizedBox(
          //         height: 38.h,
          //         width: double.infinity,
          //         child: CachedNetworkImage(
          //           imageUrl:article?.articleimage??'',
          //           fit: BoxFit.fitWidth,
          //         ),
          //       ),
          //       Padding(
          //         padding: EdgeInsets.symmetric(vertical: 1.89.h, horizontal: 4.1.w),
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.start,
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Text(
          //               article?.title??'',
          //               style: theme.textTheme.titleMedium?.copyWith(
          //                 fontFamily: 'SF Pro Display',
          //                 fontSize: 20.sp,
          //                 fontWeight: FontWeight.w500,
          //               ),
          //             ),
          //             SizedBox(
          //               height: 2.36.h,
          //             ),
          //             Text(
          //               article?.description??'',
          //               style: theme.textTheme.titleMedium?.copyWith(
          //                 fontFamily: 'SF Pro Display',
          //                 fontSize: 15.sp,
          //                 fontWeight: FontWeight.w400,
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ]),
          //   ),
          // );
        }
      },
    );
  }
}
