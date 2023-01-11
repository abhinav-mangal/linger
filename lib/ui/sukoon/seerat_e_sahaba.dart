import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:linger/Controller/sukuun_controller.dart';
import 'package:linger/ui/sukoon/seerat_favorite.dart';
import 'package:linger/ui/sukoon/seerat_sub_categories.dart';
import 'package:linger/ui/sukoon/sukkon_audios.dart';

import 'audio_player.dart';

class Seerat_e_Sahaba extends StatefulWidget {
  final int cid;
  final String title;
  const Seerat_e_Sahaba({
    Key? key,
    required this.cid,
    required this.title,
  }) : super(key: key);

  @override
  State<Seerat_e_Sahaba> createState() => _Seerat_e_SahabaState();
}

class _Seerat_e_SahabaState extends State<Seerat_e_Sahaba> {
  SukoonController controller = Get.put(SukoonController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await controller.getSubCategory(widget.cid);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        leadingWidth: 0,
        title: Text(
          widget.title,
          style: const TextStyle(
              fontFamily: 'Great Vibes',
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
      ),
      // backgroundColor: Color.fromARGB(255, 222, 219, 219),
      body: Obx(() => controller.isLoading01.value
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    CarouselSlider.builder(
                      itemCount: controller.banner.length,
                      options: CarouselOptions(
                        height: 202,
                        autoPlay: true,
                        viewportFraction: .8,
                        aspectRatio: 16 / 9,
                        enlargeCenterPage: true,
                      ),
                      itemBuilder: (context, index, realIdx) {
                        return Center(
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: CachedNetworkImage(
                                imageUrl: controller.banner[index].image!,
                                fit: BoxFit.fill,
                                height: 202,
                                width: 300,
                              )),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                            margin: const EdgeInsets.only(left: 20),
                            child: const Text(
                              'Sub Categories',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            )),
                        const Spacer(),
                        PopupMenuButton<int>(
                          shape: Border.all(),
                          position: PopupMenuPosition.over,
                          itemBuilder: (context) => [
                            // popupmenu item 1
                            PopupMenuItem(
                              value: 1,
                              // row has two child icon and text.
                              child: InkWell(
                                onTap: (() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => Seerat_Subcategories(
                                              data: controller
                                                  .sukoonSubCategoryData!
                                                  .subCategory!)));
                                }),
                                child: Row(
                                  children: const [
                                    Icon(Icons.menu_sharp),
                                    SizedBox(
                                      // sized box with width 10
                                      width: 10,
                                    ),
                                    Text("See All")
                                  ],
                                ),
                              ),
                            ),
                            // popupmenu item 2
                            PopupMenuItem(
                              value: 2,
                              // row has two child icon and text
                              child: InkWell(
                                onTap: (() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              const SeeratFavorite()));
                                }),
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    ),
                                    SizedBox(
                                      // sized box with width 10
                                      width: 10,
                                    ),
                                    Text("Favorite")
                                  ],
                                ),
                              ),
                            ),
                          ],
                          offset: const Offset(0, 100),
                          color: const Color.fromARGB(255, 238, 237, 237),
                          elevation: 2,
                        ),
                      ],
                    ),
                    // const SizedBox(
                    //   height: 15,
                    // ),
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller
                              .sukoonSubCategoryData!.subCategory!.length,
                          itemBuilder: ((context, index) {
                            return InkWell(
                                onTap: (() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => SukunAudio(
                                                name: controller
                                                    .sukoonSubCategoryData!
                                                    .subCategory![index]
                                                    .name!,
                                                image: controller
                                                    .sukoonSubCategoryData!
                                                    .subCategory![index]
                                                    .image!,
                                                cid: controller
                                                    .sukoonSubCategoryData!
                                                    .subCategory![index]
                                                    .cid!,
                                                sid: controller
                                                    .sukoonSubCategoryData!
                                                    .subCategory![index]
                                                    .id!,
                                              )));
                                }),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Card(
                                    elevation: 4,
                                    shadowColor: Colors.grey.withOpacity(0.2),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: Get.height * 0.12,
                                          width: Get.width * 0.24,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              image: DecorationImage(
                                                  image: CachedNetworkImageProvider(
                                                      controller
                                                          .sukoonSubCategoryData!
                                                          .subCategory![index]
                                                          .image!),
                                                  fit: BoxFit.cover)),
                                        ),
                                        Expanded(
                                          child: ListTile(
                                              title: Text(
                                                controller
                                                    .sukoonSubCategoryData!
                                                    .subCategory![index]
                                                    .name!,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              subtitle: Text(controller
                                                      .sukoonSubCategoryData!
                                                      .subCategory![index]
                                                      .subcategoryName ??
                                                  ""),
                                              trailing: InkWell(
                                                onTap: () {
                                                  controller.sukoonLike(
                                                      controller
                                                          .sukoonSubCategoryData!
                                                          .subCategory![index]
                                                          .id!,
                                                      controller
                                                                  .sukoonSubCategoryData!
                                                                  .subCategory![
                                                                      index]
                                                                  .status ==
                                                              1
                                                          ? 0
                                                          : 1);
                                                },
                                                child: controller
                                                            .sukoonSubCategoryData!
                                                            .subCategory![index]
                                                            .status ==
                                                        1
                                                    ? const Icon(
                                                        Icons.favorite,
                                                        color: Colors.red,
                                                      )
                                                    : const Icon(
                                                        Icons.favorite_border,
                                                        color: Colors.black,
                                                      ),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ));
                          })),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: const Text(
                          'Most Listned',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const ScrollPhysics(),
                          itemCount: controller
                              .sukoonSubCategoryData!.mostLink!.length,
                          itemBuilder: ((context, index) {
                            return InkWell(
                              onTap: () async {
                                if (controller.audioPlayer.playing) {
                                  await controller.audioPlayer.stop();
                                }
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => NowPlaying(
                                              audioPlayer:
                                                  controller.audioPlayer,
                                              initialIndex: index,
                                              songModelList: controller
                                                  .sukoonSubCategoryData!
                                                  .mostLink!,
                                            )));
                              },
                              child: Card(
                                elevation: 4,
                                shadowColor: Colors.grey.withOpacity(0.2),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(children: [
                                  Container(
                                    height: Get.height * 0.12,
                                    width: Get.width * 0.2,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                            image: CachedNetworkImageProvider(
                                                controller
                                                    .sukoonSubCategoryData!
                                                    .mostLink![index]
                                                    .image!),
                                            fit: BoxFit.cover)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(controller
                                                .sukoonSubCategoryData!
                                                .mostLink![index]
                                                .title!),
                                            const Text(
                                              "hazrat saad bin abi waqqas ra",
                                              style: TextStyle(fontSize: 10),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: const [
                                            Icon(Icons.favorite,
                                                color: Colors.red),
                                            Text("99"),
                                            SizedBox(width: 5),
                                            Icon(
                                              Icons.headphones,
                                              color: Colors.black,
                                            ),
                                            Text("00"),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ]),

                                // child: Container(
                                //   height: 100,
                                //   width:
                                //       MediaQuery.of(context).size.width / 1.55,
                                //   decoration: BoxDecoration(
                                //       borderRadius: BorderRadius.circular(15),
                                //       color: Colors.white),
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.start,
                                //     children: [
                                //       Container(
                                //         height: 94,
                                //         width: 71,
                                //         decoration: BoxDecoration(
                                //             borderRadius:
                                //                 BorderRadius.circular(15),
                                //             image: DecorationImage(
                                //                 image: CachedNetworkImageProvider(
                                //                     controller
                                //                         .sukoonSubCategoryData!
                                //                         .mostLink![index]
                                //                         .image!),
                                //                 fit: BoxFit.cover)),
                                //       ),
                                //       Container(
                                //         margin: const EdgeInsets.only(
                                //             left: 15, top: 10),
                                //         height: 100,
                                //         width: 110,
                                //         child: Column(
                                //           crossAxisAlignment:
                                //               CrossAxisAlignment.start,
                                //           children: [
                                //             const Text(
                                //               'Seerat a Sahaba',
                                //               style: TextStyle(
                                //                   fontSize: 14,
                                //                   fontWeight: FontWeight.w400),
                                //             ),
                                //             const SizedBox(
                                //               height: 5,
                                //             ),
                                //             const Text(
                                //               'Hazarat Saad Bin',
                                //               style: TextStyle(
                                //                   fontSize: 10,
                                //                   fontWeight: FontWeight.w400),
                                //             ),
                                //             Row(
                                //               children: const [
                                //                 Icon(
                                //                   Icons.favorite,
                                //                   color: Colors.red,
                                //                   size: 15,
                                //                 ),
                                //                 Text(
                                //                   '00',
                                //                   style:
                                //                       TextStyle(fontSize: 10),
                                //                 ),
                                //                 Icon(
                                //                   Icons.headphones,
                                //                   color: Colors.black,
                                //                   size: 15,
                                //                 ),
                                //                 Text(
                                //                   '00',
                                //                   style:
                                //                       TextStyle(fontSize: 10),
                                //                 ),
                                //                 // SizedBox(
                                //                 //   width: 16,
                                //                 // ),
                                //                 // Icon(
                                //                 //   Icons.play_circle,
                                //                 //   color: Colors.blue,
                                //                 //   size: 40,
                                //                 // )
                                //               ],
                                //             )
                                //           ],
                                //         ),
                                //       ),
                                //       const SizedBox(
                                //         width: 20,
                                //       ),
                                //     ],
                                //   ),
                                // ),
                              ),
                            );
                          })),
                    ),
                  ],
                ),
              ),
            )),
    );
  }
}
