import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//注意 typedef 需要放在class外面
typedef IndexCallback = void Function(int section, int index);

class CellZqc extends StatelessWidget {
  final List<ListItem> array;
  final ValueChanged<int> onChanged;
  final IndexCallback onTwoChanged;
  final int index;
  final int section;
  CellZqc({
    Key key,
    this.onChanged,
    this.index,
    this.array,
    this.section,
    this.onTwoChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildCell();
  }

  /* MARK: 创建每个cell
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _buildCell() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Container(
        //color: Colors.cyan,
        width: double.infinity,
        constraints: BoxConstraints(maxHeight: double.infinity, minHeight: 20),
        decoration: BoxDecoration(
            color: Colors.cyan,
            //image: NetworkImage(array[index].backPicUrl),
            image: DecorationImage(
              image: NetworkImage(
                array[index].backPicUrl,
              ),
              fit: BoxFit.fill,
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildNameRow(),
            _buildInfo(),
            _buildComment(),
          ],
        ),
      ),
    );
  }

  /* MARK: 姓名，年龄等
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _buildNameRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
            child: Image.network(
              array[index].picUrl,
              height: 50,
              width: 50,
              fit: BoxFit.fill,
            )),
        Padding(
          padding: EdgeInsets.only(left: 5, top: 10),
          //child: Text(array[index].name),
          child: Column(
            children: <Widget>[
              Text(array[index].name),
              IconButton(
                icon: Icon(
                  Icons.info,
                  color: Colors.yellow,
                ),
                onPressed: () {
                  _onOffSwitch();
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 5, top: 10),
          child: Text(array[index].age.toString() + '岁'),
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
    return Offstage(
      offstage: !array[index].isShow,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        //color: Colors.yellowAccent,
        child: Text(
          array[index].infomation,
          maxLines: null,
          softWrap: true,
        ),
      ),
    );
  }

  /* MARK: 评论
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _buildComment() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      //color: Colors.yellowAccent,
      child: TextField(
        style: TextStyle(
          fontSize: 17,
          color: Color.fromRGBO(51, 51, 51, 1),
        ),
        decoration: InputDecoration(
            hintText: '请评论',
            hintStyle: TextStyle(
              fontSize: 17,
              color: Colors.lightBlue,
            ),
            suffixIcon: Icon(
              Icons.keyboard_return,
              color: Colors.lightBlue,
            )),
      ),
    );
  }

  /* MARK: 隐藏显示介绍
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  _onOffSwitch() {
    this.section == null
        ? onChanged(index)
        : onTwoChanged(this.section, this.index);
    //onChanged(index);
  }
}

/* MARK: Model
 * @LastEditors: 郑群昌
 * @Version: 版本号, YYYY-MM-DD
 * @param {type} 
 * @return: 
 * @Deprecated: 否
 */
class ListItem {
  int age;
  String name;
  String picUrl;
  String backPicUrl;
  String infomation;
  bool isShow;
  ListItem(this.age, this.name, this.picUrl, this.infomation, this.isShow,
      this.backPicUrl);
}
