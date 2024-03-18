import 'package:flutter/material.dart';

import '../aa_model/videolistmodel.dart';

class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({super.key});

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  List<YoutubeList>? youtubeList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       Container(
      //         height: 700,
      //         child: youtubeList == null
      //             ? const Center(
      //                 child: CircularProgressIndicator(),
      //               )
      //             : ListView.builder(
      //               shrinkWrap: true,
      //               physics: NeverScrollableScrollPhysics(),
      //                 scrollDirection: Axis.vertical,
      //                 itemCount: youtubeList!.length,
      //                 itemBuilder: (context, index) {
      //                   return Padding(
      //                     padding:
      //                         const EdgeInsets.only(left: 8.0, right: 8.0),
      //                     child: SizedBox(
      //                       width: 240,
      //                       height: double.infinity,
      //                       child: CustomVideoPlayer(
      //                         link: youtubeList![index].url ?? '',
      //                       ),
      //                     ),
      //                   );
      //                 },
      //               ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
