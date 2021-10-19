import 'package:flutter/material.dart';
import 'package:learn/common/global/public.dart';

class BackPictureWidget extends StatelessWidget {
  final Widget content;
  BackPictureWidget({
    Key? key,
    required this.content,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GlobalColor.c30,
        body: Stack(
          children: [
            Positioned(
              width: GlobalSize.width,
              height: GlobalSize.height,
              child: Image.asset(
                'assets/bg.png',
                fit: BoxFit.fill,
                width: GlobalSize.width,
                height: GlobalSize.height,
              ),
            ),
            Container(
              child: content,
            )
          ],
        ));
  }
}
