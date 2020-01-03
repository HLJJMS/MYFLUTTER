import 'package:flutter/material.dart';

typedef NumberOfSections = int Function(BuildContext context);
typedef NumberOfRowsInSections = int Function(BuildContext context,int section);

typedef CellForRowAtFIndexPath = Widget Function(BuildContext context,FIndexPath fIndexPath);
typedef ViewForHeaderInSection = Widget Function(BuildContext context,int section);
typedef ViewForFooterInSection = Widget Function(BuildContext context,int section);

typedef HeightForRowAtFIndexPath = double Function(BuildContext context,FIndexPath fIndexPath);
typedef HeightForHeaderInSection = double Function(BuildContext context,int section);
typedef HeightForFooterInSection = double Function(BuildContext context,int section);

typedef RefreshOfFTableViewBuilder = Widget Function(BuildContext context, ListView listView);

// ignore: must_be_immutable
class FTableViewPage extends StatefulWidget {
  NumberOfSections numberOfSections;
  NumberOfRowsInSections numberOfRowsInSections;

  CellForRowAtFIndexPath cellForRowAtFIndexPath;
  ViewForHeaderInSection viewForHeaderInSection;
  ViewForFooterInSection viewForFooterInSection;

  HeightForRowAtFIndexPath heightForRowAtFIndexPath;
  HeightForHeaderInSection heightForHeaderInSection;
  HeightForFooterInSection heightForFooterInSection;

  /// 刷新构建方法
  RefreshOfFTableViewBuilder refreshOfFTableViewBuilder;

  FTableViewPage(
      {
        Key key,
        this.numberOfSections,
        @required this.numberOfRowsInSections,
        @required this.cellForRowAtFIndexPath,
        this.viewForHeaderInSection,
        this.viewForFooterInSection,
        this.heightForRowAtFIndexPath,
        this.heightForHeaderInSection,
        this.heightForFooterInSection,
        this.refreshOfFTableViewBuilder,
      }) : assert(numberOfRowsInSections != null,'必须传入numberOfRowsInSections方法'),
        assert(cellForRowAtFIndexPath != null,'必须传入cellForRowAtFIndexPath方法'),
        super(key: key);

  @override
  _FTableViewPageState createState() => _FTableViewPageState();
}

class _FTableViewPageState extends State<FTableViewPage> {

  List<_ListItem> _listItems = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return _getBodyWidget();
  }


  /// 组件构建
  Widget _getBodyWidget() {
    if (widget.refreshOfFTableViewBuilder != null) {
      return widget.refreshOfFTableViewBuilder(context, _getListView());
    } else {
      return Container(
        child: _getListView(),
      );
    }
  }

  /// 创建listview
  Widget _getListView() {
    _dataProcessing();
    return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          _ListItem item = _listItems[index];
          return ConstrainedBox(
            constraints: BoxConstraints(minHeight: item.height, maxHeight: item.height),
            child: item.widget,
          );
        },
        itemCount: _listItems.length,
    );
  }


  /// 数据加工
  void _dataProcessing(){
    _listItems.clear();
    int numberOfSections = 0;
    if (widget.numberOfSections != null){
      numberOfSections = widget.numberOfSections(context);
    }
    if (numberOfSections != 0){
      for (int section = 0; section < numberOfSections; section++){
        _processingSectionHeader(section);
        _processingCell(section);
        _processingSectionFooter(section);
      }
    }else{
      _processingCell(numberOfSections);
    }
  }

  /// 处理sectionHeader
  void _processingSectionHeader(int section){
    if (widget.viewForHeaderInSection != null){
      Widget sectionHeader = widget.viewForHeaderInSection(context,section);
      double sectionHeaderHeight = 44.0;
      if (widget.heightForHeaderInSection != null){
        sectionHeaderHeight = widget.heightForHeaderInSection(context,section);
      }
      _ListItem item = _ListItem(
          widget: sectionHeader,
          height: sectionHeaderHeight,
          section: section
      );
      _listItems.add(item);
    }else{
      _ListItem item = _ListItem(
          widget: Container(),
          height: 0,
          section: section
      );
      _listItems.add(item);
    }
  }

  /// 处理sectionFooter
  void _processingSectionFooter(int section){

    if (widget.viewForFooterInSection != null){
      Widget sectionFooter = widget.viewForFooterInSection(context,section);
      double sectionFooterHeight = 44.0;
      if (widget.heightForFooterInSection != null){
        sectionFooterHeight = widget.heightForFooterInSection(context,section);
      }
      _ListItem item = _ListItem(
          widget: sectionFooter,
          height: sectionFooterHeight,
          section: section
      );
      _listItems.add(item);
    }else{
      _ListItem item = _ListItem(
          widget: Container(),
          height: 0,
          section: section
      );
      _listItems.add(item);
    }
  }


  void _processingCell(int section){
    int rowsInSection = widget.numberOfRowsInSections(context,section);
    if (rowsInSection != 0){
      for (int row = 0; row < rowsInSection; row++){
        FIndexPath indexPath = FIndexPath(section: section,row: row);
        Widget rowWidget = widget.cellForRowAtFIndexPath(context,indexPath);
        double rowHeight = 44.0;
        if (widget.heightForRowAtFIndexPath != null){
          rowHeight = widget.heightForRowAtFIndexPath(context,indexPath);
        }
        _ListItem item = _ListItem(
            widget: rowWidget,
            height: rowHeight,
            section: section
        );
        _listItems.add(item);
      }
    }else{
      _ListItem item = _ListItem(
          widget: Container(),
          height: 0,
          section: section
      );
      _listItems.add(item);
    }
  }


}










class FIndexPath{
  FIndexPath({
    this.section = 0,
    @required this.row,
  });
  final int section;
  final int row;
}

class _ListItem{
  _ListItem({
    this.fIndexPath,
    this.height = 44.0,
    @required this.widget,
    this.section = 0,
  });
  /// 为null时是section
  final FIndexPath fIndexPath;
  final double height;
  final Widget widget;
  final int section;
}