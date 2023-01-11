import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:linger/Controller/sukuun_controller.dart';
import 'package:on_audio_query/on_audio_query.dart';

class NowPlaying extends StatefulWidget {
  final List songModelList;
  final int initialIndex;
  final AudioPlayer audioPlayer;
  // final String audio;
  // final String id;
  // final String title;
  // final String name;
  // final String image;
  // final String? totalLike;

  const NowPlaying({
    Key? key,
    required this.songModelList,
    required this.audioPlayer,
    // required this.audio,
    // required this.id,
    // required this.title,
    // required this.name,
    // required this.image,
    // this.totalLike,
    required this.initialIndex,
  }) : super(key: key);

  @override
  State<NowPlaying> createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  SukoonController controller = Get.put(SukoonController());

  Duration _duration = const Duration();
  Duration _position = const Duration();

  bool _isPlaying = false;
  List<AudioSource> songList = [];

  int currentIndex = 0;

  void popBack() {
    Navigator.pop(context);
  }

  void seekToSeconds(int seconds) {
    Duration duration = Duration(seconds: seconds);
    widget.audioPlayer.seek(duration);
  }

  @override
  void initState() {
    super.initState();
    parseSong();
  }

  void parseSong() {
    try {
      for (var element in widget.songModelList) {
        songList.add(
          AudioSource.uri(
            Uri.parse(element.audio!),
            tag: MediaItem(
              id: element.id.toString(),
              album: element.title ?? "No Album",
              title: element.title!,
              artUri: Uri.parse(element.id.toString()),
            ),
          ),
        );
      }
      // AudioSource.uri(
      //   Uri.parse(widget.audio),
      //   tag: MediaItem(
      //     id: widget.id.toString(),
      //     album: widget.name,
      //     title: widget.title,
      //     artUri: Uri.parse(widget.image.toString()),
      //   ),
      // );

      widget.audioPlayer.setAudioSource(
        ConcatenatingAudioSource(children: songList),
        initialIndex: widget.initialIndex,
      );
      widget.audioPlayer.play();
      _isPlaying = true;

      widget.audioPlayer.durationStream.listen((duration) {
        if (duration != null) {
          setState(() {
            _duration = duration;
          });
        }
      });
      widget.audioPlayer.positionStream.listen((position) {
        setState(() {
          _position = position;
        });
      });
      listenToEvent();
      listenToSongIndex();
    } on Exception catch (_) {
      popBack();
    }
  }

  void listenToEvent() {
    widget.audioPlayer.playerStateStream.listen((state) {
      if (state.playing) {
        setState(() {
          _isPlaying = true;
        });
      } else {
        setState(() {
          _isPlaying = false;
        });
      }
      if (state.processingState == ProcessingState.completed) {
        setState(() {
          _isPlaying = false;
        });
      }
    });
  }

  void listenToSongIndex() {
    widget.audioPlayer.currentIndexStream.listen(
      (event) {
        setState(
          () {
            if (event != null) {
              currentIndex = event;
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color.fromARGB(255, 31, 250, 243), Colors.black])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          height: height,
          width: double.infinity,
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: IconButton(
                  onPressed: () {
                    popBack();
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ),
              ),
              Expanded(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    Container(
                      height: Get.height * .4,
                      width: Get.width * .8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                  widget.songModelList[currentIndex].image!),
                              fit: BoxFit.cover)),
                    ),
                    // Center(
                    //   child: QueryArtworkWidget(
                    //     id: widget.songModelList[currentIndex].id!,
                    //     type: ArtworkType.AUDIO,
                    //     artworkHeight: 200,
                    //     artworkWidth: 200,
                    //     artworkFit: BoxFit.cover,
                    //     nullArtworkWidget: const Icon(
                    //       Icons.music_note,
                    //       size: 200,
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(height: 100.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.songModelList[currentIndex].title!,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24.0,
                                overflow: TextOverflow.ellipsis),
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () => controller.sukoonLike(
                                  widget.songModelList[currentIndex].id!,
                                  widget.songModelList[currentIndex].like == 0
                                      ? 1
                                      : 0,
                                ),
                                child:
                                    widget.songModelList[currentIndex].like == 0
                                        ? const Icon(
                                            Icons.favorite_border,
                                            color: Colors.white,
                                          )
                                        : const Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                widget.songModelList[currentIndex].totalLike ==
                                        null
                                    ? ""
                                    : widget
                                        .songModelList[currentIndex].totalLike
                                        .toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Slider(
                      min: 0.0,
                      value: _position.inSeconds.toDouble(),
                      max: _duration.inSeconds.toDouble() + 1.0,
                      inactiveColor: Colors.white,
                      activeColor: Colors.red,
                      thumbColor: Colors.white,
                      onChanged: (value) {
                        setState(
                          () {
                            seekToSeconds(value.toInt());
                            value = value;
                          },
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            _position.toString().split(".")[0],
                            style: const TextStyle(color: Colors.white),
                          ),
                          Text(
                            _duration.toString().split(".")[0],
                            style: const TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (widget.audioPlayer.hasPrevious) {
                              widget.audioPlayer.seekToPrevious();
                            }
                          },
                          child: const Icon(
                            Icons.skip_previous_rounded,
                            size: 60.0,
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (_isPlaying) {
                                widget.audioPlayer.pause();
                              } else {
                                if (_position >= _duration) {
                                  seekToSeconds(0);
                                } else {
                                  widget.audioPlayer.play();
                                }
                              }
                              _isPlaying = !_isPlaying;
                            });
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.green,
                            radius: 40,
                            child: Icon(
                              _isPlaying
                                  ? Icons.pause_rounded
                                  : Icons.play_arrow_rounded,
                              size: 60.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (widget.audioPlayer.hasNext) {
                              widget.audioPlayer.seekToNext();
                            }
                          },
                          child: const Icon(
                            Icons.skip_next_rounded,
                            size: 60.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ArtWorkWidget extends StatelessWidget {
  const ArtWorkWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const QueryArtworkWidget(
      id: 143,
      type: ArtworkType.ALBUM,
      artworkHeight: 200,
      artworkWidth: 200,
      artworkFit: BoxFit.cover,
      nullArtworkWidget: Icon(
        Icons.music_note,
        size: 200,
      ),
    );
  }
}
