import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:linger/Basepackage/baseclass.dart';
import 'package:linger/core/core.dart';
import 'package:linger/cubits/shop/shop_cubit.dart';
import 'package:linger/ui/widgets/screen_conatiner.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Utils/colors.dart';

class ReviewProductScreen extends StatefulWidget {
  const ReviewProductScreen({Key? key}) : super(key: key);

  @override
  State<ReviewProductScreen> createState() => _ReviewProductScreenState();
}

class _ReviewProductScreenState extends State<ReviewProductScreen> with baseclass {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<ShopCubit, ShopState>(
      builder: (context, shopState) {
        return ScreenContainer(
          title: 'Reviews',
          actions: const [
            SizedBox(
              width: 20,
            ),
          ],
          toolbarHeight: 70,
          appBarElevation: 0,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              margin: EdgeInsets.only(left: getW(16), right: getW(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      children: List.generate(
                        10,
                        (index) => Container(
                          padding: EdgeInsets.fromLTRB(0, getH(6), 0, getH(6)),
                          margin: EdgeInsets.fromLTRB(getW(7), getH(24), getW(7), getH(36)),
                          height: getH(56),
                          width: getW(66),
                          decoration: BoxDecoration(
                            color: index == 0 ? Colors.white : const Color.fromRGBO(120, 120, 128, 0.16),
                            borderRadius: BorderRadius.all(Radius.circular(10.sp)),
                            border: Border.all(
                                color: index == 0
                                    ? getColorFromHex(ColorConstants.greencolor)
                                    : getColorFromHex(ColorConstants.greybordercolor).withOpacity(0.07)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '5',
                                    style: theme.textTheme.titleMedium?.copyWith(
                                      fontSize: 15.sp,
                                      fontFamily: 'SF Pro Display',
                                    ),
                                  ),
                                  SizedBox(
                                    width: getW(6),
                                  ),
                                  SizedBox(
                                    height: getH(20),
                                    width: getH(20),
                                    child: SvgPicture.asset('assets/images/ic_star.svg'),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: getH(5),
                              ),
                              Text(
                                '(90)',
                                style: theme.textTheme.caption?.copyWith(
                                  fontSize: 11.sp,
                                  fontFamily: 'SF Pro Display',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ).toList(),
                    ),
                  ),
                  if (shopState.reviews != null && shopState.reviews!.data != null)
                    if (shopState.reviews!.data!.isNotEmpty)
                      const Center(child: Text('No content found'))
                    else
                      Column(
                        children: List.generate(
                          shopState.reviews!.data!.length,
                          (index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: ListTile(
                                leading: const CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage('assets/images/m.png'),
                                ),
                                contentPadding: EdgeInsets.zero,
                                title: Padding(
                                  padding: const EdgeInsets.only(top: 8.0, bottom: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'sujanakha',
                                        style: theme.textTheme.titleMedium?.copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                          fontFamily: 'SF Pro Display',
                                        ),
                                      ),
                                      Text(
                                        'Classify: Pink,XL',
                                        style: theme.textTheme.caption?.copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13.sp,
                                          fontFamily: 'SF Pro Display',
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                subtitle: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                        itemSize: 18.sp,
                                        allowHalfRating: true,
                                        glowColor: Colors.orange,
                                        initialRating: 5,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 5.0,
                                        bottom: 5.0,
                                      ),
                                      child: Text(
                                        'Very good product, I will buy it again',
                                        style: theme.textTheme.titleMedium?.copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                          fontFamily: 'SF Pro Display',
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 5.0,
                                        bottom: 5.0,
                                      ),
                                      child: Text(
                                        'Apr 17 ',
                                        style: theme.textTheme.caption?.copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12.sp,
                                          fontFamily: 'SF Pro Display',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ).toList(),
                      )
                  else
                    const Center(child: CircularProgressIndicator()),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
