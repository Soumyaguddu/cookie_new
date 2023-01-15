import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'cookie_details.dart';
import 'models/Catalog.dart';

class CookiePage extends StatefulWidget {
  const CookiePage({Key? key}) : super(key: key);
  @override

  @override
  State<CookiePage> createState() => _CookiePageState();
}

class _CookiePageState extends State<CookiePage> {
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 3));
    var catalogJson = await rootBundle.loadString("assets/assets/catalog.json");

    var decodeData = jsonDecode(catalogJson);
    var productData = decodeData["products"];
    if (kDebugMode) {
      print(productData);
    }
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFAF8),
      body: SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          const SizedBox(height: 15.0),
          Container(
            padding: const EdgeInsets.only(right: 15.0),
            width: MediaQuery.of(context).size.width - 30.0,
            height: MediaQuery.of(context).size.height - 50.0,

            child: GridView.count(
              crossAxisCount: 2,
              primary: false,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 15.0,
              childAspectRatio: 0.8,


              children: <Widget>[
                for ( var i in CatalogModel.items)
                  _buildCard(i.name.toString(), '\$${i.price}',i.desc, i.image, i.added, i.isFavorite, context)
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget _buildCard(String name, String price,String desc, String imgPath, bool added,
      bool isFavorite, context) {
    return Padding(
      padding:
           const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
      child: InkWell(
        onTap: () {

          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => CookieDetail(
                  imgPath: imgPath,
                  cookieprice:price,
                  cookiename: name,
                 desc:desc,
              )));
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.9),
                    spreadRadius: 3.0,
                    blurRadius: 8.0)
              ],
              color: Colors.white),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    isFavorite
                        ? const Icon(Icons.favorite, color: Color(0xFFEF7532))
                        : const Icon(Icons.favorite_border,
                            color: Color(0xFFEF7532))
                  ],
                ),
              ),
              Hero(
                  tag: imgPath,
                  child: Container(
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(imgPath), fit: BoxFit.contain)),
                  )),
              const SizedBox(height: 5.0),
              Text(
                price,
                style: const TextStyle(
                    color: Color(0xFFCC8053),
                    fontFamily: "Varela",
                    fontSize: 14.0),
              ),
              Text(name,
                  style: const TextStyle(
                      color: Color(0xFF575E67),
                      fontFamily: 'Varela',
                      fontSize: 14.0)),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      Container(color: const Color(0xFFEBEBEB), height: 1.0)),
              Padding(
                  padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (!added) ...[
                        const Icon(Icons.shopping_basket,
                            color: Color(0xFFD17E50), size: 12.0),
                        const Text('Add To Cart',
                            style: TextStyle(
                                fontFamily: 'Varela',
                                color: Color(0xFFD17E50),
                                fontSize: 12.0))
                      ],
                      if (added) ...[
                        const Icon(Icons.remove_circle_outline,
                            color: Color(0xFFD17E50), size: 12.0),
                        const Text('3',
                            style: TextStyle(
                                fontFamily: 'Varela',
                                color: Color(0xFFD17E50),
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0)),
                        const Icon(Icons.add_circle_outline,
                            color: Color(0xFFD17E50), size: 12.0),
                      ]
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
