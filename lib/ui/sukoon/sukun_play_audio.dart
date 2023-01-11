import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:linger/models/sukoon_model.dart';

class SukunPlayAudio extends StatefulWidget {
  final SukoonData data;
  const SukunPlayAudio({Key? key, required this.data}) : super(key: key);

  @override
  State<SukunPlayAudio> createState() => _SukunPlayAudioState();
}

class _SukunPlayAudioState extends State<SukunPlayAudio> {
  final player = AudioPlayer();
  bool isvisible = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // if (player.playing) {
      //   // final duration = await player.setUrl(widget.data.audio!);

      // }
      // Catching errors at load time
      try {
        await player.setUrl("https://s3.amazonaws.com/404-file.mp3");
      } on PlayerException catch (e) {
        // iOS/macOS: maps to NSError.code
        // Android: maps to ExoPlayerException.type
        // Web: maps to MediaError.code
        // Linux/Windows: maps to PlayerErrorCode.index
        print("Error code: ${e.code}");
        // iOS/macOS: maps to NSError.localizedDescription
        // Android: maps to ExoPlaybackException.getMessage()
        // Web/Linux: a generic message
        // Windows: MediaPlayerError.message
        print("Error message: ${e.message}");
      } on PlayerInterruptedException catch (e) {
        // This call was interrupted since another audio source was loaded or the
        // player was stopped or disposed before this audio source could complete
        // loading.
        print("Connection aborted: ${e.message}");
      } catch (e) {
        // Fallback for all other errors
        print('An error occured: $e');
      }

// Catching errors during playback (e.g. lost network connection)
      player.playbackEventStream.listen((event) {},
          onError: (Object e, StackTrace st) {
        if (e is PlayerException) {
          print('Error code: ${e.code}');
          print('Error message: ${e.message}');
        } else {
          print('An error occurred: $e');
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color.fromARGB(255, 31, 250, 243), Colors.black])),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.keyboard_arrow_down)),
                Container(
                  margin: const EdgeInsets.only(left: 30, top: 20),
                  height: size.height / 3.1,
                  width: size.width / 1.37,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(widget.data.image!),
                          fit: BoxFit.cover)),
                ),
                const SizedBox(
                  height: 100,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.data.title!,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w700),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                          size: 18,
                        ),
                        const Text(
                          '12,8k',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: const [
                        Text(
                          'by',
                          style: TextStyle(
                              color: Color.fromARGB(255, 152, 150, 150),
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          'Asad',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 80,
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              color: Colors.white,
                              iconSize: 30,
                              onPressed: () {},
                              icon: const Icon(Icons.repeat)),
                          IconButton(
                              color: Colors.white,
                              iconSize: 30,
                              onPressed: () {},
                              icon: const Icon(Icons.skip_previous)),
                          Container(
                            height: 62,
                            width: 62,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.green),
                            child: IconButton(
                                iconSize: 39,
                                color: Colors.white,
                                onPressed: () async {
                                  if (isvisible == false) {
                                    setState(() {
                                      isvisible = !isvisible;
                                    });
                                    await player.play();
                                  } else if (isvisible == true) {
                                    setState(() {
                                      isvisible = !isvisible;
                                    });
                                    await player.stop().then((value) {});
                                  }
                                },
                                icon: Icon(!isvisible
                                    ? Icons.play_arrow
                                    : Icons.pause)),
                          ),
                          IconButton(
                              color: Colors.white,
                              iconSize: 30,
                              onPressed: () {},
                              icon: const Icon(Icons.skip_next)),
                          IconButton(
                              color: Colors.white,
                              iconSize: 30,
                              onPressed: () {},
                              icon: const Icon(Icons.shuffle_sharp)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
