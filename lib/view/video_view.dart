import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/videoplayer_provider.dart';

class VideoView extends StatefulWidget {
  const VideoView({super.key});

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  VideoPlayerProvider? providerTrue;
  VideoPlayerProvider? providerFalse;
  @override
  void initState() {
    super.initState();
    Provider.of<VideoPlayerProvider>(context, listen: false).loadVideo();
  }

  @override
  Widget build(BuildContext context) {
    providerTrue = Provider.of<VideoPlayerProvider>(context, listen: true);
    providerFalse = Provider.of<VideoPlayerProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        body: Chewie(
          controller: providerTrue!.chewieController!,
        ),
      ),
    );
  }

  @override
  void dispose() {
    providerFalse!.chewieController!.pause();
    super.dispose();
  }
}
