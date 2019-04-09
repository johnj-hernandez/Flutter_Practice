
import 'package:flutter/material.dart';
import 'package:operations_tabs/pages/division.dart';
import 'package:operations_tabs/pages/multiplicacion.dart';
import 'package:operations_tabs/pages/resta.dart';
import 'package:operations_tabs/pages/suma.dart';


void main() {
  runApp( MaterialApp(
    home: MyTabs(),
  ));
}

class MyTabs extends StatefulWidget {
  @override
  _MyTabsState createState() => _MyTabsState();
}

class _MyTabsState extends State<MyTabs> with TickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =  TabController(length: 4,vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar:  AppBar(
          title:  Text("Operations with tabs"),
          backgroundColor: Colors.redAccent,
          bottom:  TabBar(
            tabs: <Widget>[
              Tab(
                icon:  Icon(Icons.add),
              ),
              Tab(
                icon:  Icon(Icons.minimize),
              ),
              Tab(
                icon:  Icon(Icons.clear),
              ),
              Tab(
                  icon: Icon(Icons.games)
              )
            ],
            controller: controller,
          ),
        ),
        body:  TabBarView(
            children: <Widget>[
              Suma(),  Resta(),  Division(),Multiplicacion()
            ],
            controller: controller
        )
    );
  }
}
