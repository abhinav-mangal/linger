import 'package:flutter/material.dart';
import 'package:linger/Basepackage/baseclass.dart';
import 'package:linger/Utils/colors.dart';
import 'package:linger/Utils/customText.dart';
import 'package:linger/data/model/al_quran/surah_chapter_details.dart';
import 'package:linger/data/model/theme_modal.dart';
import 'package:linger/data/model/user_quran_response_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AlQuranDetaiListScreen extends StatelessWidget with baseclass {
  final int index;
  final Ayahs ayahs;
  final ThemeModal themeData;
  const AlQuranDetaiListScreen({
    Key? key,
    required this.index,
    required this.ayahs,
    required this.themeData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String s =
        '<h2>Name</h2><p>This Surah is named Al-Fatihah because of its subject matter. Fatihah is that which opens a subject or a book or any other thing. In other words, Al-Fatihah is a sort of preface.</p><h2>Period of Revelation</h2><p>Surah Al-Fatihah is one of the very earliest Revelations to the Holy Prophet. As a matter of fact, we learn from authentic traditions that it was the first complete Surah that was revealed to Muhammad (Allah\'s peace be upon him). Before this, only a few miscellaneous verses were revealed which form parts of Alaq, Muzzammil, Muddaththir, etc.</p><h2>Theme</h2><p>This Surah is in fact a prayer that Allah has taught to all those who want to make a study of His book. It has been placed at the very beginning of the Quran to teach this lesson to the reader: if you sincerely want to benefit from the Quran, you should offer this prayer to the Lord of the Universe.</p><p>This preface is meant to create a strong desire in the heart of the reader to seek guidance from the Lord of the Universe Who alone can grant it. Thus Al-Fatihah indirectly teaches that the best thing for a man is to pray for guidance to the straight path, to study the Quran with the mental attitude of a seeker searching for the truth, and to recognize the fact that the Lord of the Universe is the source of all knowledge. He should, therefore, begin the study of the Quran with a prayer to Him for guidance.</p><p>From this theme, it becomes clear that the real relation between Al-Fatihah and the Quran is not that of an introduction to a book but that of a prayer and its answer. Al-Fatihah is the prayer from the servant and the Quran is the answer from the Master to the servant\'s prayer. The servant prays to Allah to show him guidance and the Master places the whole of the Quran before him in answer to his prayer, as if to say, \"This is the Guidance you begged from Me.\"</p>'
            .replaceAll(RegExp('<[^>]*>'), ' ');

    return Container(
      padding: EdgeInsets.fromLTRB(2.6.w, 1.5.h, 2.6.w, 1.5.h),
      margin: EdgeInsets.fromLTRB(4.w, 1.h, 4.w, 1.h),
      // height: 18.h,
      decoration: BoxDecoration(
        color: themeData.screenColor,
        borderRadius: BorderRadius.all(Radius.circular(12.sp)),
        boxShadow: [
          BoxShadow(
            color:
                getColorFromHex(ColorConstants.shadowcolor).withOpacity(0.06),
            spreadRadius: 0,
            blurRadius: 12,
            offset: const Offset(0, 2), // changes position of shadow
          )
        ],
      ),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 6.h,
                width: 10.w,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 231, 250, 231),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: CustomText(
                    text: index.toString(),
                    familytype: 2,
                    linecount: 1,
                    textcolor: getColorFromHex(ColorConstants.green),
                    // marginvalue:  EdgeInsets.only(left: 4.w),
                    textsize: 18.sp,
                    align: Alignment.center,
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.fromLTRB(1.w, 1.h, 1.w, 1.h),
                child: Icon(
                  Icons.bookmark,
                  color: const Color(0xFF0D900E),
                  size: 3.h,
                ),
              )
            ],
          ),
          SizedBox(
            height: 1.2.h,
          ),
          CustomText(
            text: ayahs.text!,
            familytype: 2,

            textcolor: themeData.textColor,
            // marginvalue:  EdgeInsets.only(left: 4.w),
            textsize: 20.sp,
            align: Alignment.centerRight,
          ),
          SizedBox(
            height: 1.2.h,
          ),
          // CustomText(
          //   text: s,
          //   familytype: 2,
          //   textcolor: Colors.black,
          //   // marginvalue:  EdgeInsets.only(left: 4.w),
          //   textsize: 18.sp,
          //   align: Alignment.centerLeft,
          // ),
        ],
      ),
    );
  }
}
