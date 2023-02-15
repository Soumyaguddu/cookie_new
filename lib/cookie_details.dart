import 'package:flutter/material.dart';

import 'constants.dart';
import 'widgets/bottom_bar.dart';

class CookieDetail extends StatelessWidget {
  final imgPath, cookieprice, cookiename,desc;

  const CookieDetail({super.key, this.imgPath, this.cookieprice, this.cookiename, this.desc });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.grey),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Pick Up',
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF545D68))),
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none,
                  color: Color(0xFF545D68)))
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 15.0),
          const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text('Cookie',
                  style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF17532)))),
          const SizedBox(height: 15.0),
          Image.network(imgPath,
              height: 150.0, width: 150.0, fit: BoxFit.contain),
          const SizedBox(height: 20.0),
          Center(
            child: Text(
              cookieprice,
              style: const TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF17532)),
            ),
          ),
          const SizedBox(height: 10.0),
          Center(
            child: Text(cookiename,
                style: const TextStyle(
                    color: Color(0xFF575E67),
                    fontFamily: 'Varela',
                    fontSize: 24.0)),
          ),
          const SizedBox(height: 20.0),
          Center(
              child: SizedBox(
                  width: MediaQuery.of(context).size.width - 50.0,
                  child:  Text(
                      desc,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontFamily: 'Varela',
                          fontSize: 16.0,
                          color:Colors.grey)))),
          const SizedBox(height: 20.0),
          Center(
              child: Container(
                  width: MediaQuery.of(context).size.width - 30.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: const Color(0xFFF17532)),
                  child: const Center(
                      child: Text(
                    'Add to cart',
                    style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ))))
        ],
      ),


    );
  }
}
