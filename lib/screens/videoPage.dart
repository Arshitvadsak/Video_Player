import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Display extends StatefulWidget {
  const Display({super.key, required this.videoLink});

  final videoLink;

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;

  loadvideo() async {
    videoPlayerController = VideoPlayerController.asset(widget.videoLink);
    // videoPlayerController = VideoPlayerController.asset(currentdate["url"]);
    await videoPlayerController.initialize();
    setState(() {});
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoInitialize: true,
      autoPlay: false,
      aspectRatio: 16 / 9,
    );
  }

  @override
  void initState() {
    super.initState();
    loadvideo();
    chewieController =
        ChewieController(videoPlayerController: videoPlayerController);
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Video'),
        centerTitle: true,
      ),
      body: (chewieController != null)
          ? Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Chewie(
                controller: chewieController!,
              ),
            )
          : Container(),
      backgroundColor: Colors.grey,
    );
  }
}
