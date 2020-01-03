import 'package:flutter/material.dart';
import 'cellZqc.dart';

class SliverListViewZqc extends StatelessWidget {
  final ValueChanged<int> onChanged;
  final List<ListItem> array;
  SliverListViewZqc({this.array, this.onChanged});
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return _buildCell(index);
        },
        childCount: array.length,
      ),
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
        //_onOffSwitch(index);
        onChanged(index);
      },
      index: index,
      array: this.array,
    );
  }
}
