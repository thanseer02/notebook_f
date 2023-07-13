import 'package:flutter/material.dart';
import 'package:notebook/camera.dart';
import 'package:notebook/home.dart';
class pages extends StatefulWidget {
  const pages({super.key});

  @override
  State<pages> createState() => _pagesState();
}

class _pagesState extends State<pages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: home(),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            child: camera(),
          )

        ],
      ),
    );
  }
}
