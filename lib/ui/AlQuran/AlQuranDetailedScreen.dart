import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linger/Basepackage/baseclass.dart';
import 'package:linger/Utils/colors.dart';
import 'package:linger/Utils/customText.dart';
import 'package:linger/cubits/home_cubit/home_cubit.dart';
import 'package:linger/data/model/al_quran/surah_model.dart';
import 'package:linger/data/model/theme_modal.dart';
import 'package:linger/data/model/user_quran_response_model.dart';
import 'package:linger/ui/AlQuran/AlQuranDetailedScreenView.dart';
import 'package:linger/ui/AlQuran/AlQuranListScreen.dart';
import 'package:linger/ui/widgets/screen_conatiner.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:linger/Basepackage/baseclass.dart';

class AlQuranDetailedScreen extends StatefulWidget {
  final int number;
  final ThemeModal themeData;
  // final Chapters chapters;
  final Surah? surah;
  final Juz? juz;
  final String type;
  const AlQuranDetailedScreen(
      {Key? key,
      required this.number,
      this.surah,
      this.juz,
      required this.themeData,
      required this.type})
      : super(key: key);

  @override
  State<AlQuranDetailedScreen> createState() => _AlQuranDetailedScreenState();
}

class _AlQuranDetailedScreenState extends State<AlQuranDetailedScreen>
    with baseclass {
  late final HomeCubit homeCubit;
  @override
  void initState() {
    super.initState();
    homeCubit = context.read<HomeCubit>();
    homeCubit.getUserQuranDetails(
        number: widget.number.toString(), language: '1', type: widget.type);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      if (state.quranDetails == null) {
        return const ScreenContainer(
          title: '    ',
          leadingWidth: 0,
          leading: SizedBox(),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else {
        return Scaffold(
          backgroundColor: state.themeModal!.cardsColors,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 8.2.h,
            leading: Container(
              // color: Colors.blue,
              child: IconButton(
                  padding: EdgeInsets.fromLTRB(4.2.w, 0, 0, 0),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: widget.themeData.iconColor,
                    size: 20.sp,
                  )),
            ),
            titleSpacing: 7.3.w,
            title: CustomText(
              text: widget.surah == null
                  ? widget.juz!.englishName!
                  : widget.surah!.englishName!,
              familytype: 2,
              linecount: 1,
              textcolor: Colors.black,
              // marginvalue:  EdgeInsets.only(left: 4.w),
              textsize: 20.sp,
              align: Alignment.centerLeft,
            ),
            elevation: 0,
            backgroundColor: widget.themeData.appBar,
            leadingWidth: 8.2.w,
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 3.2.w),
                child: Icon(
                  Icons.contrast,
                  color: widget.themeData.iconColor,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 3.2.w),
                child: Icon(
                  Icons.translate,
                  color: widget.themeData.iconColor,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 3.2.w),
                child: Icon(
                  Icons.search,
                  color: widget.themeData.iconColor,
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  List.generate(state.quranDetails!.ayahs!.length, (index) {
                return AlQuranDetaiListScreen(
                    themeData: state.themeModal!,
                    index: index + 1,
                    ayahs: state.quranDetails!.ayahs![index]);
              }),
              // children: List.generate(state.cart?.length ?? 0, (index) {
              //   final cart = state.cart![index];

              //   return CartView.newInstance(cart, state.seeAllproducts!.product);
              // })
            ),
          ),
        );
      }
    });
  }
}
