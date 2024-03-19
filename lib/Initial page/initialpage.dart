import 'package:flutter/material.dart';

import 'package:sreeselvavinayagartemple/Launchpages/launch.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 9),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _controller.forward().then((_) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LaunchPage()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/initialimage1.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        // Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       SlideTransition(
        //         position: _offsetAnimation,
        //         child: Image.asset(
        //           'assets/amman.png',
        //           width: MediaQuery.of(context).size.width,
        //           height: 820,
        //           fit: BoxFit.cover,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
