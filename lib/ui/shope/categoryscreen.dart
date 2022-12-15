import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:linger/cubits/shop/shop_cubit.dart';
import 'package:linger/data/model/shop_dashboard_model/category.dart';
import 'package:linger/ui/shope/views/cart_count_view.dart';
import 'package:linger/ui/shope/views/product_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../Basepackage/baseclass.dart';
import '../../Utils/colors.dart';
import '../../Utils/customText.dart';
import '../widgets/content_not_found_view.dart';
import '../widgets/screen_conatiner.dart';
import 'cartscreen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen(
      {Key? key, this.tagslistdata, this.sliderImage, required this.category})
      : super(key: key);

  final List<String>? tagslistdata;
  final List<String>? sliderImage;
  final Category category;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> with baseclass {
  late final ShopCubit shopCubit;
  final currentPage = ValueNotifier<int>(0);
  @override
  void initState() {
    // TODO: implement initState
    shopCubit = context.read<ShopCubit>();
    shopCubit.onCategoryTap(
      -1,
      context,
      categoryId: widget.category.id.toString() ?? '',
      subCategoryId: '',
    );

    // shopCubit.addSubCategories();

    super.initState();
  }

  void _onSearchButtonPressed() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopCubit, ShopState>(
      builder: (context, state) {
        if (state.categoriesProducts == null) {
          return const ScreenContainer(
            title: '    ',
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state.products != null && state.products!.isEmpty) {
          return const NoContentFound();
        } else {
          return Padding(
            padding: EdgeInsets.only(bottom: getbottompadding(context)),
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                toolbarHeight: getH(50),
                leading: IconButton(
                    padding: EdgeInsets.fromLTRB(4.1.w, 0, 0, 0),
                    onPressed: _onSearchButtonPressed,
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 20.sp,
                    )),
                titleSpacing: 7.3.w,
                title: CustomText(
                  text: widget.category.name!,
                  familytype: 2,
                  linecount: 1,
                  textcolor: Colors.black,
                  // marginvalue: EdgeInsets.only(left: 6.w),
                  textsize: 20.sp,
                  align: Alignment.centerLeft,
                ),
                elevation: 0,
                backgroundColor: Colors.white,
                leadingWidth: 8.2.w,
                actions: [
                  IconButton(
                      padding: EdgeInsets.fromLTRB(4.w, 0, 4.w, 0),
                      onPressed: () {},
                      icon: Icon(
                        Icons.search_outlined,
                        color: Colors.black,
                        size: 22.sp,
                      )),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const CartScreen()));
                    },
                    child: CartCountButtonOnAppBar(
                      count: state.cart?.length ?? 0,
                    ),
                  ),
                ],
              ),
              body: Padding(
                padding: EdgeInsets.only(left: 4.w, right: 4.w),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  shopCubit.onCategoryTap(
                                    -1,
                                    context,
                                    categoryId:
                                        widget.category.id.toString() ?? '',
                                    subCategoryId: '',
                                  );
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(32.sp)),
                                  color: state.currentCategoryIndex == -1
                                      ? getColorFromHex(
                                          ColorConstants.systembluecolor)
                                      : getColorFromHex(ColorConstants.white),
                                  child: Container(
                                    height: 4.h,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(32.sp),
                                        border: Border.all(
                                            color: state.currentCategoryIndex ==
                                                    -1
                                                ? getColorFromHex(ColorConstants
                                                    .systembluecolor)
                                                : getColorFromHex(ColorConstants
                                                        .greycolor)
                                                    .withOpacity(0.3)
                                                    .withOpacity(0.7),
                                            width: 1)),
                                    // width: getWidth(context),
                                    child: Center(
                                      child: Container(
                                        margin: EdgeInsets.fromLTRB(
                                            2.56.w, 0, 2.56.w, 0),
                                        child: CustomText(
                                          text: 'All',
                                          familytype: 1,
                                          textcolor:
                                              state.currentCategoryIndex == -1
                                                  ? getColorFromHex(
                                                      ColorConstants.white)
                                                  : getColorFromHex(
                                                          ColorConstants.black)
                                                      .withOpacity(0.7),
                                          textsize: 15.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 4.h,
                                margin: EdgeInsets.only(
                                  top: 2.h,
                                  bottom: 2.36.h,
                                ),
                                // width: double.infinity,
                                child: ListView.separated(
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return const SizedBox(width: 10);
                                    },
                                    scrollDirection: Axis.horizontal,
                                    itemCount: state.categoriesProducts!.data!
                                                .subcategorie !=
                                            null
                                        ? state.categoriesProducts!.data!
                                            .subcategorie!.length
                                        : 0,
                                    physics: const ClampingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () async {
                                          shopCubit.onCategoryTap(
                                            index,
                                            context,
                                            categoryId:
                                                widget.category.id.toString() ??
                                                    '',
                                            subCategoryId: state
                                                    .categoriesProducts!
                                                    .data!
                                                    .subcategorie![index]
                                                    .id
                                                    .toString() ??
                                                '',
                                          );
                                        },
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(32.sp)),
                                          color: state.currentCategoryIndex ==
                                                  index
                                              ? getColorFromHex(ColorConstants
                                                  .systembluecolor)
                                              : getColorFromHex(
                                                  ColorConstants.white),
                                          child: Container(
                                            height: 4.h,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        32.sp),
                                                border: Border.all(
                                                    color: state.currentCategoryIndex ==
                                                            index
                                                        ? getColorFromHex(
                                                            ColorConstants
                                                                .systembluecolor)
                                                        : getColorFromHex(
                                                                ColorConstants
                                                                    .greycolor)
                                                            .withOpacity(0.3)
                                                            .withOpacity(0.7),
                                                    width: 1)),
                                            // width: getWidth(context),
                                            child: Center(
                                              child: Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    2.56.w, 0, 2.56.w, 0),
                                                child: CustomText(
                                                  text: state
                                                          .categoriesProducts!
                                                          .data!
                                                          .subcategorie![index]
                                                          .name ??
                                                      '',
                                                  familytype: 1,
                                                  textcolor:
                                                      state.currentCategoryIndex ==
                                                              index
                                                          ? getColorFromHex(
                                                              ColorConstants
                                                                  .white)
                                                          : getColorFromHex(
                                                                  ColorConstants
                                                                      .black)
                                                              .withOpacity(0.7),
                                                  textsize: 15.sp,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Stack(
                        children: [
                          state.categoriesProducts!.data!.sliders != null &&
                                  state.categoriesProducts!.data!.sliders!
                                      .isNotEmpty
                              ? Container(
                                  margin: EdgeInsets.only(top: 1.42.h),
                                  width: 100.w,
                                  height: 23.h,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(14.sp),
                                    child: Swiper(
                                      autoplay: true,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Image.network(
                                          state.categoriesProducts!.data!
                                                  .sliders![index].image ??
                                              '',
                                          fit: BoxFit.fill,
                                        );
                                      },
                                      itemCount: state.categoriesProducts!.data!
                                          .sliders!.length,
                                      loop: false,
                                      onIndexChanged: (value) {
                                        currentPage.value = value;
                                      },
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                          Container(
                            margin: EdgeInsets.only(top: 1.42.h),
                            width: 100.w,
                            height: 23.h,
                            child: Center(
                              child: CustomText(
                                textalign: TextAlign.center,
                                text: '',
                                familytype: 3,
                                textsize: 28.sp,
                                textcolor:
                                    getColorFromHex(ColorConstants.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      state.slider != null && state.slider!.isNotEmpty
                          ? Align(
                              alignment: Alignment.center,
                              child: ValueListenableBuilder<int>(
                                  valueListenable: currentPage,
                                  builder: (context, value, child) {
                                    return DotsIndicator(
                                      dotsCount: state.categoriesProducts!.data!
                                              .sliders!?.length ??
                                          0,
                                      position: value.toDouble(),
                                      decorator: DotsDecorator(
                                        size: Size.square(13.sp),
                                        activeSize: Size(27.sp, 13.sp),
                                        activeShape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            10.sp,
                                          ),
                                        ),
                                        activeColor: Colors.green,
                                      ),
                                    );
                                  }),
                            )
                          : const SizedBox(),
                      state.products != null && state.products!.isNotEmpty
                          ? Container(
                              margin: EdgeInsets.only(top: 3.55.h),
                              child: GridView.builder(
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 24,
                                        crossAxisSpacing: 16,
                                        childAspectRatio: 44.w / 32.h),
                                itemCount: state.products!.length,
                                itemBuilder: (context, index) {
                                  return ProductView(
                                    product: state.products![index],
                                    onProductUpdate: (value) {},
                                  );
                                },
                                physics: const NeverScrollableScrollPhysics(),
                              ),
                            )
                          : const SizedBox()
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
