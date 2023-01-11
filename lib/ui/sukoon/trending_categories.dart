import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linger/Controller/sukuun_controller.dart';
import 'package:linger/ui/sukoon/audio_player.dart';
import 'package:linger/ui/sukoon/seerat_e_sahaba.dart';

class TrendingCategories extends StatefulWidget {
  const TrendingCategories({
    Key? key,
  }) : super(key: key);

  @override
  State<TrendingCategories> createState() => _TrendingCategoriesState();
}

class _TrendingCategoriesState extends State<TrendingCategories> {
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
          'Categories',
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 1.4,
                    child: GridView.builder(
                        physics: const ScrollPhysics(),
                        itemCount: controller.sukoonCategories.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 1.28 / 1.80),
                        itemBuilder: ((context, index) {
                          return InkWell(
                            onTap: (() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => Seerat_e_Sahaba(
                                          title: controller
                                              .sukoonCategories[index].name!,
                                          cid: controller
                                              .sukoonCategories[index].id!)));
                            }),
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
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                            image: CachedNetworkImageProvider(
                                                controller
                                                    .sukoonCategories[index]
                                                    .image!),
                                            fit: BoxFit.fill)),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    controller.sukoonCategories[index].name!,
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
                                        color:
                                            Color.fromARGB(255, 127, 125, 125),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ),
                          );
                        })),
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 20),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: const Text(
                        'Most liked',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      )),
                  SizedBox(
                    height: 100,
                    width: MediaQuery.maybeOf(context)?.size.width,
                    child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const ScrollPhysics(),
                        itemCount: controller.sukoonMostLikes.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1, childAspectRatio: 1 / 2.52),
                        itemBuilder: ((context, index) {
                          return InkWell(
                            onTap: () async {
                              if (controller.audioPlayer.playing) {
                                await controller.audioPlayer.stop();
                              }
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => NowPlaying(
                                          initialIndex: index,
                                          songModelList:
                                              controller.sukoonMostLikes,
                                          audioPlayer:
                                              controller.audioPlayer)));
                            },
                            child: Card(
                              elevation: 4,
                              shadowColor: Colors.grey.withOpacity(0.2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Container(
                                height: 100,
                                width: MediaQuery.of(context).size.width / 1.55,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 94,
                                      width: 71,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          image: DecorationImage(
                                              image: CachedNetworkImageProvider(
                                                  controller
                                                      .sukoonMostLikes[index]
                                                      .image!),
                                              fit: BoxFit.fill)),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 15, top: 10),
                                      height: 100,
                                      width: 110,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller
                                                .sukoonMostLikes[index].title!,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const Text(
                                            'Hazarat Saad Bin',
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          const SizedBox(height: 5),
                                          Row(
                                            children: const [
                                              Icon(
                                                Icons.favorite,
                                                color: Colors.red,
                                                size: 15,
                                              ),
                                              Text(
                                                '00',
                                                style: TextStyle(fontSize: 10),
                                              ),
                                              Icon(
                                                Icons.headphones,
                                                color: Colors.black,
                                                size: 15,
                                              ),
                                              Text(
                                                '00',
                                                style: TextStyle(fontSize: 10),
                                              ),
                                              // SizedBox(
                                              //   width: 16,
                                              // ),
                                              // Expanded(
                                              //   child: Icon(
                                              //     Icons.play_circle,
                                              //     color: Colors.blue,
                                              //     size: 40,
                                              //   ),
                                              // )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        })),
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            )),
    );
  }
}
