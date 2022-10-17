import 'dart:io';

import 'package:ecommerce/common/constant/color_res.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AppVideoPlayer extends StatefulWidget {
  String videopath;

  AppVideoPlayer(this.videopath, {super.key});

  @override
  State<AppVideoPlayer> createState() => _AppVideoPlayerState();
}

class _AppVideoPlayerState extends State<AppVideoPlayer> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.file(File(widget.videopath))
      ..initialize().then((value) => setState(() {}));
    controller.setLooping(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResource.green,
      body: Center(
        child: Stack(
          children: [
            Center(
                child: SizedBox(
                    height: 300, width: 300, child: VideoPlayer(controller))),
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
          ],
        ),
      ),
    );
  }
}

