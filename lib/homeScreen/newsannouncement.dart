// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sreeselvavinayagartemple/themes/font_height.dart';

class ArticalNews extends StatefulWidget {
  String title;
  String subTitle;
  String description;
  String date;
  String image;
  final List<String> imageSlider;
  ArticalNews({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.description,
    required this.date,
    required this.image,
    required this.imageSlider,
  }) : super(key: key);

  @override
  State<ArticalNews> createState() => _ArticalNewsState();
}

class _ArticalNewsState extends State<ArticalNews> {
  List<String> imageList = [];
  CarouselController carouselController = CarouselController();

  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: 'Latest News And Updates',
      ),
      backgroundColor: Colors.amberAccent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        //   height: MediaQuery.of(context).size.height - 90,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(22),
            topRight: Radius.circular(22),
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10, top: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                hGap30,
                Text(
                  'Today New',
                ),
                hGap10,
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color.fromARGB(255, 231, 231, 231),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      widget.imageSlider.isNotEmpty
                          ? Container(
                              height: 200,
                              // color: Colors.amber,
                              width: double.infinity,
                              child: CarouselSlider(
                                carouselController: carouselController,
                                options: CarouselOptions(
                                    autoPlayAnimationDuration:
                                        Duration(milliseconds: 700),
                                    autoPlayInterval: Duration(seconds: 3),
                                    autoPlayCurve: Curves.linear,
                                    height: 200.0,
                                    autoPlay: true,
                                    viewportFraction: 1),
                                items: widget.imageSlider.map((imageUrl) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return Card(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        elevation: 6,
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          // margin: EdgeInsets.symmetric(horizontal: 5.0),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            image: DecorationImage(
                                              image: NetworkImage(imageUrl),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }).toList(),
                              ),
                            )
                          : Container(
                              height: 200,

                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.amber,
                                  image: DecorationImage(
                                      image: NetworkImage(widget.image),
                                      fit: BoxFit.fill)),
                              // child: NetworkImage(
                              //   "assets/images/dummy/news.png",
                              //   fit: BoxFit.fill,
                              // )
                            ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Spacer(),
                                Text(
                                  widget.date,
                                  //style: hb12w5,
                                ),
                              ],
                            ),
                            hGap10,
                            Text(
                              widget.title,
                              //style: hb16w5,
                            ),
                            hGap10,
                            Text(
                              widget.subTitle,
                              style: hb14,
                            ),
                            hGap10,
                            Text(
                              'Description',
                              //style: hb16w5,
                            ),
                            hGap10,
                            Text(widget.description),
                            hGap30
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                hGap20
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/////////////////////////////////////////////////////////////////////////////////////////////////////
class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CommonAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widths = MediaQuery.of(context).size.width;
    final heights = MediaQuery.of(context).size.height;
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: heights *
          (MediaQuery.of(context).orientation == Orientation.portrait
              ? 0.1
              : 0.2),
      backgroundColor: Colors.red,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () => Get.back(),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 35,
              width: 35,
              child: const Center(
                child: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 0.0),
            child: Text(
              title,
              //style: hw18w5
            ),
          ),
          Container(
            width: 20,
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
/////////////////////////////////////////////////////////////////////////////////////////
class VideoCard extends StatelessWidget {
  final String title;
  final String date;
  final String imageUrl;
  final String videoUrl;
  final VoidCallback? onTap;

  const VideoCard({
    Key? key,
    required this.title,
    required this.date,
    required this.imageUrl,
    required this.videoUrl,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        child: Container(
         
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 185, 199, 225), borderRadius: BorderRadius.circular(12)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: 90,
                decoration: BoxDecoration(
                  color: Colors.grey[700],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(0)),
                  image: DecorationImage(
                    image: AssetImage(imageUrl),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(width: 10), 
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 13,right: 6,bottom: 2,left: 5),
                      child: Text(
                        title,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200,fontFamily: 'Poppins'),
                      ),
                    ),
                    Spacer(), 
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          date,
                          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

