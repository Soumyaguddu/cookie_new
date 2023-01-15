import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const imageUrl="https://i.picsum.photos/id/1003/200/200.jpg?hmac=w2SN03yog7_RB-IfnyWX1FtBjSHebnoWD35Lj4-iV7o";
    return  Drawer(
       child:Container(

         child: ListView(
           padding: EdgeInsets.zero,
          children:  const [
            DrawerHeader(
              padding: EdgeInsets.zero,

                child:  UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(color: kPrimaryColor),
              accountName: Text("Soumyajit"),
              accountEmail: Text("sensoumyajit73@gmail.com"),
                  currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage(imageUrl),),
            )),
            ListTile(
              leading: Icon(CupertinoIcons.home,color: Colors.black),
              title: Text("Home",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20)),

              

            ),
            ListTile(
              leading: Icon(CupertinoIcons.profile_circled,color: Colors.black),
              title: Text("Profile",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20)),



            )

          ],
      ),

       ),
    );
  }
}
