import 'dart:convert';

import 'package:get/get.dart';
import 'package:pod_player/pod_player.dart';
import 'package:dio/dio.dart' as client;
import '../aa_model/videolistmodel.dart';
import 'session_Controller.dart';

class VideoController extends GetxController{
  final dio = client.Dio();
    List<YoutubeList>? youtubeList;
    Videolistmodel? videolistmodel;
  late final PodPlayerController controller;
  bool isLoading = true;
   SessionController? sessionController;
 @override
  void onInit() async {
      sessionController = Get.find<SessionController>();
videodata();
  loadVideo();
 update();
    super.onInit();
  }



    Future<void> videodata() async {
    final response = await dio.get(
        'https://rajamariammanapi.grasp.com.my/public/youtube/list');
    if (response.statusCode == 200) {
 
      final Map<String, dynamic> responseData = jsonDecode(response.data);
      final Videolistmodel videolistmodel =
          Videolistmodel.fromJson(responseData);
   
        youtubeList = videolistmodel.data?.youtubeList;
      
    } else {
      print('Error');
    }
  }
    void loadVideo() async {
    final urls = await PodPlayerController.getYoutubeUrls(
      'https://www.youtube.com/@arulmigurajamariammandevas7267',
    );
     isLoading = false;
    controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.networkQualityUrls(videoUrls: urls!),
      podPlayerConfig: const PodPlayerConfig(
        videoQualityPriority: [360],
      ),
    )..initialise();
  }
}

