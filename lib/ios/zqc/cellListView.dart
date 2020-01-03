import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'cellZqc.dart';

class CellListViewZqc extends StatelessWidget {
  ScrollController _listViewController = ScrollController();

  final List<ListItem> array;
  final ValueChanged<int> onChanged;
  final int index;
  CellListViewZqc({
    Key key,
    this.onChanged,
    this.index,
    this.array,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    _listViewController.addListener(() {
      print('=============================');
      print('offset: ${_listViewController.offset}');
      if (_listViewController.position.pixels ==
          _listViewController.position.maxScrollExtent) {
        print('滑动到了最底部');
      }
    });
    return _buildListCell();
  }

  /* MARK: 创建每个cell
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _buildListCell() {
    return Column(
      children: <Widget>[
        _buildInfo(),
        Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: _buildlistInCell(),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.grey,
              ),
            )
          ],
        ),
      ],
    );
  }

  /* MARK:介绍
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _buildInfo() {
    return Container(
      color: Colors.green,
      width: double.infinity,
      padding: EdgeInsets.all(10),
      //color: Colors.yellowAccent,
      child: Text(
        array[index].infomation,
        maxLines: null,
        softWrap: true,
      ),
    );
  }

  Widget _buildlistInCell() {
    return ListView.builder(
      scrollDirection:
          Axis.vertical, //设置滑动方向 Axis.horizontal 水平  默认 Axis.vertical 垂直
      shrinkWrap: true, //多用于嵌套listView中 内容大小不确定
      padding: EdgeInsets.all(0), //内边距
      reverse: false,
      physics: AlwaysScrollableScrollPhysics(),
      itemCount: array.length, //数量
      controller: _listViewController,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: _buildCell(index),
        );
      },
    );
  }

  /* MARK: buidCell
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _buildCell(int index) {
    return CellZqc(
      onChanged: (index) {
        onChanged(index);
      },
      index: index,
      array: this.array,
    );
  }
}
