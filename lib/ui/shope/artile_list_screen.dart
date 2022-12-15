import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linger/cubits/shop/shop_cubit.dart';
import 'package:linger/ui/shope/views/article_view.dart';
import 'package:linger/ui/shope/views/cart_count_view.dart';
import 'package:linger/ui/widgets/screen_conatiner.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Basepackage/baseclass.dart';
import '../../data/model/shop_dashboard_model/shop_model.dart';
import 'article_description_screen.dart';
import 'cartscreen.dart';

class ArticleListScreen extends StatelessWidget with baseclass {
  const ArticleListScreen({Key? key, required this.articleList})
      : super(key: key);
  final List<Article> articleList;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopCubit, ShopState>(
      builder: (context, state) {
        return ScreenContainer(
          // color: Colors.blueGrey,
          title: 'Article',
          actions: [
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
          ],
          appBarElevation: 0,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: List.generate(
                  articleList.length,
                  (index) => Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 10),
                        child: ArticleView(
                          article: articleList[index],
                        ),
                      )),
            ),
          ),
        );
      },
    );
  }
}
