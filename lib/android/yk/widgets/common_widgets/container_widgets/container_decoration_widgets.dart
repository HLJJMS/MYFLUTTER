import 'package:flutter/material.dart';

class ContainerDecorationView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ContainerDecorationViewState();
  }
}

class _ContainerDecorationViewState extends State<ContainerDecorationView> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('decoration'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.all(20),
          color: Colors.grey[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('''
decoration可以设置边框、背景色、背景图片、圆角等属性，非常实用。对于transform这个属性，一般有过其他平台开发经验的，都大致了解，这种变换，一般不是变换的实际位置，而是变换的绘制效果，也就是说它的点击以及尺寸、间距等都是按照未变换前的。 
但需要注意的是 deoration和 color： 背景颜色不能共存，二者同时只能有一个
'''),
              Padding(padding: EdgeInsets.only(top: 10)),
              Container(
                decoration: new BoxDecoration(
                  border: new Border.all(width: 1.0, color: Colors.blue),
                ),
                padding: const EdgeInsets.all(8.0),
                margin: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: new Text('蓝色边框'),
              ),
              Container(
                decoration: new BoxDecoration(
                  color: Colors.blue,
                ),
                padding: const EdgeInsets.all(8.0),
                margin: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: new Text('蓝色背景'),
              ),
              Container(
                decoration: new BoxDecoration(
                  border: new Border.all(width: 2.0, color: Colors.red),
                  borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
                  image: new DecorationImage(
                    image: new NetworkImage(
                        'http://h.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=0d023672312ac65c67506e77cec29e27/9f2f070828381f30dea167bbad014c086e06f06c.jpg'),
                    centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                  ),
                ),
                padding: const EdgeInsets.all(8.0),
                margin: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: new Text('图片背景'),
//                transform: new Matrix4.rotationZ(0.3),
              ),
              Container(
                decoration: new BoxDecoration(
                  border: new Border.all(width: 1.0, color: Colors.green[900]),
                  color: Colors.green[300],
                  borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
                ),
                padding: const EdgeInsets.all(8.0),
                margin: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: new Text('圆角'),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8.0),
                margin: EdgeInsets.all(10),
                child: new Text("渐变"),
                decoration: new BoxDecoration(
                  gradient:
                      new LinearGradient(colors: [Colors.blue, Colors.green]),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8.0),
                margin: EdgeInsets.all(10),
                child: new Text("长方形"),
                decoration: new BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.rectangle,
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8.0),
                margin: EdgeInsets.all(10),
                child: new Text("圆形"),
                decoration: new BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              Text('''
阴影位置由offset决定,
阴影模糊层度由blurRadius大小决定（大就更透明更扩散），
阴影模糊大小由spreadRadius决定'''),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8.0),
                margin: EdgeInsets.all(10),
                child: new Text("单色阴影 offset: Offset(-5, 10),"),
                decoration: new BoxDecoration(
                  color: Colors.grey[500],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red,
                      blurRadius: 15.0,
                      spreadRadius: 5,
                      offset: Offset(-5, 10),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8.0),
                margin: EdgeInsets.all(10),
                child: new Text("单色阴影 offset:Offset(10,10)"),
                decoration: new BoxDecoration(
                  color: Colors.grey[500],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red,
                      blurRadius: 15.0,
                      spreadRadius: 5,
                      offset: Offset(10, 10),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8.0),
                margin: EdgeInsets.all(10),
                child: new Text("三色阴影"),
                decoration: new BoxDecoration(
                  color: Colors.grey[500],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue,
                      blurRadius: 7.0,
                      spreadRadius: 7.0,
                      offset: Offset(0, 5),
                    ),
                    BoxShadow(
                      color: Colors.yellow,
                      blurRadius: 5.0,
                      spreadRadius: 5.0,
                      offset: Offset(0, 5),
                    ),
                    BoxShadow(
                      color: Colors.green,
                      blurRadius: 3.0,
                      spreadRadius: 3,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
