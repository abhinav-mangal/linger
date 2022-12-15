import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linger/Utils/colors.dart';
import 'package:linger/Utils/customText.dart';
import 'package:linger/locator.dart';
import 'package:linger/router/app_routes.gr.dart';
import 'package:linger/ui/orders/view/product_order_view.dart';
import 'package:linger/ui/widgets/screen_conatiner.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:linger/Basepackage/baseclass.dart';
import '../../cubits/shop/shop_cubit.dart';

typedef RatingChangeCallback = void Function(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback onRatingChanged;
  final Color color;

  const StarRating(
      {Key? key,
      this.starCount = 5,
      this.rating = .0,
      required this.onRatingChanged,
      required this.color})
      : super(key: key);

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = const Icon(
        Icons.star_border,
        size: 30,
        color: Color(0xff3c3c43),
      );
    } else if (index > rating - 1 && index < rating) {
      icon = Icon(
        Icons.star_half,
        size: 30,
        color: color,
      );
    } else {
      icon = Icon(
        Icons.star,
        size: 30,
        color: color,
      );
    }
    return InkResponse(
      onTap: () => onRatingChanged(index + 1.0),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: icon,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:
            List.generate(starCount, (index) => buildStar(context, index)));
  }
}

class MyOrderRatingScreen extends StatefulWidget {
  const MyOrderRatingScreen({Key? key}) : super(key: key);

  @override
  State<MyOrderRatingScreen> createState() => _MyOrderRatingScreenState();
}

class _MyOrderRatingScreenState extends State<MyOrderRatingScreen> {
  late final ShopCubit shopcubit;
  double rating = 0;
  @override
  void initState() {
    shopcubit = context.read<ShopCubit>();
    // shopcubit.getOrderDetail(widget.oid ?? "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<ShopCubit, ShopState>(
      builder: (context, state) {
        // if (state.loading ?? false) {
        //   return const ScreenContainer(
        //     title: '    ',
        //     leadingWidth: 0,
        //     leading: SizedBox(),
        //     child: Center(
        //       child: CircularProgressIndicator(),
        //     ),
        //   );
        // } else {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: theme.scaffoldBackgroundColor,
            titleSpacing: 7.3.w,
            title: CustomText(
              text: 'Write a Review',
              familytype: 2,
              linecount: 1,
              textcolor: Colors.black,
              // marginvalue: EdgeInsets.only(left: 6.w),
              textsize: 20.sp,
              align: Alignment.centerLeft,
            ),
            elevation: 0,
            leadingWidth: 8.2.w,
            leading: IconButton(
                onPressed: () {
                  final router = getItInjector<AppRouter>();
                  router.pop();
                  // setState(() {
                  //   final router = getItInjector<AppRouter>();
                  //   AppRouter.getParameters(Index: 0);
                  //   router.pushAndPopUntil(const HomeRoute(),
                  //       predicate: (Route<dynamic> route) {
                  //     return false;
                  //   });

                  //   // Navigator.of(context).pushReplacement(
                  //   //   MaterialPageRoute(
                  //   //       builder: (context) => const HomePage(
                  //   //             index: 0,
                  //   //           )),
                  //   // );
                  // });
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: theme.textTheme.titleMedium?.color,
                )),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              children: [
                StarRating(
                  rating: rating,
                  onRatingChanged: (rating) =>
                      setState(() => this.rating = rating),
                  color: const Color(0xFFFF9500),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
