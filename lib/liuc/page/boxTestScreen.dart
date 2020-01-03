import 'package:flutter/material.dart';

class BoxTestScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BoxTestScreen();
  }
}

class _BoxTestScreen extends State<BoxTestScreen> {
  @override
  Widget build(BuildContext context) {
    // 根据外面的修饰去修改child里的组件
    return Scaffold(
      appBar: AppBar(
        title: Text("容器练习"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(5),
            ),
            getFittedBox(context),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            getAspectRatio(context),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            getFittedBox(context),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            getConstainedBox(context),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            getLimitedBox(context),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            getOffstage(context),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            getOverflowBox(context),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            getSizeBox(context),
            Padding(
              padding: EdgeInsets.all(15),
            ),
            getTransform(context),
            Padding(
              padding: EdgeInsets.all(15),
            ),
            getStack(context),
            Padding(
              padding: EdgeInsets.all(15),
            ),
            getFlex(context),
            Padding(
              padding: EdgeInsets.all(15),
            ),
            getWrap(context),
            Padding(
              padding: EdgeInsets.all(15),
            ),
            getDivider(context),
            getCard(context),
            Padding(
              padding: EdgeInsets.all(15),
            ),
            getOpacity(context),
            Padding(
              padding: EdgeInsets.all(15),
            ),
            getDecorateBox(context),
            Padding(
              padding: EdgeInsets.all(15),
            ),
            getClipOval(context),
          ],
        ),
      ),
    );
  }
}

/* MARK: 裁剪组件
 * @LastEditors: 刘驰
 * @Version: 版本号, YYYY-MM-DD
 * @param {type} 
 * @return: 
 * @Deprecated: 否
 */
Widget getClipOval(BuildContext context) {
  return ClipOval(
    child: Container(
      color: Colors.red,
      width: 100,
      height: 100,
    ),
    clipBehavior: Clip.hardEdge,
  );
}

/* MARK: 对内容的边框、背景进行修饰
 * @LastEditors: 刘驰
 * @Version: 版本号, YYYY-MM-DD
 * @param {type} 
 * @return: 
 * @Deprecated: 否
 */
Widget getDecorateBox(BuildContext context) {
  return Container(
    child: DecoratedBox(
      // 与Container组件配置decoration属性的作用一致
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.red,
      ),
    ),
    width: MediaQuery.of(context).size.width - 20,
    height: 100,
  );
}

/* MARK: 控制透明度
 * @LastEditors: 刘驰
 * @Version: 版本号, YYYY-MM-DD
 * @param {type} 
 * @return: 
 * @Deprecated: 否
 */
Widget getOpacity(BuildContext context) {
  return Opacity(
    child: Image.asset("assets/image/banner.png"),
    opacity: 0.5,
  );
}

/* MARK: 分隔线布局
 * @LastEditors: 刘驰
 * @Version: 版本号, YYYY-MM-DD
 * @param {type} 
 * @return: 
 * @Deprecated: 否
 */
Widget getDivider(BuildContext context) {
  return Divider(
    height: 1,
    indent: 30,
    endIndent: 30,
    color: Colors.black26,
  );
}

/* MARK: 卡片布局
 * @LastEditors: 刘驰
 * @Version: 版本号, YYYY-MM-DD
 * @param {type} 
 * @return: 
 * @Deprecated: 否
 */
Widget getCard(BuildContext context) {
  return Card(
    child: Container(
      width: MediaQuery.of(context).size.width - 60,
      height: 300,
    ),
    color: Colors.red,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    borderOnForeground: false,
    margin: EdgeInsets.all(20),
    elevation: 15,
  );
}

/* MARK: 一行或一列布局不下时，Wrap组件会自动进行换行。
 * @LastEditors: 刘驰
 * @Version: v1.0, 2019-12-04
 * @param {type} 
 * @return: 
 * @Deprecated: 否
 */
Widget getWrap(BuildContext context) {
  return Wrap(
    children: <Widget>[
      Container(
        color: Colors.red,
        width: 100,
        height: 100,
      ),
      Container(
        color: Colors.blue,
        width: 100,
        height: 100,
      ),
      Container(
        color: Colors.grey,
        width: 100,
        height: 100,
      ),
      Container(
        color: Colors.green,
        width: 100,
        height: 100,
      ),
      Container(
        color: Colors.orange,
        width: 100,
        height: 100,
      ),
    ],
    direction: Axis.horizontal,
    alignment: WrapAlignment.end,
    spacing: 20,
    runAlignment: WrapAlignment.start,
    runSpacing: 20,
    crossAxisAlignment: WrapCrossAlignment.center,
    textDirection: TextDirection.rtl,
  );
}

/* MARK: flex比例布局
 * @LastEditors: 刘驰
 * @Version: 版本号, YYYY-MM-DD
 * @param {type} 
 * @return: 
 * @Deprecated: 否
 */
Widget getFlex(BuildContext context) {
  return Row(
    children: <Widget>[
      Expanded(
        child: Container(
          color: Colors.red,
          child: Text("组件1"),
          height: 100,
        ),
        flex: 1,
      ),
      Expanded(
        child: Container(
          color: Colors.blue,
          child: Text("组件2"),
          height: 100,
        ),
        flex: 2,
      ),
      Expanded(
          child: Container(
            color: Colors.green,
            child: Text("组件3"),
            height: 100,
          ),
          flex: 1),
    ],
    textDirection: TextDirection.rtl,
  );
}

/* MARK: 绝对位置布局
 * @LastEditors: 刘驰
 * @Version: v1.0, 2019-12-04
 * @param {type} 
 * @return: 
 * @Deprecated: 否
 */
Widget getStack(BuildContext context) {
  return Stack(
    children: <Widget>[
      new Image(
        image: new AssetImage("assets/image/banner.png"),
        width: double.maxFinite,
        fit: BoxFit.cover,
      ),
      new Positioned(
        // children组件内的绝对定位，定位于图片的右上角
        right: 15.0,
        top: 15.0,
        child: new Icon(
          Icons.share,
          color: Colors.white,
        ),
      ),
    ],
  );
}

/* MARK: 组件变形控件
 * @LastEditors: 刘驰
 * @Version: v1.0, 2019-12-04
 * @param {type} 
 * @return: 
 * @Deprecated: 否
 */
Widget getTransform(BuildContext context) {
  return Transform(
    child: Container(
      color: Colors.pinkAccent,
      width: 100,
      height: 100,
    ),
    transform: Matrix4.rotationZ(0.4),
    alignment: Alignment.center,
  );
}

/* MARK: 容器将其子组件的尺寸设置为固定的尺寸，不论子组件的尺寸怎样，都人强制使用SizeBox组件所设置的尺寸。
 * @LastEditors: 刘驰
 * @Version: 版本号, YYYY-MM-DD
 * @param {type} 
 * @return: 
 * @Deprecated: 否
 */
Widget getSizeBox(BuildContext context) {
  return SizedBox(
    child: Container(
      color: Colors.red,
      width: 10,
      height: 300,
    ),
    width: 100,
    height: 100,
  );
}

/* MARK: 容器支持其子组件的尺寸超出容器，并且不会被截断。
 * @LastEditors: 刘驰
 * @Version: 版本号, YYYY-MM-DD
 * @param {type} 
 * @return: 
 * @Deprecated: 否
 */
Widget getOverflowBox(BuildContext context) {
  return Container(
    color: Colors.orange,
    // alignment: Alignment.centerLeft,
    child: OverflowBox(
      maxHeight: 50,
      maxWidth: 300,
      alignment: Alignment.centerLeft,
      child: Container(
        color: Colors.red.withAlpha(100),
        width: 100,
        height: 50,
      ),
    ),
    height: 50,
    width: 50,
  );
}

/* MARK: 控制容器显示隐藏offstage���false为显示
 * @LastEditors: 刘驰
 * @Version: 版本号, YYYY-MM-DD
 * @param {type} 
 * @return: 
 * @Deprecated: 否
 */
Widget getOffstage(BuildContext context) {
  return LimitedBox(
    maxHeight: 50,
    child: Row(
      children: <Widget>[
        Offstage(
          child: Container(
            color: Colors.green,
            width: 50,
            height: 100,
          ),
          // false为显示
          offstage: false,
        ),
        Offstage(
          child: Container(
            padding: EdgeInsets.fromLTRB(5, 0, 0, 5),
            color: Colors.blue,
            width: 50,
            height: 100,
          ),
          offstage: true,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
        ),
        Offstage(
          child: Container(
            color: Colors.yellow,
            width: 50,
            height: 100,
          ),
          offstage: false,
        ),
      ],
    ),
  );
}

/* MARK: 限制子组件的尺寸
 * @LastEditors: 刘驰
 * @Version: 版本号, YYYY-MM-DD
 * @param {type} 
 * @return: 
 * @Deprecated: 否
 */
Widget getLimitedBox(BuildContext context) {
  return Row(
    children: <Widget>[
      Container(
        color: Colors.red,
        width: 120,
        height: 120,
      ),
      LimitedBox(
        maxWidth: 100,
        child: Container(
          color: Colors.blue,
          width: 250,
          height: 100,
        ),
      )
    ],
  );
}

/* MARK: 对其内部而已的子组件进行宽高约束。
 * @LastEditors: 刘驰
 * @Version: 版本号, YYYY-MM-DD
 * @param {type} 
 * @return: 
 * @Deprecated: 否
 */
Widget getConstainedBox(BuildContext context) {
  return ConstrainedBox(
    child: Container(
      color: Colors.red,
      width: MediaQuery.of(context).size.width,
      height: 400,
    ),
    // constraints 属性设置组件的宽��与高度范围，如果子组件尺寸不足或超出，就会被自动调整。
    constraints: BoxConstraints.expand(
      width: MediaQuery.of(context).size.width - 20,
      height: 100,
    ),
  );
}

/* MARK: 根据窗口的大小来适配自己的尺寸
 * @LastEditors: 刘驰
 * @Version: v1.0, 2019-12-03
 * @param {type} 
 * @return: 
 * @Deprecated: 否
 */
Widget getFittedBox(BuildContext context) {
  return Container(
    color: Colors.red,
    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
    width: double.infinity,
    height: 100,
    child: FittedBox(
      alignment: Alignment.center,
      fit: BoxFit.fill,
      child: Container(
        color: Colors.green,
        width: 150,
        height: 150,
      ),
    ),
  );
}

/* MARK: 创建宽高比固定的容器
 * @LastEditors: 刘驰
 * @Version: v1.0, 2019-12-03
 * @param {type} 
 * @return: 
 * @Deprecated: 否
 */
Widget getAspectRatio(BuildContext context) {
  return Container(
    // color: Colors.orange,
    padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
    child: AspectRatio(
      child: getRadiusImage1(context),
      aspectRatio: 2.5,
    ),
  );
}

/* MARK: 通过ClipRRect设置圆角
 * @LastEditors: 刘驰
 * @Version: 版本号, YYYY-MM-DD
 * @param {type} 
 * @return: 
 * @Deprecated: 否
 */
Widget getRadiusImage1(BuildContext context) {
  return ClipRRect(
    child: Image.asset(
      "assets/image/banner.png",
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.fill,
    ),
    borderRadius: BorderRadius.circular(10),
  );
}

/* MARK: 通过Card组件设置圆角
 * @LastEditors: 刘驰
 * @Version: 版本号, YYYY-MM-DD
 * @param {type} 
 * @return: 
 * @Deprecated: 否
 */
Widget getRadiusImage2(BuildContext context) {
  return Card(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(10)),
    clipBehavior: Clip.antiAlias,
    child: Image.asset(
      "assets/image/banner.png",
      fit: BoxFit.fitWidth,
    ),
    // card有自己默认的margin，如果不想要magin必须设置为0
    margin: EdgeInsets.all(0),
  );
}

/* MARK: 通过Container背景��片设置圆角
 * @LastEditors: 刘驰
 * @Version: 版本号, YYYY-MM-DD
 * @param {type} 
 * @return: 
 * @Deprecated: 否
 */
Widget getRadiusImage3(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
          image: AssetImage("assets/image/banner.png"), fit: BoxFit.fitWidth),
      borderRadius: BorderRadius.all(Radius.circular(10)),
      // border: Border.all(
      //   color: Colors.red,
      //   width: 4,
      //   style: BorderStyle.solid,
      // ),
    ),
    width: double.maxFinite,
  );
}
