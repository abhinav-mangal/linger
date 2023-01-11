import 'package:cached_network_image/cached_network_image.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:linger/cubits/shop/shop_cubit.dart';
import 'package:linger/data/model/shop_dashboard_model/category.dart';
import 'package:linger/ui/favoritescreen.dart';
import 'package:linger/ui/orders/ordersscreen.dart';
import 'package:linger/ui/paymentinfo/paymentinfoscreen.dart';
import 'package:linger/ui/shipping/shippingscreen.dart';
import 'package:linger/ui/shope/cartscreen.dart';
import 'package:linger/ui/shope/popularscreen.dart';
import 'package:linger/ui/shope/views/article_view.dart';
import 'package:linger/ui/shope/views/cart_count_view.dart';
import 'package:linger/ui/shope/views/category_view.dart';
import 'package:linger/ui/shope/views/product_title_view.dart';
import 'package:linger/ui/shope/views/product_view.dart';
import 'package:linger/ui/shope/views/search.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Basepackage/baseclass.dart';
import '../../Utils/AssetImage.dart';
import '../../Utils/CommonUtils.dart';
import '../../Utils/CustomEdits.dart';
import '../../Utils/colors.dart';
import '../../Utils/customText.dart';
import '../../data/model/shop_dashboard_model/shop_product.dart';
import '../widgets/screen_conatiner.dart';
import 'artile_list_screen.dart';
import 'categoryscreen.dart';

class MenuList {
  final String name;
  final int id;
  final String icon;
  final Widget navigatorPage;

  MenuList({
    required this.name,
    required this.id,
    required this.icon,
    required this.navigatorPage,
  });
}

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> with baseclass {
  late final ShopCubit shopCubit;

  final currentPage = ValueNotifier<int>(0);
  String radioItem1 = "English";
  List<MenuList> fList = [
    MenuList(
      id: 0,
      name: "Orders",
      icon: "orders.png",
      navigatorPage: const OrdersScreen(),
    ),
    MenuList(
      id: 1,
      name: "Favorite",
      icon: "favorite.png",
      navigatorPage: const FavoriteScreen(),
    ),
    MenuList(
      id: 2,
      name: "Shipping info",
      icon: "shipping.png",
      navigatorPage: const ShippingScreen(),
    ),
    MenuList(
      id: 3,
      name: "Payment info",
      icon: "paymentinfo.png",
      navigatorPage: const PaymentInfoScreen(),
    ),
  ];
  int langid = 0;

  @override
  void initState() {
    // TODO: implement initState
    shopCubit = context.read<ShopCubit>();
    shopCubit.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<ShopCubit, ShopState>(
      builder: (context, state) {
        if (state.loading ?? false) {
          return const ScreenContainer(
            title: '    ',
            leadingWidth: 0,
            leading: SizedBox(),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.only(top: gettoppadding(context)),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 4.w,
                        right: 4.w,
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: getH(50),
                      // color: Colors.blue,
                      child: Row(
                        children: [
                          CustomText(
                            text: "Shop",
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
                          IconButton(
                              padding: EdgeInsets.fromLTRB(4.w, 0, 2.w, 0),
                              onPressed: () {
                                CommonUtils.showCustombottomsheetdialog(
                                    context,
                                    scrollableui(),
                                    titleui(),
                                    0.4,
                                    getColorFromHex(ColorConstants.white));
                              },
                              icon: Icon(
                                Icons.menu,
                                color: Colors.black,
                                size: 22.sp,
                              ))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(4.w, 1.9.h, 4.w, 0),
                    height: 5.68.h,
                    alignment: Alignment.center,
                    child: CustomEditText(
                      fillColor: Colors.black12,
                      readOnly: true,
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchPage(product: state
                                                  .flashSaleProduct!))),
                      prefixiconwidget: MyAssetImage(
                        imageName: "ic_search.svg",
                        marginvalue: const EdgeInsets.all(10),
                        icontint: ColorConstants.grey,
                        width: 13.5,
                        height: 13.5,
                      ),
                      hint: 'Search...',
                      hinttextcolor: getColorFromHex(ColorConstants.grey),
                      hinttextsize: 17.sp,
                      familytype: 1,
                      height: 5.68.h,
                      textcolor: getColorFromHex(ColorConstants.black),
                      textsize: 17.sp,
                      textalign: TextAlign.left,
                      // onchangetext:signInCubit.onEmailInputChanged,
                      bordercolor: Colors.transparent,
                      borderradius: 42.sp,
                      borderwidth: 0,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  state.slider != null && state.slider!.isNotEmpty
                      ? Padding(
                          padding: EdgeInsets.only(
                              left: 4.w, right: 4.w, bottom: 1.42.h),
                          child: SizedBox(
                            width: 100.w,
                            height: 23.h,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Swiper(
                                // key: ,
                                autoplay: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return Image.network(
                                    state.slider![index].image ?? '',
                                    fit: BoxFit.fill,
                                  );
                                },
                                itemCount: state.slider?.length ?? 0,
                                loop: false,
                                onIndexChanged: (value) {
                                  currentPage.value = value;
                                },
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(),
                  state.slider != null && state.slider!.isNotEmpty
                      ? Align(
                          alignment: Alignment.center,
                          child: ValueListenableBuilder<int>(
                              valueListenable: currentPage,
                              builder: (context, value, child) {
                                return DotsIndicator(
                                  dotsCount: state.slider?.length ?? 0,
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
                  SizedBox(
                    height: 2.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 4.w, right: 4.w),
                    child: Text(
                      'Categories',
                      style: TextStyle(
                          fontSize: 17.sp, fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 4.w, right: 4.w),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:
                            state.category != null && state.category!.isNotEmpty
                                ? List.generate(state.category?.length ?? 0,
                                    (index) {
                                    final category = state.category![index];
                                    return Padding(
                                      padding: EdgeInsets.only(
                                        right: 4.6.w,
                                      ),
                                      child: CategoryView(
                                        title: "${category.name}",
                                        imgSrc: "${category.icon}",
                                        ontap: () {
                                          Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                  builder: (context) =>
                                                      CategoryScreen(
                                                        category: category,
                                                        sliderImage: const [
                                                          'https://img.freepik.com/free-photo/modern-bright-dressing-room-with-shelves-fashionable-hats-beautiful-pink-red-dresses-hanging-wardrobe_197531-1668.jpg?w=2000&t=st=1662398645~exp=1662399245~hmac=110722febf0f80ff36ce124baf82f9fc051e794e468fc938fd71a81fb234bb41',
                                                          'https://img.freepik.com/free-photo/modern-bright-dressing-room-with-shelves-fashionable-hats-beautiful-pink-red-dresses-hanging-wardrobe_197531-1668.jpg?w=2000&t=st=1662398645~exp=1662399245~hmac=110722febf0f80ff36ce124baf82f9fc051e794e468fc938fd71a81fb234bb41',
                                                          'https://img.freepik.com/free-photo/modern-bright-dressing-room-with-shelves-fashionable-hats-beautiful-pink-red-dresses-hanging-wardrobe_197531-1668.jpg?w=2000&t=st=1662398645~exp=1662399245~hmac=110722febf0f80ff36ce124baf82f9fc051e794e468fc938fd71a81fb234bb41',
                                                        ],
                                                        tagslistdata: const [
                                                          "All",
                                                          "Man",
                                                          "Women",
                                                          "Kid"
                                                        ],
                                                      )));
                                        },
                                      ),
                                    );
                                  })
                                : [],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 2.h,
                    ),
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(64, 72, 252, 1),
                        Color.fromRGBO(64, 184, 252, 1)
                      ],
                    )),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(4.w, 1.h, 4.w, 1.h),
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Icon(
                              Icons.trending_up,
                              color: Colors.white,
                              size: 22.sp,
                            ),
                            title: Text(
                              'Flash sale',
                              style: theme.textTheme.titleMedium?.copyWith(
                                color: Colors.white,
                                fontSize: 18.sp,
                              ),
                            ),
                            trailing: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            const PopularScreen(
                                                type: "flash_sale_product",
                                                name: "Flash sale")));
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'See all',
                                    style:
                                        theme.textTheme.titleMedium?.copyWith(
                                      color: Colors.white,
                                      fontSize: 18.sp,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 18.sp,
                                    ),
                                    color: Colors.white,
                                    padding: EdgeInsets.zero,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        state.flashSaleProduct != null &&
                                state.flashSaleProduct!.isNotEmpty
                            ? Padding(
                                padding: EdgeInsets.only(left: 4.w, right: 4.w),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  physics: const BouncingScrollPhysics(),
                                  child: Row(
                                    children: List.generate(
                                        state.flashSaleProduct?.length ?? 0,
                                        (index) => ProductView(
                                              product: state
                                                  .flashSaleProduct![index],
                                              onProductUpdate: (value) {},
                                            )),
                                  ),
                                ),
                              )
                            : const SizedBox(),
                        state.banner != null
                            ? Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.fromLTRB(4.w, 2.h, 4.w, 0),
                                height: 23.h,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  child: CachedNetworkImage(
                                    imageUrl: state.banner?.image ?? '',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              )
                            : const SizedBox(),
                        SizedBox(
                          height: 4.h,
                        )
                      ],
                    ),
                  ),
                  ProductTitleView(
                    title: 'Popular on Linger ',
                    ontap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const PopularScreen(
                                  type: "popular_product",
                                  name: 'Popular on Linger ')));
                    },
                  ),
                  state.popularProduct != null &&
                          state.popularProduct!.isNotEmpty
                      ? Padding(
                          padding: EdgeInsets.only(left: 2.w, right: 4.w),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            child: Row(
                              children: List.generate(
                                  state.popularProduct?.length ?? 0,
                                  (index) => ProductView(
                                        product: state.mostLikeProduct![index],
                                        onProductUpdate: (value) {},
                                      )),
                            ),
                          ),
                        )
                      : const SizedBox(),
                  ProductTitleView(
                    title: 'Most liked by people ',
                    ontap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const PopularScreen(
                                  type: "most_like_product",
                                  name: 'Most liked by people ')));
                    },
                  ),
                  state.mostLikeProduct != null &&
                          state.mostLikeProduct!.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            child: Row(
                              children: List.generate(
                                  state.mostLikeProduct?.length ?? 0,
                                  (index) => ProductView(
                                        product: state.mostLikeProduct![index],
                                        onProductUpdate: (value) {},
                                      )),
                            ),
                          ),
                        )
                      : const SizedBox(),
                  ProductTitleView(
                    title: 'Article ',
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => ArticleListScreen(
                                    articleList: state.article ?? [],
                                  )));
                    },
                  ),
                  state.article != null && state.article!.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            child: Row(
                              children: List.generate(
                                  state.article?.length ?? 0,
                                  (index) => ArticleView(
                                        article: state.article![index],
                                      )),
                            ),
                          ),
                        )
                      : const SizedBox(),
                  if (state.shopDashboardModel != null &&
                      state.shopDashboardModel!.data != null &&
                      state.shopDashboardModel!.data!.categoryProduct != null)
                    Column(
                      children: List.generate(
                          state.shopDashboardModel!.data!.categoryProduct
                                  ?.length ??
                              0, (index) {
                        final cate = state
                            .shopDashboardModel!.data!.categoryProduct![index];
                        return ProductsHorizontalListView(
                          title: cate.categoryName ?? '',
                          products: cate.product,
                          id: cate.id.toString(),
                          onTitleTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => CategoryScreen(
                                          category: Category(
                                            id: cate.id ?? 0,
                                            name: cate.categoryName ?? '',
                                            icon: "Crafts",
                                          ),
                                          sliderImage: const [
                                            'https://img.freepik.com/free-vector/hand-drawn-flat-design-salat-illustration_23-2149286670.jpg?w=2000',
                                            'https://img.freepik.com/free-vector/hand-drawn-flat-design-salat-illustration_23-2149286670.jpg?w=2000',
                                            'https://img.freepik.com/free-vector/hand-drawn-flat-design-salat-illustration_23-2149286670.jpg?w=2000',
                                          ],
                                          tagslistdata: const [
                                            "All",
                                            "Rehal",
                                            "Tasbeeh",
                                            "Jaenamaz",
                                            "Topi",
                                            "Lota"
                                          ],
                                        )));
                          },
                        );
                      }).toList(),
                    )
                  else
                    const SizedBox(),
                  SizedBox(
                    height: getH(100),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _onBottomSheetItemTapped(int pos) {
    switch (pos) {
      case 0:
        {
          Navigator.push(context,
              CupertinoPageRoute(builder: (context) => const OrdersScreen()));
          break;
        }
      case 1:
        {
          Navigator.push(context,
              CupertinoPageRoute(builder: (context) => const FavoriteScreen()));
          break;
        }
      case 2:
        {
          Navigator.push(context,
              CupertinoPageRoute(builder: (context) => const ShippingScreen()));
          break;
        }
      case 3:
        {
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) => const PaymentInfoScreen()));
          break;
        }
    }
  }

  Widget scrollableui() {
    return Column(
      children: fList
          .map((data) => GestureDetector(
                onTap: () {
                  _onBottomSheetItemTapped(data.id);
                },
                child: SizedBox(
                  height: 6.6.h,
                  child: ListTile(
                    leading: MyAssetImage(
                      imageName: data.icon,
                      icontint: ColorConstants.black,
                      width: 6.w,
                      height: 6.w,
                    ),
                    title: CustomText(
                      text: data.name,
                      familytype: 1,
                      linecount: 1,
                      textcolor: Colors.black,
                      textsize: 17.sp,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 17.sp,
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }

  Widget titleui() {
    return Stack(
      children: [
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
                    text: 'Menu',
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
      ],
    );
  }
}

class ProductsHorizontalListView extends StatelessWidget {
  const ProductsHorizontalListView(
      {Key? key,
      this.products,
      required this.title,
      this.onTitleTap,
      required this.id})
      : super(key: key);
  final String title;
  final String id;
  final List<ShopProduct>? products;
  final VoidCallback? onTitleTap;

  @override
  Widget build(BuildContext context) {
    return products != null && products!.isNotEmpty
        ? Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductTitleView(
                title: title,
                ontap: onTitleTap,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: List.generate(
                        products!.length ?? 0,
                        (index) => ProductView(
                              product: products![index],
                              onProductUpdate: (value) {},
                            )),
                  ),
                ),
              ),
            ],
          )
        : const SizedBox();
  }
}
