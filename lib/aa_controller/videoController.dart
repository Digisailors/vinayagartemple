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
videodata();
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
}

