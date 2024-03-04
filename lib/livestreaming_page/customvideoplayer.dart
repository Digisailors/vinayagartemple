
import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';

class CustomVideoPlayer extends StatefulWidget {

  final String? link;
  const CustomVideoPlayer(
      {super.key, required this.link,
  
    
      });

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
late final PodPlayerController controller;
  bool isLoading = true;
  
  @override
  void initState() {
    loadVideo();
    super.initState();
  }

  void loadVideo() async {
    final urls = await PodPlayerController. getYoutubeUrls(
     widget.link ?? 'https://www.youtube.com/@arulmigurajamariammandevas7267',
     
    );
    setState(() => isLoading = false);
    controller = PodPlayerController(

      playVideoFrom: PlayVideoFrom.networkQualityUrls(videoUrls: urls!),
      podPlayerConfig: const PodPlayerConfig(
        
        videoQualityPriority: [360],
         autoPlay: false
      ),
    )..initialise();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : Center(child: PodVideoPlayer(controller: controller));
  }
}
