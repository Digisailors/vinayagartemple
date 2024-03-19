import 'package:flutter/material.dart';
import 'package:introduction_slider/introduction_slider.dart';
import 'package:sreeselvavinayagartemple/homeScreen/homepage.dart';

class LaunchNewPage extends StatefulWidget {
  const LaunchNewPage({super.key});

  @override
  State<LaunchNewPage> createState() => _LaunchNewPageState();
}

class _LaunchNewPageState extends State<LaunchNewPage> {
  @override
  Widget build(BuildContext context) {
    return IntroductionSlider(
      items: const [
        IntroductionSliderItem(
         // logo: FlutterLogo(),
          //title: Text("Title 1"),
         backgroundImageDecoration: BackgroundImageDecoration(image:ExactAssetImage('assets/gana2.png')),
        ),
       
        IntroductionSliderItem(
         // logo: FlutterLogo(),
        //  title: Text("Title 3"),
         backgroundImageDecoration: BackgroundImageDecoration(image:ExactAssetImage('assets/gana1.png')),
        ),
      ],
      done: Done(
        child: const Icon(Icons.done),
        home: Homepage(),
      ),
      next: const Next(child: Icon(Icons.arrow_forward)),
      back: const Back(child: Icon(Icons.arrow_back)),
      dotIndicator: const DotIndicator(),
    
      scrollDirection: Axis.horizontal,
      initialPage: 0,
    );
  }
}