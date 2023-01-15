import 'package:flutter/material.dart';
class BackGround extends StatelessWidget {
  final Widget child;
  final String topImage, bottomImage;
  const BackGround({Key? key,
    required this.child,
    this.topImage = "assets/images/main_top.png",
    this.bottomImage = "assets/images/login_bottom.png",}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(top:0,bottom:0,child: Image.asset(topImage,width: 120)),
            SafeArea(child: child),
          ],
        ),
      ),
    );
  }
}
