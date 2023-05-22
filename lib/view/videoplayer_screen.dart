import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../provider/videoplayer_provider.dart';

class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({super.key});

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  VideoPlayerProvider? providerTrue;
  VideoPlayerProvider? providerFalse;
  @override
  // void initState() {
  //   super.initState();
  //   Provider.of<VideoPlayerProvider>(context, listen: false)
  //       .loadVideo(providerTrue!.all_video);
  // }

  @override
  Widget build(BuildContext context) {
    providerTrue = Provider.of<VideoPlayerProvider>(context, listen: true);
    providerFalse = Provider.of<VideoPlayerProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: Text("Video Player"),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      providerTrue!.changepath(index);
                      Navigator.pushNamed(
                        context,
                        "/videoView",
                      );
                      // Chewie(
                      //   controller: providerTrue!.chewieController!,
                      // );
                    },
                    child: Container(
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            child: Image.asset(
                              "${providerFalse!.video_data[index].image}",
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(top: 190),
                          //   child: Center(
                          //     child: Text(
                          //       "${providerFalse!.video_data[index].name}",
                          //       style: TextStyle(
                          //           color: Styles.white,
                          //           fontSize: 23,
                          //           fontWeight: FontWeight.bold),
                          //     ),
                          //   ),
                          // ),
                          // IconButton(
                          //     onPressed: () {
                          //       // providerTrue!.all_video[index];
                          //     },
                          //     icon: Icon(Icons.play_arrow))
                        ],
                      ),
                      height: MediaQuery.of(context).size.height / 3.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )

        // Center(
        //   child: Text("hello"),
        // )

        //     Container(
        //   child: Chewie(
        //     controller: providerTrue!.chewieController!,
        //   ),
        // ),
      ),
    );
  }
}
