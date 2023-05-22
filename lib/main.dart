import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_app/provider/videoplayer_provider.dart';
import 'package:video_app/view/video_view.dart';
import 'package:video_app/view/videoplayer_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => VideoPlayerProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => VideoPlayerPage(),
          '/videoView': (context) => VideoView(),
        },
      ),
    ),
  );
}
