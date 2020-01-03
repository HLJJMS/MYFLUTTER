import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'cellZqc.dart';

class ZQCListTitle extends StatelessWidget {
  final ListItem item;
  final int index;
  ZQCListTitle({
    Key key,
    this.index,
    this.item,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return _buildListTitle();
  }

  Widget _buildListTitle() {
    return ListTile(
      leading: new Icon(Icons.list),
      title: new Text(item.name),
      subtitle: Text(
        item.infomation,
        maxLines: null,
        softWrap: true,
      ),
      trailing: new Icon(Icons.keyboard_arrow_right),
      isThreeLine: true,
      dense: true,
      contentPadding: EdgeInsets.all(20),
      enabled: true,
      //selected: true,
      onTap: () {},
      onLongPress: () {},
    );
  }
}
