import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:linger/Basepackage/baseclass.dart';
import 'package:linger/cubits/chapter/chapter_cubit.dart';
import 'package:linger/cubits/chapter/chapter_cubit.dart';
import 'package:linger/ui/university/positionseek.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Utils/AssetImage.dart';
import '../../Utils/CustomEdits.dart';
import '../../Utils/colors.dart';
import '../../Utils/customText.dart';
import '../../models/librarypage/bookReponse.dart';
import '../../models/librarypage/libraryResponse.dart';
import '../widgets/screen_conatiner.dart';

class BookDetail extends StatefulWidget {
  const BookDetail({Key? key}) : super(key: key);

  @override
  BookDetailState createState() => BookDetailState();
}

class BookDetailState extends State<BookDetail> with baseclass {
  late final ChapterCubit chapterCubit;
  @override
  void initState() {
    chapterCubit = context.read<ChapterCubit>()..init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChapterCubit, ChapterState>(
      builder: (context, state) {
        BookResponseBody? bookRes = state.bookResponseBody;
        if (state.loading ?? false) {
          return Center(
            child: const CircularProgressIndicator(),
          );
        }
        return ScreenContainer(
            title: '',
            color: getColorFromHex(ColorConstants.courseFieldColor)
                .withOpacity(1.0),
            appBarElevation: 0,
            showLeading: !state.enabledSearch,
            actions: [
              Visibility(
                visible: !state.enabledSearch,
                child: Container(
                  padding: EdgeInsets.all(getH(20.0)),
                  // height: getH(26),
                  // width: getH(26),
                  margin: EdgeInsets.only(
                    right: getW(10),
                  ),
                  child: MyAssetImage(
                    imageName: "ic_search.svg",
                    customfit: BoxFit.contain,
                    icontint: ColorConstants.grey,
                    onItemtaped: () {
                      chapterCubit.onBookSearchStateChanged();
                    },
                  ),
                ),
              )
            ],
            titleChild: state.enabledSearch
                ? Row(
                    children: [
                      Expanded(
                        flex: 8,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(2.w, 0.9.h, 2.w, 0),
                          height: 5.68.h,
                          alignment: Alignment.center,
                          child: CustomEditText(
                            fillColor: Colors.black12,
                            prefixiconwidget: MyAssetImage(
                              imageName: "ic_search.svg",
                              marginvalue: const EdgeInsets.all(10),
                              icontint: ColorConstants.grey,
                              //width: 16.5,
                              //height: 16.5,
                            ),
                            hint: 'Search for chapter ',
                            hinttextcolor: getColorFromHex(ColorConstants.grey),
                            hinttextsize: 17.sp,
                            weight: FontWeight.w400,
                            familytype: 1,
                            height: 5.68.h,
                            textcolor: getColorFromHex(ColorConstants.black),
                            textsize: 17.sp,
                            textalign: TextAlign.left,
                            // onchangetext:signInCubit.onEmailInputChanged,
                            bordercolor: Colors.transparent,
                            borderradius: 42.sp,
                            borderwidth: 0,
                            onchangetext: chapterCubit.onBookSearchChanged,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: GestureDetector(
                          onTap: () {
                            chapterCubit.onBookSearchStateChanged();
                          },
                          child: Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: CustomText(
                                text: 'Cancel',
                                textcolor: Colors.green,
                                textalign: TextAlign.right,
                              )),
                        ),
                      ),
                    ],
                  )
                : null,
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      getColorFromHex(ColorConstants.courseFieldColor)
                          .withOpacity(1.0),
                      getColorFromHex(ColorConstants.white).withOpacity(0.0),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Container(
                    //   margin: EdgeInsets.only(top: gettoppadding(context)),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     children: [
                    //       IconButton(
                    //         onPressed: () {
                    //           Navigator.of(context).pop();
                    //         },
                    //         padding: EdgeInsets.only(left: 4.w),
                    //         icon: Icon(
                    //           Icons.arrow_back_ios,
                    //           color: Colors.black,
                    //           size: 20.sp,
                    //         ),
                    //       ),
                    //       CustomText(
                    //         textalign: TextAlign.start,
                    //         align: Alignment.topLeft,
                    //         text: "",
                    //         familytype: 2,
                    //         textsize: 20.sp,
                    //         marginvalue: EdgeInsets.only(
                    //           left: getW(10),
                    //         ),
                    //         textcolor: getColorFromHex(ColorConstants.black),
                    //       ),
                    //       const Spacer(),
                    //
                    //
                    //     ],
                    //   ),
                    // ),
                    SizedBox(
                      height: getH(13),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          // state.books[0].bookImage??'',
                          bookRes != null
                              ? bookRes.books![0].bookImage ?? ''
                              : '',
                          height: getH(230),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getH(10),
                    ),
                    CustomText(
                      text: bookRes != null
                          ? bookRes.books![0].bookName ?? ''
                          : '',
                      familytype: 1,
                      linecount: 1,
                      textcolor: getColorFromHex(ColorConstants.black),
                      textsize: 26.sp,
                      align: Alignment.center,
                    ),
                    SizedBox(
                      height: getH(32),
                    ),
                    Divider(
                        color: getColorFromHex(ColorConstants.greycolor)
                            .withOpacity(0.36),
                        thickness: 0.5),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 6.w,
                          right: 6.w,
                          top: getH(10),
                          bottom: getH(10)),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color:
                                      getColorFromHex(ColorConstants.greycolor)
                                          .withOpacity(0.36)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(60.sp)),
                            ),
                            child: Row(
                              children: [
                                CustomText(
                                  text: "Chapter",
                                  familytype: 1,
                                  textsize: 15.sp,
                                  marginvalue: EdgeInsets.only(
                                      left: getW(12),
                                      right: getW(6),
                                      top: getH(8),
                                      bottom: getH(8)),
                                  textcolor:
                                      getColorFromHex(ColorConstants.greycolor)
                                          .withOpacity(0.6),
                                ),
                                CustomText(
                                  text: "${state.chapterid}",
                                  familytype: 1,
                                  textsize: 15.sp,
                                  textcolor:
                                      getColorFromHex(ColorConstants.green),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 14.sp,
                                  color: Colors.green,
                                ),
                                SizedBox(
                                  width: getW(12),
                                )
                              ],
                            ),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              CustomText(
                                text: "Language",
                                familytype: 1,
                                textsize: 15.sp,
                                marginvalue: EdgeInsets.only(
                                    left: getW(12),
                                    right: getW(6),
                                    top: getH(8),
                                    bottom: getH(8)),
                                textcolor:
                                    getColorFromHex(ColorConstants.greycolor)
                                        .withOpacity(0.6),
                              ),
                              CustomText(
                                text: "English",
                                familytype: 1,
                                textsize: 15.sp,
                                textcolor:
                                    getColorFromHex(ColorConstants.green),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 14.sp,
                                color: Colors.green,
                              ),
                              SizedBox(
                                width: getW(12),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Divider(
                        color: getColorFromHex(ColorConstants.greycolor)
                            .withOpacity(0.36),
                        thickness: 0.5),
                    SizedBox(
                      height: getH(300),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: List.generate(
                              state!.chapter!.length,
                              (index) => GestureDetector(
                                    onTap: () {
                                      // Navigator.push(context, MaterialPageRoute(builder: (_) => const ArticleDescriptionScreen()));
                                    },
                                    child: ChapterView(
                                        chapter: state.chapter![index],
                                        index: index),
                                  )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ));
      },
    );
  }
}

class ChapterView extends StatelessWidget with baseclass {
  const ChapterView({Key? key, this.chapter, this.index}) : super(key: key);
  final Chapter? chapter;
  final int? index;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: getH(16), bottom: getH(16)),
          child: Row(
            children: [
              CustomText(
                text: "${index! + 1}",
                textsize: 15.sp,
                textcolor: getColorFromHex(ColorConstants.green),
                overflow: TextOverflow.ellipsis,
                linecount: 4,
                marginvalue: EdgeInsets.only(right: getW(28), left: getW(32)),
              ),
              CustomText(
                marginvalue: EdgeInsets.only(
                  right: getW(16),
                ),
                text: chapter?.description ?? "",
                textsize: 15.sp,
                textcolor: getColorFromHex(ColorConstants.black),
                overflow: TextOverflow.ellipsis,
                linecount: 4,
              ),
            ],
          ),
        ),
        Divider(
            color: getColorFromHex(ColorConstants.greycolor).withOpacity(0.36),
            thickness: 0.5),
      ],
    );
  }
}
