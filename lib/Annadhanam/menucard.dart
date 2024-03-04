import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MenuCard extends StatefulWidget {
  const MenuCard({super.key});

  @override
  State<MenuCard> createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(
          child: AutoSizeText('Annathanam'),
        ),
        leading: Padding(padding: EdgeInsets.all(8),
        child: CircleAvatar(
          backgroundColor: Colors.white,
        ),
        ),
      ),
    );
  }
}