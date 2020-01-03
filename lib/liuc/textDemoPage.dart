/*
 * @Description: text控件练习类
 * @Author: 刘驰
 * @Date: 2019-11-15 21:31:28
 * @Version: 版本号, YYYY-MM-DD
 * @LastEditors: 刘驰
 * @LastEditTime: 2019-11-18 14:28:06
 * @Deprecated: 否
 */
import 'package:flutter/material.dart';

class TextDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TextDemoPage();
  }
}

class _TextDemoPage extends State<TextDemoPage> {

  String _noticeTxt;     //公告文本

  void _onNoticeClick(String id) {
    // Navigator.pushNamed(context, "lc/tapboxCPage");
    print("公告栏目被点击id:$id");
  }


  /*
   * @Description: 修改公告组件显示内容
   * @LastEditors: 刘驰
   * @Version: v1.0, 2019-11-16
   * @param {
   *  String newTxt 公告新内容
   * } 
   * @return: void
   * @Deprecated: 否
   */
  void _noticeTxtChange(String newTxt) {
    setState(() {
      _noticeTxt = newTxt;
    });
    
  }

  @override
  void initState() {
    super.initState();
    print("initState........");
    _noticeTxt = "在定义方法的时候，可以使用 = 来定义可选参数的默认值。 默认值只能是编译时常量。 如果没有提供默认值，则默认值为 null";
  }

  @override
  Widget build(BuildContext context) {
    print("build::::");
    return Scaffold(
      appBar: AppBar(
        title: Text("Text练习"),
      ),
      body: Column(
        children: <Widget>[
          SingleNotice(
            noticeId: "123",
            icon: Icon(
              Icons.error_outline,
              color: Colors.red,
            ),
            noticeTxt: _noticeTxt,
            onClick: _onNoticeClick,
          ),
          FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: Text("修改公告内容"),
            onPressed: () {
              print("翛公告内容按钮点");
              // setState(() {
              //   this.noticeTxt = "如上图所示，点击“Open Observatory”,之后会打开如下图5所示的网页";
              // });
                _noticeTxtChange("如上图所示，点击“Open Observatory”,之后会打开如下图5所示的网页");
              // _handleTapboxChanged(!_active);
            },
          )
        ],
      )
    );
  }
}

/*
 * @Description: 单行公告组件
 * @LastEditors: 刘驰
 * @Version: v1.0, 2019-11-16
 * @param {void} 
 * @return: 
 * @Deprecated: 否
 */
class SingleNotice extends StatelessWidget {
  final Icon icon;
  final String noticeTxt;
  final ValueChanged<String> onClick;
  final String noticeId;
  
  const SingleNotice({Key key, this.icon, this.noticeTxt, this.onClick, this.noticeId}) : super(key: key);

  void _handleTap() {
    onClick(noticeId);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child:Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(5),
        color: Colors.lightGreenAccent,
        height: 35,
        child: Row(
          children: <Widget>[
            icon,
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
            ),
            Expanded(
              child:Text(
              // active ? noticeTxt : 'Inactive222',
              noticeTxt,
              overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        )
      )
    );
  }
}