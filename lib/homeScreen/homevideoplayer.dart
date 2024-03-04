import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sreeselvavinayagartemple/homeScreen/newsannouncement.dart';
import 'package:sreeselvavinayagartemple/themes/color_schemes.g.dart';
import 'package:sreeselvavinayagartemple/themes/font_height.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoNews extends StatefulWidget {
  final String id;
  final String title;
  final String description;
  final String subTitle;
  final String vidoeUrl;
  final String date;
  final String imageUrl;
  final int index;

  const VideoNews({
    Key? key,
    required this.title,
    required this.description,
    required this.subTitle,
    required this.vidoeUrl,
    required this.date,
    required this.imageUrl,
    required this.index,
    required this.id,
  }) : super(key: key);

  @override
  State<VideoNews> createState() => _VideoNewsState();
}

class _VideoNewsState extends State<VideoNews> {
  late YoutubePlayerController _controller;
  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  late TextEditingController _idController;
  late TextEditingController _seekToController;
  late String titles;
  late String subTitle;
  late String description;
  late String dates;
  late int indexs;

  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;
  bool _isExpanded = false;
  @override
  void initState() {
    super.initState();
    titles = widget.title;
    subTitle = widget.subTitle;
    description = widget.description;
    dates = widget.date;
    indexs = widget.index;

    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.vidoeUrl) ?? '',
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
        // _controller.seekTo(Duration(seconds: 30));
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to the next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const String readLessText = 'Read Less';
    const String readMoreText = 'Read More';
    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },
      //   key: UniqueKey(), // Use a UniqueKey to recreate the widget when needed
      onEnterFullScreen: () {},
      player: YoutubePlayer(
        bottomActions: customBottomActions(_controller),
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
        topActions: <Widget>[
          //  const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              _controller.metadata.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12.0,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          PopupMenuButton<double>(
            iconColor: Colors.white,
            color: Colors.black54,
            padding: EdgeInsets.zero,
            onSelected: (speed) => _controller.setPlaybackRate(speed),
            itemBuilder: (context) => [
              for (final speed in [0.25, 0.5, 1, 1.5, 2])
                PopupMenuItem(
                    value: speed.toDouble(),
                    child: Text(
                      '${speed}x',
                      style: TextStyle(color: Colors.white),
                    ))
            ],
          ),
        ],
        onReady: () {
          _isPlayerReady = true;
        },
        onEnded: (data) {
          //  _controller
          // .load(_ids[(_ids.indexOf(data.videoId) + 1) % _ids.length]);
          // _showSnackBar('Next Video Started!');
        },
      ),
      builder: (context, player) {
        return Scaffold(
          appBar: CommonAppBar(title: 'Video News'),
          backgroundColor: Colors.red,
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(22),
                topRight: Radius.circular(22),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  hGap20,
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Container(
                      //  height: 800,
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 180,
                            child: player,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, top: 10),
                            child: Text(
                              dates,
                              style:TextStyle(fontSize: 12),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, top: 5, right: 10),
                            child: Text(
                              titles,
                              style: hb14,
                            ),
                          ),
                          Container(
                            child: _isExpanded
                                ? AnimatedSize(
                                    reverseDuration: Duration(milliseconds: 400),
                                    duration: const Duration(milliseconds: 400),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15.0, right: 15, top: 5),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Sub Title",
                                           // style: hb14w5,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 15.0, right: 15, top: 5),
                                            child: Text(
                                              subTitle,
                                             // style: hb12,
                                              maxLines: _isExpanded ? null : 30,
                                              // overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Text(
                                            "Description",
                                            //style: hb14w5,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 15.0, right: 15, top: 5),
                                            child: Text(
                                              description,
                                              //style: hb12,
                                              maxLines: _isExpanded ? null : 30,
                                              // overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : Container(
                                    padding: EdgeInsets.zero,
                                  ),
                          ),
                          Container(
                            height: 30,
                            width: 80,
                            padding: EdgeInsets.zero,
                            //color: Colors.amber,
                            child: Center(
                              child: TextButton(
                                child: Text(
                                  _isExpanded ? readLessText : readMoreText,
                                  style: TextStyle(color:Colors.amber, fontSize: 11, fontWeight: FontWeight.w500),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isExpanded = !_isExpanded;
                                  });
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                 ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount:5,
                        itemBuilder: (BuildContext context, int index) {
                          //final videos = controller.videoNewsLists[index];
                          return indexs != index
                              ? Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: VideoCard(
                                    title: 'testing',
                                    date: '22/02/2024',
                                    imageUrl: 'assets/mainslider1.jpg',
                                    videoUrl: '',
                                    onTap: () {
                                      Get.to(() => VideoNews(
                                            index: index,
                                            title: 'testing',
                                            description: 'Video Tesing',
                                            subTitle: 'Arulmigu Mariamman',
                                            vidoeUrl:'https://www.youtube.com/watch?v=Svmvj-zNBi8',
                                            date: '22/02',
                                            imageUrl: 'assets/mainslider1.jpg',
                                            id:'',
                                          ));
                                      // setState(() {
                                      //   titles = videos.title.toString();
                                      //   indexs = index;
                                      //   dates = date(videos.date.toString());
                                      //   description = videos.descriptions.toString();
                                      //   subTitle = videos.subTitle.toString();

                                      //   // Update the video being played
                                      //   _controller.load(YoutubePlayer.convertUrlToId(videos.videoUrl) ?? '');
                                      //   _isPlayerReady = false;
                                      // }
                                      // );
                                     // VideoNewsController controller = Get.find<VideoNewsController>();
                                     // controller.update();
                                    },
                                  ))
                              : Container();
                        },
                      )
                    
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  List<Widget> customBottomActions(YoutubePlayerController controller) {
    return [
      //const SizedBox(width: 14.0),
      // IconButton(
      //   icon: Icon(controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
      //   onPressed: () => controller.value.isPlaying ? controller.pause() : controller.play(),
      // ),

      // Column(
      //   children: [
      //     Row(
      //       children: [
      //         IconButton(
      //           icon: const Icon(Icons.replay_10),
      //           onPressed: () => controller.seekTo(controller.value.position - const Duration(seconds: 10)),
      //         ),
      //         IconButton(
      //           icon: const Icon(Icons.forward_10),
      //           onPressed: () => controller.seekTo(controller.value.position + const Duration(seconds: 10)),
      //         ),
      //       ],
      //     ),
      //   ],
      // ),

      // const SizedBox(width: 18.0),
      CurrentPosition(),
      //  const SizedBox(width: 8.0),
      ProgressBar(
        isExpanded: true,
        colors: ProgressBarColors(
            backgroundColor: Colors.white30,
            bufferedColor: Colors.white70,
            playedColor: lightColorScheme.primary,
            handleColor: lightColorScheme.primary),
      ),
      RemainingDuration(),
      // PopupMenuButton<double>(
      //   iconColor: Colors.white,
      //   color: Colors.white,
      //   padding: EdgeInsets.zero,
      //   onSelected: (speed) => controller.setPlaybackRate(speed),
      //   itemBuilder: (context) => [
      //     for (final speed in [0.25, 0.5, 1, 1.5, 2]) PopupMenuItem(value: speed.toDouble(), child: Text('${speed}x'))
      //   ],
      // ),
      FullScreenButton()
    ];
  }

  String date(String data) {
    String inputDateString = data;
    DateTime inputDate = DateTime.parse(inputDateString);

    String formattedDate = DateFormat('dd-MM-yyyy').format(inputDate);
    print(formattedDate);
    return formattedDate.toString();
  }
}
