import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linger/cubits/shop/shop_cubit.dart';
import 'package:linger/ui/shope/views/product_view.dart';
import 'package:linger/ui/widgets/content_not_found_view.dart';
import 'package:linger/ui/widgets/screen_conatiner.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../Basepackage/baseclass.dart';
import '../Utils/customText.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> with baseclass {
  late final ShopCubit shopCubit;
  void _onSearchButtonPressed() {
    Navigator.pop(context);
  }
  @override
  void initState(){
    shopCubit= context.read<ShopCubit>();
    shopCubit.getMyFavorites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopCubit, ShopState>(
      builder: (context, state) {
        if (state.favoriteProducts == null) {
          return const ScreenContainer(
            title: '    ',
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state.favoriteProducts!.isEmpty) {
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
                text: 'Favorite',
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
            ),
            body: Padding(
              padding: EdgeInsets.only(left: 4.w, right: 4.w),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 24,
                  crossAxisSpacing: 16,
                  childAspectRatio: 44.w / 32.h,
                ),
                itemCount: state.favoriteProducts!.length,
                itemBuilder: (context, index) {
                  return ProductView(
                    product: state.favoriteProducts![index],
                    onProductUpdate: (value) {},
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }
}
