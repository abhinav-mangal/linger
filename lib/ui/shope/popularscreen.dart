import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linger/cubits/shop/shop_cubit.dart';
import 'package:linger/ui/shope/views/cart_count_view.dart';
import 'package:linger/ui/shope/views/product_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../Basepackage/baseclass.dart';
import '../../Utils/customText.dart';
import '../widgets/content_not_found_view.dart';
import '../widgets/screen_conatiner.dart';
import 'cartscreen.dart';

class PopularScreen extends StatefulWidget {
  final String type;
  final String name;
  const PopularScreen({Key? key, required this.type, required this.name})
      : super(key: key);

  @override
  State<PopularScreen> createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> with baseclass {
  late final ShopCubit shopCubit;

  @override
  void initState() {
    shopCubit = context.read<ShopCubit>();
    shopCubit.seeAll(type: widget.type);
    super.initState();
  }

  void _onSearchButtonPressed() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopCubit, ShopState>(
      builder: (context, state) {
        if (state.seeAllproducts == null) {
          return const ScreenContainer(
            title: '    ',
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state.seeAllproducts!.product!.isEmpty) {
          return const NoContentFound();
        } else {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              toolbarHeight: 8.2.h,
              leading: IconButton(
                  padding: EdgeInsets.fromLTRB(4.w, 0, 0, 0),
                  onPressed: _onSearchButtonPressed,
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 20.sp,
                  )),
              titleSpacing: 7.3.w,
              title: CustomText(
                text: widget.name,
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
                // IconButton(
                //     padding: EdgeInsets.fromLTRB(4.w, 0, 8.w, 0),
                //     onPressed: () {
                //       // CommonUtils.showCustombottomsheetdialog(context,scrollableui(),titleui());
                //     },
                //     icon: Icon(
                //       Icons.shopping_cart_outlined,
                //       color: Colors.black,
                //       size: 22.sp,
                //     )),
              ],
            ),
            body: Padding(
              padding: EdgeInsets.only(left: 4.w, right: 4.w),
              child: state.seeAllproducts != null &&
                      state.seeAllproducts!.product!.isNotEmpty
                  ? GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 24,
                          crossAxisSpacing: 16,
                          childAspectRatio: 44.w / 32.h),
                      itemCount: state.seeAllproducts!.product!.length,
                      itemBuilder: (context, index) {
                        return ProductView(
                          product: state.seeAllproducts!.product![index],
                          onProductUpdate: (value) {},
                        );
                      },
                    )
                  : const SizedBox(),
            ),
          );
        }
      },
    );
  }
}
