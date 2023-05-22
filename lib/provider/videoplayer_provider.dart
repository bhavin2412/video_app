import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../modal/videoplayer_modal.dart';

class VideoPlayerProvider extends ChangeNotifier {
  List all_video = [
    "assets/video/1.mp4",
    "assets/video/2.mp4",
    "assets/video/3.mp4",
    "assets/video/4.mp4",
  ];
  List<VideoPlayerModal> video_data = [
    VideoPlayerModal(image: "assets/image/1.jpg", video: "assets/video/1.mp4"),
    VideoPlayerModal(image: "assets/image/2.jpg", video: "assets/video/2.mp4"),
    VideoPlayerModal(image: "assets/image/3.jpg", video: "assets/video/3.mp4"),
    VideoPlayerModal(image: "assets/image/4.jpg", video: "assets/video/4.mp4"),
  ];
  VideoPlayerModal? v1;
  int? index;
  void changepath(ind) {
    // v1 = vv;
    index = ind;
    notifyListeners();
  }

  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;

  void loadVideo() {
    videoPlayerController = VideoPlayerController.asset('${all_video[index!]}')
      ..initialize();

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController!,
      autoPlay: false,

      // customControls: ElevatedButton(
      //   onPressed: () {},
      //   child: Text("hello"),
      // )
      // Text(
      //   "Hello",
      //   style: TextStyle(
      //     fontSize: 20,
      //   ),
      // ),
    );
  }
}
