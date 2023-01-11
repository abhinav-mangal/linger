import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flappy_search_bar_ns/flappy_search_bar_ns.dart';
import 'package:flappy_search_bar_ns/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:linger/Basepackage/baseclass.dart';
import 'package:linger/Controller/controller_lile_dislike.dart';
import 'package:linger/data/model/shop_dashboard_model/shop_product.dart';
import 'package:linger/models/search_model.dart';
import 'package:http/http.dart' as http;
import 'package:linger/ui/shope/product_detail_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Utils/colors.dart';
import '../../../constants/apiendpoints.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    Key? key,
    required this.product,
  }) : super(key: key);
  final List<ShopProduct> product;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with baseclass {
  SearchBarController searchBarController = SearchBarController();
  List<SeacrhData> placeHolder = [];

  // TextEditingController searchQueryController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await getALlPosts(null);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SearchBar<dynamic>(
          hintText: "Search...",
          shrinkWrap: true,
          searchBarPadding: const EdgeInsets.symmetric(horizontal: 10),
          headerPadding: const EdgeInsets.symmetric(horizontal: 10),
          listPadding: const EdgeInsets.symmetric(horizontal: 10),
          onSearch: getALlPosts,
          searchBarController: searchBarController,
          placeHolder: placeHolder.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : getplaceHolder(),
          cancellationWidget: const Text("Cancel"),
          emptyWidget: const Center(child: Text("No Result Found!")),
          searchBarStyle:
              SearchBarStyle(borderRadius: BorderRadius.circular(25)),
          // indexedScaledTileBuilder: (int index) =>
          //     ScaledTile.count(1, index.isEven ? 2 : 1),
          // header: Row(
          //   children: <Widget>[
          //     TextButton(
          //       child: const Text("sort"),
          //       onPressed: () {
          //         searchBarController.sortList((a, b) {
          //           return a.body.compareTo(b.body);
          //         });
          //       },
          //     ),
          //     TextButton(
          //       child: const Text("Desort"),
          //       onPressed: () {
          //         searchBarController.removeSort();
          //       },
          //     ),
          //     TextButton(
          //       child: const Text("Replay"),
          //       onPressed: () {
          //         isReplay = !isReplay;
          //         searchBarController.replayLastSearch();
          //       },
          //     ),
          //   ],
          // ),
          onCancelled: () {
            print("Cancelled triggered");
          },
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          minimumChars: 1,
          onError: (error) {
            return const Center(child: Text("Someting Went Wrong!"));
          },
          onItemFound: (post, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductDetailScreen.newInstance(
                            post.id.toString(), widget.product[index])));
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Stack(
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CachedNetworkImage(
                              fit: BoxFit.cover,
                              height: 17.5.h,
                              width: 41.w,
                              imageUrl: post.image,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              post.name,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "${post.saleprice} ₹",
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color:
                                    getColorFromHex(ColorConstants.greycolor),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "${post.discountprice} ₹",
                              style: TextStyle(
                                  color: getColorFromHex(
                                      ColorConstants.greencolor),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                      GetBuilder<LikeDislikeController>(
                        init: LikeDislikeController(),
                        initState: (_) {},
                        builder: (controller) {
                          controller.status = post.likeStatus;
                          return Positioned(
                            child: GestureDetector(
                              onTap: () async {
                                await controller.likeDislike(
                                    productId: post.id,
                                    status: post.likeStatus == 1 ? 0 : 1);
                                searchBarController.replayLastSearch();
                              },
                              child: Container(
                                margin: EdgeInsets.fromLTRB(0.w, 1.h, 0.w, 0),
                                child: Icon(
                                  controller.status == 1
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: controller.status == 1
                                      ? Colors.red
                                      : Colors.grey,
                                  size: 20.sp,
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget getplaceHolder() {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        childAspectRatio: 4 / 5,
        mainAxisSpacing: 10,
      ),
      itemCount: placeHolder.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductDetailScreen.newInstance(
                        placeHolder[index].id.toString(),
                        widget.product[index])));
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16), color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CachedNetworkImage(
                          fit: BoxFit.cover,
                          height: 17.5.h,
                          width: 41.w,
                          imageUrl: placeHolder[index].image!,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          placeHolder[index].name!,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "${placeHolder[index].saleprice} ₹",
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: getColorFromHex(ColorConstants.greycolor),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "${placeHolder[index].discountprice} ₹",
                          style: TextStyle(
                              color: getColorFromHex(ColorConstants.greencolor),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                  GetBuilder<LikeDislikeController>(
                    init: LikeDislikeController(),
                    initState: (_) {},
                    builder: (controller) {
                      controller.status = placeHolder[index].likeStatus;
                      return Positioned(
                        child: GestureDetector(
                          onTap: () async {
                            await controller.likeDislike(
                                productId: placeHolder[index].id!,
                                status:
                                    placeHolder[index].likeStatus == 1 ? 0 : 1);
                            searchBarController.replayLastSearch();
                          },
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0.w, 1.h, 0.w, 0),
                            child: Icon(
                              controller.status == 1
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: controller.status == 1
                                  ? Colors.red
                                  : Colors.grey,
                              size: 20.sp,
                            ),
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<List> getALlPosts(String? text) async {
    var res = await http.post(
        Uri.parse("${APIEndPoints.BASE_URL}user/v2/product/search"),
        headers: {'Authorization': 'Bearer ${GetStorage().read('token')}'},
        body: {"search": text ?? ""});
    var data = SearchModel.fromJson(json.decode(res.body));
    placeHolder = data.data!;
    List<SeacrhData> posts = data.data!;
    setState(() {});
    return posts;
  }
}

// class Post {
//   final String title;
//   final String body;

//   Post(this.title, this.body);
// }
