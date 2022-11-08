import 'package:ecommerce/common/constant/color_res.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AppVideoPlayer extends StatefulWidget {
  String video;

  AppVideoPlayer(this.video, {super.key});

  @override
  State<AppVideoPlayer> createState() => _AppVideoPlayerState();
}

class _AppVideoPlayerState extends State<AppVideoPlayer> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(widget.video)
      ..initialize().then((value) => setState(() {}));
    controller.setLooping(true);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResource.green,
      body: Center(
        child: Stack(
          children: [
            Center(
                child: controller.value.isInitialized ? Container(
                    height: 300,
                    width: 300,
                    color: Colors.grey,
                    child:    VideoPlayer(controller)) : const Center(child: CircularProgressIndicator())) ,
            Center(
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      controller.value.isPlaying
                          ? controller.pause()
                          : controller.play();
                    });
                  },
                  icon: Icon(
                    controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                    color: ColorResource.white,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 10),
              child: Container(
                height: 35,
                width: 35,
                decoration: const BoxDecoration(
                    color: Colors.grey, shape: BoxShape.circle),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new,
                      color: ColorResource.white, size: 15),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
