import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';
import 'package:sreeselvavinayagartemple/livestreaming_page/customvideoplayer.dart';
import 'package:http/http.dart' as http;
import '../aa_model/videolistmodel.dart';

class VideoPlayesPage extends StatefulWidget {
  const VideoPlayesPage({super.key});

  @override
  State<VideoPlayesPage> createState() => _VideoPlayesPageState();
}

class _VideoPlayesPageState extends State<VideoPlayesPage> {
  List<YoutubeList>? youtubeList;
    Videolistmodel? videolistmodel;
  late final PodPlayerController controller;
  bool isLoading = true;

 
  @override
  void initState() {
    super.initState();
    videodata();
    loadVideo();
  }

  Future<void> videodata() async {
    final response = await http.get(
        Uri.parse('https://rajamariammanapi.grasp.com.my/public/youtube/list'));
    if (response.statusCode == 200) {
      print(response.body);
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final Videolistmodel videolistmodel =
          Videolistmodel.fromJson(responseData);
      setState(() {
        youtubeList = videolistmodel.data?.youtubeList;
      });
    } else {
      print('Error');
    }
  }

  void loadVideo() async {
    final urls = await PodPlayerController.getYoutubeUrls(
      'https://www.youtube.com/@arulmigurajamariammandevas7267',
    );
    setState(() => isLoading = false);
    controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.networkQualityUrls(videoUrls: urls!),
      podPlayerConfig: const PodPlayerConfig(
        videoQualityPriority: [360],
      ),
    )..initialise();
  }
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
              youtubeList == null
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: youtubeList!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding:
                              const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: SizedBox(
                            width: 240,
                            height:240,
                            child: CustomVideoPlayer(
                              link: youtubeList![index].url ?? '',
                            ),
                          ),
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
