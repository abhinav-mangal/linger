import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:linger/models/sukoon_model.dart';
import 'package:rxdart/rxdart.dart';

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
      final duration = await player.setUrl(widget.data.audio!);
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
                                    await player.play().then((value) {});
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
