import 'dart:async';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/ios/zqc/ListViewzqc.dart';
import 'package:flutter_app/ios/zqc/gridViewZqc.dart';
import 'package:flutter_app/util/routerUtil.dart';
import 'zqcTabbarViewTest.dart';
import 'zqcCustomScrollView.dart';
import 'extendedNestedScrollView.dart';
import 'warterFallZqc.dart';
import 'sectionTableView.dart';
import 'customScrollSlivers.dart';

class BooksZQCView extends StatefulWidget {
  // This class is the configuration for the state. It holds the
  // values (in this nothing) provided by the parent and used by the build
  // method of the State. Fields in a Widget subclass are always marked "final".

  @override
  BooksZQCViewState createState() => new BooksZQCViewState();
}

class BooksZQCViewState extends State<BooksZQCView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //title: 'Flutter Demo',
        theme: ThemeData(primaryColor: Colors.white),
        home: new Scaffold(
          appBar: new AppBar(
            elevation: 0, //去掉appbar底部线和阴影
            leading: IconButton(
                icon: ImageIcon(new AssetImage('assets/image/nav_back.png')),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
          body: Column(
            children: <Widget>[
              FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text("注册"),
                onPressed: () {
                  //Navigator.pushNamed(context, "zqcReg");
                  //Application.router.navigateTo(context, "zqcReg");
                  RouterUtil.navigateTo(
                    context,
                    "zqcReg",
                    clearStack: false,
                    transType: TransitionType.inFromRight,
                  );
                },
              ),
              FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: new Text(
                  'ListView',
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new ListViewqzc(
                                pageKey: PageStorageKey('zqcListView'),
                              )));
                },
              ),
              FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: new Text(
                  'GridView',
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new GridViewZqc()));
                },
              ),
              FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: new Text(
                  'WarterFall',
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new WarterFallZqc()));
                },
              ),
              FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: new Text(
                  'SectionTableView',
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new ZQCSectionTableView()));
                },
              ),
              FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: new Text(
                  'CustomScrollSliver',
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new CustomScrollSlivers()));
                },
              ),
              FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: new Text(
                  'NestedScrollView',
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new ZqcTabbarView()));
                },
              ),
              FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: new Text(
                  'CustomScrollView',
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new ZqcCustomScrollView()));
                },
              ),
              FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: new Text(
                  'ExtenedNestedScrollView',
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new ExtenedNestedScrollView()));
                },
              ),
            ],
          ),
        ));
  }
}
