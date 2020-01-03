import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/android/zlc/MyPaint.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'refreshHeaderFooterZqc.dart';
import 'cellZqc.dart';
import 'cellListView.dart';
import 'listItemsZqc.dart';
import 'gridViewZqc.dart';

import 'package:flutter_section_table_view/flutter_section_table_view.dart';
import 'package:flutter_tableview/flutter_tableview.dart';

class ZQCSectionTableView extends StatefulWidget {
  @override
  _ZQCSectionTableViewState createState() => _ZQCSectionTableViewState();
}

class _ZQCSectionTableViewState extends State<ZQCSectionTableView> {
  final controller = SectionTableController(
      sectionTableViewScrollTo: (section, row, isScrollDown) {
    print('received scroll to $section $row scrollDown:$isScrollDown');
  });

  bool isEmptyShow = true;
  List<List> array = List();
  //List<ListItem> array = List();
  final urlStr =
      'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1246190829,2813517358&fm=11&gp=0.jpg';
  final backUrlStr =
      'http://file02.16sucai.com/d/file/2014/1006/e94e4f70870be76a018dff428306c5a3.jpg';
  @override
  void initState() {
    super.initState();
    getData();
  }

  //处理字符串
  String _subString(int index) {
    String subStr = '';
    for (var i = 0; i <= index; i++) {
      subStr = subStr + '小明是   萨德何时放假都好几个用法体检卡复印看过呀流量好的一脚踢开如科技园退款';
    }
    return subStr;
  }

  /* MARK: 模仿网络获取
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Future getData() async {
    await Future.delayed(Duration(seconds: 1), () {
      if (!mounted) return;
      setState(() {
        // List<ListItem> items = List.generate(
        //     10,
        //     (int row) => ListItem(10 + row, '小明$row', urlStr, _subString(row),
        //         false, backUrlStr));

        //array = List.generate(3, (int section) => items);
        for (var i = 0; i < 3; i++) {
          List<ListItem> items = List.generate(
              10,
              (int row) => ListItem(10 + row, '小明$row', urlStr, _subString(row),
                  false, backUrlStr));
          array.add(items);
        }
        // array = List.generate(
        //     3,
        //     (int section) => List.generate(
        //         10,
        //         (int row) => ListItem(10 + row, '小明$row', urlStr,
        //             _subString(row), false, backUrlStr)));
      });
      isEmptyShow = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('ListView'),
          leading: IconButton(
            icon: ImageIcon(new AssetImage('assets/image/nav_back.png')),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        //body: _buildSectionTableView(),
        body: _buildTablceView(),
      ),
    );
  }

  Widget _buildSectionTableView() {
    return SectionTableView(
      sectionCount: array.length,
      numOfRowInSection: (section) {
        return array[section].length;
      },
      cellAtIndexPath: (section, row) {
        return _buildCell(section, row);
      },
      headerInSection: (section) {
        return Container(
          height: 30 * (section + 1).toDouble(),
          color: Colors.orange,
          child: Text('$section'),
        );
      },
      //controller: controller,
    );
  }

  /* MARK: buidCell
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _buildCell(int section, int row) {
    return CellZqc(
      onTwoChanged: (section, row) {
        _onOffSwitch(section, row);
      },
      section: section,
      index: row,
      array: this.array[section],
    );
  }

  // 隐藏显示介绍
  _onOffSwitch(int section, int row) {
    print('section: $section row: $row');
    ListItem item = array[section][row];
    print(item.isShow);

    item.isShow = item.isShow == true ? false : true;
    print(item.isShow);

    List bools = List();
    for (var i = 0; i <= 2; i++) {
      List iboo = List();
      for (var item in array[i]) {
        iboo.add(item.isShow);
      }
      bools.add(iboo);
    }
    print(bools);
    if (!mounted) return;
    setState(() {});
  }

  /* MARK: flutter_tableview
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  // Get row count.
  int _rowCountAtSection(int section) {
    return 5;
  }

  // Section header widget builder.
  Widget _sectionHeaderBuilder(BuildContext context, int section) {
    return InkWell(
      onTap: () {
        print('click section header. -> section:$section');
      },
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 16.0),
        color: Color.fromRGBO(220, 220, 220, 1),
        height: 100,
        child: Text('I am section header -> section:$section'),
      ),
    );
  }

  // cell item widget builder.
  Widget _cellBuilder(BuildContext context, int section, int row) {
    return InkWell(
      onTap: () {
        print('click cell item. -> section:$section row:$row');
      },
      child: Container(
        padding: EdgeInsets.only(left: 16.0),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
          color: Color.fromRGBO(240, 240, 240, 1),
        ))),
        height: 50.0 * (row + 1),
        child: Text('I am cell -> section:$section  row$row'),
      ),
    );
  }

  // Each section header height;
  double _sectionHeaderHeight(BuildContext context, int section) {
    return 50.0;
  }

  // Each cell item widget height.
  double _cellHeight(BuildContext context, int section, int row) {
    return 50.0 * (row + 1);
  }

  Widget _buildTablceView() {
    return FlutterTableView(
      sectionCount: 3,
      rowCountAtSection: _rowCountAtSection,
      sectionHeaderBuilder: _sectionHeaderBuilder,
      cellBuilder: _cellBuilder,
      sectionHeaderHeight: _sectionHeaderHeight,
      cellHeight: _cellHeight,
      physics: AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      cacheExtent: 200.0,
    );
  }
}
