import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linger/Controller/sukuun_controller.dart';
import 'package:linger/ui/sukoon/audio_player.dart';
import 'package:linger/ui/sukoon/seerat_e_sahaba.dart';
import 'package:linger/ui/sukoon/trending_categories.dart';

class SukunTrendingAudio extends StatefulWidget {
  const SukunTrendingAudio({
    Key? key,
  }) : super(key: key);

  @override
  State<SukunTrendingAudio> createState() => _SukunTrendingAudioState();
}

class _SukunTrendingAudioState extends State<SukunTrendingAudio> {
  SukoonController controller = Get.put(SukoonController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        leadingWidth: 0,
        title: const Text(
          'Trending',
          style: TextStyle(
              fontFamily: 'Great Vibes',
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Obx(() => controller.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.maybeOf(context)!.size.height / 2.6,
                    width: MediaQuery.maybeOf(context)?.size.width,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 3,
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
                                            audioPlayer: controller.audioPlayer,
                                            initialIndex: index,
                                            songModelList:
                                                controller.sukoonHomeTrending,
                                          )));
                            },
                            child: Card(
                              elevation: 4,
                              shadowColor: Colors.grey.withOpacity(0.2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Container(
                                height: 94,
                                width: MediaQuery.of(context).size.width / 1.1,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 94,
                                      width: 84,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          image: DecorationImage(
                                              image: CachedNetworkImageProvider(
                                                  controller
                                                      .sukoonHomeTrending[index]
                                                      .image!),
                                              fit: BoxFit.fill)),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 15, top: 10),
                                      height: 94,
                                      width: 206,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller.sukoonHomeTrending[index]
                                                .title!,
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            controller.sukoonHomeTrending[index]
                                                    .subCategoryName ??
                                                "",
                                            style: const TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          const SizedBox(height: 5),
                                          Row(
                                            children: const [
                                              Icon(
                                                Icons.favorite,
                                                color: Colors.red,
                                                size: 18,
                                              ),
                                              Text(
                                                '00',
                                                style: TextStyle(fontSize: 10),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Icon(
                                                Icons.headphones,
                                                color: Colors.black,
                                                size: 18,
                                              ),
                                              // ignore: prefer_const_constructors
                                              Text(
                                                '00',
                                                style: TextStyle(fontSize: 10),
                                              ),
                                              // Spacer(),
                                              // Icon(
                                              //   Icons.play_circle,
                                              //   color: Colors.blue,
                                              //   size: 41,
                                              // )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                  ],
                                ),
                              ),
                            ),
                          );
                        })),
                  ),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 10),
                        child: Row(
                          children: [
                            const Text(
                              'Top Categories',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            const TrendingCategories()));
                              },
                              child: const Text(
                                'See All',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 150,
                        child: GridView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.sukoonHomeCategories.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1,
                                    childAspectRatio: 1.28 / 1),
                            itemBuilder: ((context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => Seerat_e_Sahaba(
                                                title: controller
                                                    .sukoonHomeCategories[index]
                                                    .name!,
                                                cid: controller
                                                    .sukoonHomeCategories[index]
                                                    .id!,
                                              )));
                                },
                                child: SizedBox(
                                  height: 150,
                                  width: 100,
                                  child: Column(
                                    //crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 107,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            image: DecorationImage(
                                                image: CachedNetworkImageProvider(
                                                    controller
                                                        .sukoonHomeCategories[
                                                            index]
                                                        .image!),
                                                fit: BoxFit.fill)),
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                        controller
                                            .sukoonHomeCategories[index].name!,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      const Text(
                                        '5+ Audios',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 127, 125, 125),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            })),
                      ),
                      SizedBox(
                        height: 150,
                        child: GridView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: const ScrollPhysics(),
                            itemCount: 1,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1,
                                    childAspectRatio: 1 / 2.5),
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
                                                    .sukoonHomeTrending,
                                              )));
                                },
                                child: Center(
                                  child: Card(
                                    elevation: 4,
                                    shadowColor: Colors.grey.withOpacity(0.2),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Container(
                                      height: 100,
                                      width: MediaQuery.of(context).size.width /
                                          1.03,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 100,
                                            width: 110,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                image: DecorationImage(
                                                    image: CachedNetworkImageProvider(
                                                        controller
                                                            .sukoonHomeTrending[
                                                                0]
                                                            .image!),
                                                    fit: BoxFit.cover)),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                left: 15, top: 10),
                                            height: 110,
                                            width: 195,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      controller
                                                          .sukoonHomeTrending[0]
                                                          .title!,
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                    const Spacer(),
                                                    const Icon(
                                                      Icons.favorite,
                                                      color: Colors.red,
                                                      size: 20,
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  controller
                                                          .sukoonHomeTrending[0]
                                                          .subCategoryName ??
                                                      "",
                                                  style: const TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                // Row(
                                                //   children: [
                                                //     Container(
                                                //       height: 4,
                                                //       width: 130,
                                                //       decoration:
                                                //           const BoxDecoration(
                                                //               color:
                                                //                   Colors.red),
                                                //     ),
                                                //     const Text(
                                                //       '100%',
                                                //       style: TextStyle(
                                                //           fontSize: 10),
                                                //     ),
                                                //     const Spacer(),
                                                //     const Icon(
                                                //       Icons.play_circle,
                                                //       color: Colors.blue,
                                                //       size: 30,
                                                //     )
                                                //   ],
                                                // ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            })),
                      ),
                    ],
                  )
                ],
              ),
            )),
    );
  }
}
