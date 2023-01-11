import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linger/Controller/sukuun_controller.dart';
import 'package:linger/ui/sukoon/audio_player.dart';

class SukunAudio extends StatefulWidget {
  final int cid;
  final int sid;
  final String name;
  final String image;
  const SukunAudio({
    Key? key,
    required this.cid,
    required this.sid,
    required this.name,
    required this.image,
  }) : super(key: key);

  @override
  State<SukunAudio> createState() => _SukunAudioState();
}

class _SukunAudioState extends State<SukunAudio> {
  SukoonController controller = Get.put(SukoonController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getSukoon(widget.cid, widget.sid);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Obx(() => controller.isLoading02.value
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: SizedBox(
                          height: size.height / 4.5,
                          child: Stack(children: [
                            Container(
                              height: size.height / 5.99,
                              width: size.width / 1.10,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: size.height / 5.99,
                                    width: size.width / 3,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                            image: CachedNetworkImageProvider(
                                                widget.image),
                                            fit: BoxFit.cover)),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 9),
                                    height: size.height / 5.99,
                                    width: size.width / 1.9,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          widget.name,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: const [
                                            Icon(
                                              Icons.favorite,
                                              color: Colors.red,
                                            ),
                                            Text('1k')
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          '${controller.sukoonData.length}+ Audios',
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // ignore: prefer_const_constructors
                            Positioned(
                                bottom: 10,
                                right: 10,
                                child: const Image(
                                  image: AssetImage(
                                      'assets/images/audioimage.png'),
                                  height: 100,
                                  width: 97,
                                )),
                          ]),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.sukoonData.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: InkWell(
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
                                                controller.sukoonData,
                                            audioPlayer:
                                                controller.audioPlayer)));
                              },
                              child: Card(
                                elevation: 4,
                                shadowColor: Colors.grey.withOpacity(0.2),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  children: [
                                    Container(
                                      height: size.height * 0.12,
                                      width: size.width * 0.24,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          image: DecorationImage(
                                              image: CachedNetworkImageProvider(
                                                  controller.sukoonData[index]
                                                      .image!),
                                              fit: BoxFit.cover)),
                                    ),
                                    Expanded(
                                      child: ListTile(
                                        // isThreeLine: true,
                                        title: Text(
                                          controller.sukoonData[index].title!,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        subtitle: Text(controller
                                                .sukoonData[index]
                                                .subCategoryName ??
                                            ""),
                                        trailing: Column(
                                          children: const [
                                            Text("25 DEC"),
                                            SizedBox(height: 15),
                                            Text("07 : 13"),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      // SizedBox(
                      //   height: size.height / 1,
                      //   child: GridView.builder(
                      //       physics: const ScrollPhysics(),
                      //       itemCount: controller.sukoonData.length,
                      //       gridDelegate:
                      //           const SliverGridDelegateWithFixedCrossAxisCount(
                      //               crossAxisCount: 1,
                      //               childAspectRatio: 2.8 / 1),
                      //       itemBuilder: ((context, index) {
                      //         return InkWell(
                      //           onTap: (() {
                      //             Navigator.push(
                      //                 context,
                      //                 MaterialPageRoute(
                      //                     builder: (_) => NowPlaying(
                      //                         songModelList:
                      //                             controller.sukoonData,
                      //                         audioPlayer: audioPlayer)));
                      //           }),
                      //           child: Container(
                      //             margin: const EdgeInsets.symmetric(
                      //                 horizontal: 18),
                      //             child: Card(
                      //               shape: RoundedRectangleBorder(
                      //                 borderRadius: BorderRadius.circular(20),
                      //               ),
                      //               child: Container(
                      //                 margin: const EdgeInsets.symmetric(
                      //                     horizontal: 10),
                      //                 child: Column(
                      //                   children: [
                      //                     const SizedBox(
                      //                       height: 10,
                      //                     ),
                      //                     Row(
                      //                       children: [
                      //                         CachedNetworkImage(
                      //                             height: 70,
                      //                             imageUrl: controller
                      //                                 .sukoonData[index]
                      //                                 .image!),
                      //                         Text(
                      //                           controller
                      //                               .sukoonData[index].title!,
                      //                           style: const TextStyle(
                      //                               fontSize: 16,
                      //                               fontWeight:
                      //                                   FontWeight.w700),
                      //                         ),
                      //                         const Spacer(),
                      //                         const Text('25 Dec')
                      //                       ],
                      //                     ),
                      //                     const SizedBox(
                      //                       height: 45,
                      //                     ),
                      //                     // Row(
                      //                     //   children: [
                      //                     //     const Icon(
                      //                     //       Icons.play_circle,
                      //                     //       color: Colors.blue,
                      //                     //       size: 30,
                      //                     //     ),
                      //                     //     const SizedBox(
                      //                     //       width: 10,
                      //                     //     ),
                      //                     //     Container(
                      //                     //       color: Colors.red,
                      //                     //       height: 4,
                      //                     //       width: 200,
                      //                     //     ),
                      //                     //     const SizedBox(
                      //                     //       width: 10,
                      //                     //     ),
                      //                     //     const Text('07:13')
                      //                     //   ],
                      //                     // )
                      //                   ],
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //         );
                      //       })),
                      // )
                    ],
                  ),
                ),
              )));
  }
}
