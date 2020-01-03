import 'package:flutter/material.dart';

import '../../../ykRouter.dart';

class ImageMainView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ImageMainViewState();
  }
}

class _ImageMainViewState extends State {
  var fit = BoxFit.fill;
  var alignment = Alignment.center;
  static final url =
      "http://ww2.sinaimg.cn/bmiddle/62037b5ajw1e7v5lijsigg2046046ad3.gif";
  var url2 = url;
  var url3 = url;
  var url4 =
      "http://gss0.baidu.com/9fo3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/d000baa1cd11728b3de9f282c9fcc3cec2fd2c4d.jpg";
  var url5 = "http://dl.ppt123.net/pptbj/201603/2016030410180804.jpg";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Image'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.all(20),
          color: Colors.grey[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text('''
Image组件的构造方法              
Image：通过ImageProvider来加载图片
Image.asset：用来加载本地资源图片
Image.file：用来加载本地（File文件）图片
Image.network：用来加载网络图片
Image.memory：用来加载Uint8List资源（byte数组）图片
            '''),
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              Text('宽度50，高度50，默认填充方式'),
              Container(
                color: Colors.red,
                child: Image.network(
                  'http://n.sinaimg.cn/sports/2_img/upload/cf0d0fdd/107/w1024h683/20181128/pKtl-hphsupx4744393.jpg',
                  fit: fit,
                  width: 50,
                  height: 50,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              GestureDetector(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                  child: Text('不同的图片加载方式'),
                  color: Colors.red[900],
                ),
                onTap: () {
                  Navigator.pushNamed(
                      context, ROUTES_COMMON_WIDGETS_IMAGE_PROVIDER_VIEW);
                },
              ),
              GestureDetector(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                  child: Text('颜色与颜色混合'),
                  color: Colors.red[800],
                ),
                onTap: () {
                  Navigator.pushNamed(
                      context, ROUTES_COMMON_WIDGETS_IMAGE_COLOR_VIEW);
                },
              ),
              GestureDetector(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                  child: Text('loadingBuilder属性'),
                  color: Colors.red[700],
                ),
                onTap: () {
                  Navigator.pushNamed(context,
                      ROUTES_COMMON_WIDGETS_IMAGE_LOADING_BUILDER_VIEW);
                },
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 150,
                    color: Colors.red,
                    width: 50,
                    child: Image.network(
                      'http://n.sinaimg.cn/sports/2_img/upload/cf0d0fdd/107/w1024h683/20181128/pKtl-hphsupx4744393.jpg',
                      fit: fit,
                      alignment: alignment,
//                      frameBuilder: ImageFrameBuilder,
                    ),
                  ),
                  Container(
                    height: 50,
                    color: Colors.red,
                    width: 150,
                    child: Image.network(
                      'http://n.sinaimg.cn/sports/2_img/upload/cf0d0fdd/107/w1024h683/20181128/pKtl-hphsupx4744393.jpg',
                      fit: fit,
                      alignment: alignment,
                    ),
                  ),
                  Container(
                    height: 50,
                    color: Colors.red,
                    width: 50,
                    child: Image.network(
                      'http://n.sinaimg.cn/sports/2_img/upload/cf0d0fdd/107/w1024h683/20181128/pKtl-hphsupx4744393.jpg',
                      fit: fit,
                      alignment: alignment,
                    ),
                  ),
                ],
              ),
              RaisedButton(
                child: Text("选择图片填充样式 ：$fit"),
                onPressed: () {
                  setState(() {
                    _fitDialog();
                  });
                },
              ),
              RaisedButton(
                child: Text("选择图片对齐样式 ：$alignment"),
                onPressed: () {
                  setState(() {
                    _alignmentDialog();
                  });
                },
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              Text(
                  '该属性用于的中心拉伸，值为一个 Rect 对象，应该就是拉伸区域，我在使用该属性的时候只有当 fit 设置为 contain 和 fill 时才看到了效果，该属性应该也是用于图形变换，不常用。'),
              Text('原图'),
              Image.network(
                url,
              ),
              Text('拉伸 Rect.fromLTWH(10, 10, 20, 20)'),
              Image.network(
                url,
                fit: BoxFit.contain,
                height: 200,
                width: 200,
                centerSlice: Rect.fromLTWH(10, 10, 20, 20),
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              Text('不重复'),
              Image.network(
                url,
                repeat: ImageRepeat.noRepeat,
              ),
              Text('ImageRepeat.repeat：X、Y 轴都重复。'),
              Image.network(
                url,
                width: double.infinity,
                repeat: ImageRepeat.repeat,
              ),
              Text('ImageRepeat.repeatX：X 轴都重复。'),
              Image.network(
                url,
                width: double.infinity,
                repeat: ImageRepeat.repeatX,
              ),
              Text('ImageRepeat.repeatY：Y 轴都重复。'),
              Image.network(
                url,
                width: double.infinity,
                repeat: ImageRepeat.repeatY,
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              Text('当图片发生改变之后，重新加载图片过程中的样式。'),
              Text(
                  'gaplessPlayback: false 当图片发生改变之后，重新加载图片过程中的样式。原来的图片消失，等待新图片加载'),
              Image.network(
                url2,
                width: double.infinity,
                gaplessPlayback: false,
              ),
              RaisedButton(
                child: Text("重新加载图片"),
                onPressed: () {
                  setState(() {
                    url2 = url4;
                  });
                },
              ),
              Text('gaplessPlayback: true 原来图片不消失，等到新图片下载成功直接显示新图片。'),
              Image.network(
                url3,
                width: double.infinity,
                gaplessPlayback: true,
              ),
              RaisedButton(
                child: Text("重新加载图片"),
                onPressed: () {
                  setState(() {
                    url3 = url5;
                  });
                },
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              Text('圆角'),
              Text('使用裁剪来实现图片圆角：'),
              new ClipRRect(
                child: Image.network(
                  url,
                  scale: 2.5,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              Text('使用边框来实现图片圆角：'),
              new Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: NetworkImage(url), fit: BoxFit.cover),
                ),
              ),
              Text('圆形'),
              Text('使用裁剪实现圆形图片：'),
              new ClipOval(
                child: Image.network(
                  url,
                  scale: 2.5,
                ),
              ),
              Text('使用CircleAvatar来实现圆形图片：'),
              new CircleAvatar(
                backgroundImage: NetworkImage(url),
                radius: 50.0,
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              Text('让图片里面的内容实现左右转换'),
              Image.network(
                'http://n.sinaimg.cn/sports/2_img/upload/cf0d0fdd/107/w1024h683/20181128/pKtl-hphsupx4744393.jpg',
                width: 100.0,
                height: 100.0,
              ),
              new Directionality(
                textDirection: TextDirection.rtl,
                child: new Image.network(
                  'http://n.sinaimg.cn/sports/2_img/upload/cf0d0fdd/107/w1024h683/20181128/pKtl-hphsupx4744393.jpg',
                  width: 100.0,
                  height: 100.0,
                  matchTextDirection: true,//可以让图片里面的内容实现左右转换
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 选择图片填充样式弹窗
  Future _fitDialog() async {
    showDialog<Null>(
      context: context,
      builder: (BuildContext context) {
        return new SimpleDialog(
          title: new Text('选择BoxFit'),
          children: <Widget>[
            new SimpleDialogOption(
              child: new Text('BoxFit.fill:充满父容器'),
              onPressed: () {
                setState(() {
                  fit = BoxFit.fill;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text('BoxFit.contain:尽可能大，保持图片分辨率'),
              onPressed: () {
                setState(() {
                  fit = BoxFit.contain;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text('BoxFit.cover:充满容器，可能会被截断'),
              onPressed: () {
                setState(() {
                  fit = BoxFit.cover;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text('BoxFit.none:图片居中显示，不改变分大小，可能会被截断'),
              onPressed: () {
                setState(() {
                  fit = BoxFit.none;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text('BoxFit.fitWidth:图片填满宽度，高度可能会被截断'),
              onPressed: () {
                setState(() {
                  fit = BoxFit.fitWidth;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text('BoxFit.fitHeight:图片填满高度，宽度可能会被截断'),
              onPressed: () {
                setState(() {
                  fit = BoxFit.fitHeight;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text('BoxFit.scaleDown:图片可以完整显示，但是可能不能填充满'),
              onPressed: () {
                setState(() {
                  fit = BoxFit.scaleDown;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    ).then((val) {
      print(val);
    });
  }

  /// 选择图片填充样式弹窗
  Future _alignmentDialog() async {
    showDialog<Null>(
      context: context,
      builder: (BuildContext context) {
        return new SimpleDialog(
          title: new Text('图片对齐方式'),
          children: <Widget>[
            new SimpleDialogOption(
              child: new Text('Alignment.topLeft'),
              onPressed: () {
                setState(() {
                  alignment = Alignment.topLeft;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text('Alignment.topCenter'),
              onPressed: () {
                setState(() {
                  alignment = Alignment.topCenter;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text('Alignment.topRight'),
              onPressed: () {
                setState(() {
                  alignment = Alignment.topRight;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text('Alignment.centerLeft'),
              onPressed: () {
                setState(() {
                  alignment = Alignment.centerLeft;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text('Alignment.center'),
              onPressed: () {
                setState(() {
                  alignment = Alignment.center;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text('Alignment.centerRight'),
              onPressed: () {
                setState(() {
                  alignment = Alignment.centerRight;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text('Alignment.bottomLeft'),
              onPressed: () {
                setState(() {
                  alignment = Alignment.bottomLeft;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text('Alignment.bottomCenter'),
              onPressed: () {
                setState(() {
                  alignment = Alignment.bottomCenter;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text('Alignment.bottomRight'),
              onPressed: () {
                setState(() {
                  alignment = Alignment.bottomRight;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    ).then((val) {
      print(val);
    });
  }
}
