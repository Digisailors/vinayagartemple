import 'package:flutter/material.dart';
import 'package:sreeselvavinayagartemple/livestreaming_page/customvideoplayer.dart';

import '../aa_model/videolistmodel.dart';

class VideoPlayesPage extends StatefulWidget {
  const VideoPlayesPage({super.key});

  @override
  State<VideoPlayesPage> createState() => _VideoPlayesPageState();
}

class _VideoPlayesPageState extends State<VideoPlayesPage> {
  List<YoutubeList>? youtubeList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
             backgroundColor: Color(0xFFE4F5FF),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 10),
        child: AppBar(
          backgroundColor: Color(0xFF006CA7),
          title: Center(child: Text('Videos')),
      
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(22),
              bottomRight: Radius.circular(22),
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(22),
                  bottomRight: Radius.circular(22)),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                  height: 700,
                  width: double.infinity,
                  child: youtubeList == null
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                        shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: youtubeList!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: SizedBox(
                                width: 240,
                                height: double.infinity,
                                child: CustomVideoPlayer(
                                  link: youtubeList![index].url ?? '',
                                ),
                              ),
                            );
                          },
                        )),
            ],
          ),
        ),
      ),
    );
  }
}
