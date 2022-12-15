import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Basepackage/baseclass.dart';
import '../../../Utils/colors.dart';
import '../../../Utils/customText.dart';
import '../../../data/model/shop_dashboard_model/article.dart';
import '../article_description_screen.dart';

class ArticleView extends StatelessWidget with baseclass {
  ArticleView({Key? key, required this.article}) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_) => ArticleDescriptionScreen(productId:article.id.toString()??'')));
      },
      child: Container(
          padding: EdgeInsets.fromLTRB(2.w, 1.4.h, 2.w, 1.4.h),
          margin: EdgeInsets.fromLTRB(2.w, 1.h, 1.w, 1.h),
          height: 20.37.h,
          decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.all(Radius.circular(12.sp))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 17.5.h,
                width: 28.71.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12.sp)),
                  child: CachedNetworkImage(
                    imageUrl: article.articleimage ??
                        'https://img.freepik.com/free-psd/cosmetic-product-packaging-mockup_1150-40284.jpg?w=2000&t=st=1662393117~exp=1662393717~hmac=39e8c5f7400ac09523f3fa71767e618b450636ceaf8f54a0d08d0308ee5b69d1',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 1.h,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(3.w, 0, 4.w, 0),
                    child: Text(
                      article.title ?? 'Bilal Cotton Galabiyya',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0.9.h,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(3.w, 0, 4.w, 0),
                    child: SizedBox(
                      width: getW(200),
                      child: CustomText(
                        text: article.description ?? "Bilal Cotton Galabiyya",
                        familytype: 1,
                        linecount: 3,
                        textsize: 13.sp,
                        textcolor: getColorFromHex(ColorConstants.greycolor)
                            .withOpacity(0.36),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7.1.h,
                  ),
                  SizedBox(
                    width: getW(200),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(),
                        Padding(
                          padding: EdgeInsets.fromLTRB(3.w, 0, 0.w, 0),
                          child: CustomText(
                            text: "Read More",
                            familytype: 2,
                            textsize: 13.sp,
                            textcolor: getColorFromHex(ColorConstants.green),
                            textalign: TextAlign.right,
                            align: Alignment.bottomRight,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}
