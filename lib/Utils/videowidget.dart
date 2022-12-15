import 'package:auto_orientation/auto_orientation.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class CommonVideoWidget extends StatefulWidget {
  final String url;

  const CommonVideoWidget(this.url);

  @override
  _CommonVideoWidgetState createState() => _CommonVideoWidgetState();
}

class _CommonVideoWidgetState extends State<CommonVideoWidget> {
  VideoPlayerController? _videoController;
  ChewieController? chewieController;
  @override
  void initState() {
    initializeVideoPlayer();
    super.initState();
  }

  Future<void> initializeVideoPlayer() async {
    String url = widget.url;
    if (url.contains("youtube") || url.contains('yout')) {
    } else {
      _videoController = VideoPlayerController.network(url);
      await Future.wait([_videoController!.initialize()]);
      setState(() {});
      chewieController = ChewieController(
          videoPlayerController: _videoController!,
          autoPlay: false,
          aspectRatio: _videoController!.value.aspectRatio,
          showOptions: false,
          showControls: false,
          looping: true,
          routePageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondAnimation, provider) {
            return AnimatedBuilder(
              animation: animation,
              builder: (BuildContext context, Widget? child) {
                return VideoScaffold(
                  child: Scaffold(
                    // resizeToAvoidBottomPadding: false,
                    body: Container(
                      alignment: Alignment.center,
                      color: Colors.black,
                      child: provider,
                    ),
                  ),
                );
              },
            );
          });
    }
  }

  @override
  void dispose() {
    super.dispose();
    chewieController?.dispose();
    _videoController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations(
    //     [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp,DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]);

    if (widget.url.isNotEmpty) {
      return widget.url != ""
          ? chewieController != null &&
                  chewieController!.videoPlayerController.value.isInitialized
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Chewie(
                      controller: chewieController!,
                    ),
                  ),
                )
              : AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                      SizedBox(height: 20),
                      Text('Please Wait'),
                    ],
                  ),
                )
          : Container();
    } else {
      return Container();
    }
  }
}

class VideoScaffold extends StatefulWidget {
  const VideoScaffold({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  State<StatefulWidget> createState() => _VideoScaffoldState();
}

class _VideoScaffoldState extends State<VideoScaffold> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    AutoOrientation.landscapeAutoMode();
    super.initState();
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    AutoOrientation.portraitAutoMode();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child!;
  }
}
