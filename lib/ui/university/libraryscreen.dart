import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:linger/Basepackage/baseclass.dart';
import 'package:linger/Utils/Dimension.dart';
import 'package:linger/Utils/colors.dart';
import 'package:linger/Utils/customText.dart';
import 'package:linger/cubits/chapter/chapter_cubit.dart';
import 'package:linger/cubits/library/library_cubit.dart';
import 'package:linger/ui/shope/ShopScreen.dart';
import 'package:linger/ui/university/audiolistScreen.dart';
import 'package:linger/ui/university/bookdetail.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Utils/AssetImage.dart';
import '../../Utils/CustomEdits.dart';

import '../../models/librarypage/libraryResponse.dart';
import '../shope/views/product_title_view.dart';
import '../widgets/arrow_text.dart';
import '../widgets/screen_conatiner.dart';
import 'audiodetail.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> with baseclass {
  String query = "";
  Books? books;
  Audi? audio;

  late final LibraryCubit libraryCubit;

  @override
  void initState() {
    libraryCubit = context.read<LibraryCubit>()..init();

    super.initState();
    // _getBooks(query);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LibraryCubit, LibraryState>(
      builder: (context, state) {
        LibraryResponseBody? libraryRes = state.library;
        return Scaffold(
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              _getSliverAppBar(context, libraryRes),
              _getSliverList(context, libraryRes),
            ],
          ),
        );
      },
    );
  }

  Widget _getSliverAppBar(
      BuildContext context, LibraryResponseBody? libraryRes) {
    Size size = MediaQuery.of(context).size;
    return SliverAppBar(
      leading: Container(),
      automaticallyImplyLeading: false,
      actions: [Container()],
      backgroundColor: Colors.transparent,
      expandedHeight: 55.h,
      collapsedHeight: 33.h,
      toolbarHeight: 30.h,
      flexibleSpace: FlexibleSpaceBar(
        background: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      getColorFromHex(ColorConstants.courseFieldColor)
                          .withOpacity(1.0),
                      getColorFromHex(ColorConstants.courseFieldColor)
                          .withOpacity(0.0),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 6.w, right: 6.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 4.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                          size: 22.sp,
                        ),
                      ),
                      CustomText(
                        text: 'Library',
                        familytype: 6,
                        linecount: 1,
                        textcolor: Colors.black,
                        textsize: 30.sp,
                      ),
                      CustomText(
                        text: 'Continue Reading >>>> ',
                        familytype: 6,
                        linecount: 1,
                        textcolor: Colors.black,
                        textsize: 12.sp,
                        marginvalue: EdgeInsets.only(top: getH(10)),
                        align: Alignment.centerRight,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 1.9.h, 0, 0),
                              height: 5.68.h,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(42.sp)),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          getColorFromHex(ColorConstants.black)
                                              .withOpacity(0.15),
                                      offset: const Offset(0, 1),
                                      blurRadius: 5,
                                    )
                                  ]),
                              alignment: Alignment.center,
                              child: CustomEditText(
                                fillColor: Colors.white,
                                prefixiconwidget: MyAssetImage(
                                  imageName: "ic_search.svg",
                                  marginvalue: EdgeInsets.only(
                                      left: getW(16),
                                      right: getW(11),
                                      top: getH(14),
                                      bottom: getH(14)),
                                  icontint: ColorConstants.grey,
                                  width: getH(16),
                                  height: getH(16),
                                ),
                                hint: 'Title, Author or Topics ',
                                hinttextcolor:
                                    getColorFromHex(ColorConstants.grey),
                                hinttextsize: 15.sp,
                                weight: FontWeight.w400,
                                familytype: 1,
                                height: 5.68.h,
                                textcolor:
                                    getColorFromHex(ColorConstants.black),
                                textsize: 17.sp,
                                textalign: TextAlign.left,
                                // onchangetext:signInCubit.onEmailInputChanged,
                                bordercolor: Colors.transparent,
                                borderradius: 42.sp,
                                borderwidth: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.77.h,
                      ),
                      _getBookUI(context, libraryRes),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getSliverList(BuildContext context, LibraryResponseBody? libraryRes) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    offset: Offset(0.0, 4.00), //(x,y)
                    blurRadius: 5.00,
                    color:
                        getColorFromHex(ColorConstants.black).withOpacity(0.1),
                    spreadRadius: 1.00),
              ],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.sp),
                  topRight: Radius.circular(30.sp)),
              gradient: LinearGradient(
                colors: [
                  getColorFromHex(ColorConstants.courseFieldColor)
                      .withOpacity(1.0),
                  getColorFromHex(ColorConstants.courseFieldColor)
                      .withOpacity(0.0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: [
                _getAudioUI(context, libraryRes),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _getBookUI(BuildContext context, LibraryResponseBody? libraryRes) {
    return Container(
      // margin: EdgeInsets.only(left: 6.w, right: 6.w, ),
      child: Column(
        children: [
          ProductTitleView(
            title: 'Book',
            fontWeight: FontWeight.w500,
            iconSize: 17.sp,
            fontSize: 17.sp,
            padding: EdgeInsets.zero,
            color: Colors.transparent,
            arrowText: 'See more',
            arrowTxtWeight: FontWeight.w400,
            ontap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => AllBookScreen()));
            },
          ),
          SizedBox(
            height: getH(9),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: List.generate(libraryRes != null ? 3 : 0, (index) {
                final book = libraryRes!.books![index];
                return Padding(
                  padding: const EdgeInsets.only(
                    right: 14,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BookImage(book: book),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 5.0),
                      //   child: CustomText(
                      //     text: book.bookName ?? '',
                      //     textalign: TextAlign.start,
                      //     fontWeight: FontWeight.w400,
                      //     familytype: 7,
                      //     textsize: 17.sp,
                      //   ),
                      // )
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getAudioUI(BuildContext context, LibraryResponseBody? libraryRes) {
    return Container(
      margin: EdgeInsets.only(left: 6.w, right: 6.w, top: 1.h),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 0.59.h, bottom: 1.h),
            width: 20.8.w,
            height: 0.6.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(112.sp),
              color: Colors.white,
            ),
          ),
          ProductTitleView(
            title: 'Audio Summary',
            ontap: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) =>
                          AudioListScreen(audio: libraryRes!.audio!)));
            },
            fontWeight: FontWeight.w500,
            iconSize: 17.sp,
            fontSize: 17.sp,
            padding: EdgeInsets.zero,
            color: Colors.transparent,
            arrowText: 'See more',
            arrowTxtWeight: FontWeight.w400,
          ),
          SizedBox(
            height: 2.h,
          ),
          SizedBox(
            // height: getHeight(context) * 0.38,
            width: getWidth(context),
            child: Column(
              children: [
                ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 0.18.h);
                    },
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: libraryRes != null ? 4 : 0,
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      audio = libraryRes!.audio![index];
                      return Audiotile(audio: audio!);
                      // return Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Row(
                      //       crossAxisAlignment: CrossAxisAlignment.center,
                      //       children: [
                      //         Container(
                      //           margin: EdgeInsets.only(bottom: 2.39.h),
                      //           padding: EdgeInsets.fromLTRB(0.w, 0.7.h, 0.w, 0.7.h),
                      //           width: 6.63.h,
                      //           height: 6.63.h,
                      //           decoration: BoxDecoration(
                      //             color: getColorFromHex(ColorConstants.titleBackgroundColors),
                      //             borderRadius: BorderRadius.circular(16.sp),
                      //           ),
                      //           child: CachedNetworkImage(
                      //             imageUrl: audio?.image ?? '',
                      //           ),
                      //         ),
                      //         CustomText(
                      //           textalign: TextAlign.center,
                      //           text: audio?.title ?? '',
                      //           familytype: 1,
                      //           textsize: 18.sp,
                      //           marginvalue: EdgeInsets.only(
                      //             left: 4.w,
                      //           ),
                      //           textcolor: getColorFromHex(ColorConstants.black),
                      //         ),
                      //       ],
                      //     ),
                      //     Image.asset(
                      //       'assets/images/play.png',
                      //       color: getColorFromHex(ColorConstants.green),
                      //       height: 22.sp,
                      //       width: 22.sp,
                      //     ),
                      //   ],
                      // );
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BookImage extends StatelessWidget with baseclass {
  final Books book;
  const BookImage({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {},
      child: SizedBox(
        width: 25.64.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: getWidth(context),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: CachedNetworkImage(
                  placeholder: (context, url) => const SizedBox(
                      width: 3,
                      height: 3,
                      child: Center(child: CircularProgressIndicator())),
                  imageUrl: "${book.bookImage}",
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Audiotile extends StatelessWidget with baseclass {
  final Audi audio;
  const Audiotile({Key? key, required this.audio}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => AudioDetail(
                      audio: audio,
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 1.5.h),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(audio.image!),
              radius: 2.78.h,
            ),
            SizedBox(width: 2.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  audio.title!,
                  style: TextStyle(fontSize: 14.sp),
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
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    CustomText(
                      text: '10 Ratings',
                      familytype: 1,
                      textcolor: getColorFromHex(ColorConstants.black),
                      textsize: 13.sp,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class AllBookScreen extends StatelessWidget with baseclass {
  const AllBookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // late final ChapterCubit chapterCubit;
    return BlocBuilder<LibraryCubit, LibraryState>(
      builder: (context, state) {
        final chapterCubit = context.read<ChapterCubit>();
        final libraryCubit = context.read<LibraryCubit>();
        return ScreenContainer(
          title: 'Books',
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
                    libraryCubit.onBookSearchStateChanged();
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
                          hint: 'Search for Title, Author or Topics',
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
                          onchangetext: libraryCubit.onBookSearchChanged,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () {
                          libraryCubit.onBookSearchStateChanged();
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
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 0.18.h);
                    },
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: state.books != null ? state.books.length : 0,
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final book = state.books[index];
                      return InkWell(
                        onTap: () {
                          chapterCubit.onlanguageChanged("1");
                          chapterCubit.onbookChanged("${book.id}");
                          chapterCubit.onchapterChanged("1");
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => BookDetail()));
                        },
                        child: Card(
                          elevation: 5,
                          margin: EdgeInsets.only(
                              left: getW(16),
                              right: getW(16),
                              bottom: getH(16)),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 7,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          //width: getH(60),
                                          height: getW(80),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            child: CachedNetworkImage(
                                              imageUrl: book.bookImage ?? '',
                                            ),
                                          ),
                                        ),
                                        CustomText(
                                          textalign: TextAlign.start,
                                          text: allWordsCapitilize(
                                              book.bookName ?? ""),
                                          familytype: 1,
                                          textsize: 18.sp,
                                          marginvalue: EdgeInsets.only(
                                            left: 4.w,
                                          ),
                                          textcolor: getColorFromHex(
                                              ColorConstants.black),
                                        ),
                                      ],
                                    )),
                                Expanded(
                                  flex: 3,
                                  child: ArrowText(
                                    iconSize: 17.sp,
                                    fontSize: 17.sp,
                                    arrowText: 'Read now',
                                    arrowTxtWeight: FontWeight.w400,
                                    onTap: () {
                                      chapterCubit.onlanguageChanged("1");
                                      chapterCubit.onbookChanged("${book.id}");
                                      chapterCubit.onchapterChanged("1");
                                      Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                              builder: (context) =>
                                                  BookDetail()));
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
        );
      },
    );
  }
}
