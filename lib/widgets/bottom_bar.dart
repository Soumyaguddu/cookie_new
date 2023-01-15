import 'package:flutter/material.dart';

import '../constants.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 6.0,
      color: Colors.transparent,
      elevation: 10.0,
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: 50.0,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0)),
            color: Colors.white
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 50.0,
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 2 - 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const <Widget>[
                  Icon(Icons.home, color: kPrimaryColor),
                  Icon(Icons.percent_outlined, color: Colors.grey)
                ],
              ),
            ),
            SizedBox(
              height: 50.0,
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 2 - 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const <Widget>[
                  Icon(Icons.search, color: Colors.grey),
                  Icon(Icons.shopping_basket, color: Colors.grey)
                ],
              ),
            )
          ],
        ),
      ),

    );
  }
}
