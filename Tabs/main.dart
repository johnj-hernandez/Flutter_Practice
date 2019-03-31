import 'package:flutter/material.dart';
import 'package:flutter_tab/pages/contact.dart';
import 'package:flutter_tab/pages/video.dart';
import 'package:flutter_tab/pages/home.dart';
import 'package:flutter_tab/pages/settings.dart';
void main() {
  runApp( MaterialApp(
   home: MyTabs(),
  ));
}


class MyTabs extends StatefulWidget {
  @override
  _MyTabsState createState() =>  _MyTabsState();
 }


class _MyTabsState extends State<MyTabs>  with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
      // TODO: implement initState
      super.initState();
      controller =  TabController(length: 4, vsync: this);
    }
  @override
  Widget build(BuildContext context) {
   return  Scaffold(
     appBar:  AppBar(
       title:  Text("Video Tabs"),
       backgroundColor: Colors.redAccent,
       bottom:  TabBar(
         tabs: <Widget>[
            Tab(
             icon:  Icon(Icons.home),
           ),
           Tab(
             icon:  Icon(Icons.ondemand_video),
           ),
           Tab(
             icon:  Icon(Icons.contacts),
           ),
           Tab(
             icon: Icon(Icons.settings)
           )
         ],
         controller: controller,
       ),
     ),
    body:  TabBarView(
      children: <Widget>[
          Home(),  Video(),  Contact(),Setting()
      ],
      controller: controller
    )
   );
  }
}