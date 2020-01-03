import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_app/util/FilePersistenceUtils.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:transparent_image/transparent_image.dart';

class RanGeSecond extends StatefulWidget {
  final String asd;

  RanGeSecond(this.asd);
  @override
  State<StatefulWidget> createState() {
    return _RanGeSecond(asd);
  }
}

class _RanGeSecond extends State<RanGeSecond> {
  final String asdx;

  _RanGeSecond(this.asdx);

  File fileImg;

  List<Widget> imgList = new List();
  List<NetworkImage> netImgList = new List();

  @override
  // void initState() {
  //   imgList.add(Image.network(
  //       "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=4207821633,988016005&fm=26&gp=0.jpg",
  //       fit: BoxFit.fill));
  //   imgList.add(Image.network(
  //       "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1378239769,2329623677&fm=26&gp=0.jpg",
  //       fit: BoxFit.fill));
  //   imgList.add(Image.network(
  //       "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2595508360,28762262&fm=26&gp=0.jpg",
  //       fit: BoxFit.fill));
  //   imgList.add(Image.network(
  //       "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2846494025,2896358583&fm=26&gp=0.jpg",
  //       fit: BoxFit.fill));

  //   netImgList.add(NetworkImage(
  //       "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2595508360,28762262&fm=26&gp=0.jpg"));
  //   netImgList.add(NetworkImage(
  //       "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=4207821633,988016005&fm=26&gp=0.jpg"));
  //   netImgList.add(NetworkImage(
  //       "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1378239769,2329623677&fm=26&gp=0.jpg"));
  //   netImgList.add(NetworkImage(
  //       "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2846494025,2896358583&fm=26&gp=0.jpg"));

  //   super.initState();
  // }
  void initState() {
    // TODO: implement initState

    downloadImage(
        "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2846494025,2896358583&fm=26&gp=0.jpg");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("$asdx"),
      ),
      body: buildSet(context),
    );
  }

// Image：通过ImageProvider来加载图片
// Image.asset：用来加载本地资源图片
// Image.file：用来加载本地（File文件）图片
// Image.network：用来加载网络图片
// Image.memory：用来加载Uint8List资源（byte数组）图片

  Widget buildSet(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      color: Colors.yellow,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //家在本地图片
            Container(
              //Image 是不支持圆角和阴影的，目前可以通过使用 CircleAvatar 和 Container 实现。
              height: 100,
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              color: Colors.white,

              // alignment: Alignment.bottomLeft,

// Boxfit.fill	会拉伸填充满显示空间，图片本身长宽比会发生变化，图片会变形。
// Boxfit.contain	这是图片的默认适应规则，图片会在保证图片本身长宽比不变的情况下缩放以适应当前显示空间，图片不会变形。
// Boxfit.cover	会按图片的长宽比放大后居中填满显示空间，图片不会变形，超出显示空间部分会被剪裁。
// BoxFit.fitWidth	图片的宽度会缩放到显示空间的宽度，高度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁。
// BoxFit.fitHeight	图片的高度会缩放到显示空间的高度，宽度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁。
// Boxf1t.none	图片没有适应策略，会在显示空间内显示图片，如果图片比显示空间大，则显示空间只会显示图片中间部分。
// BoxFit.scaleDown	效果和 Boxfit.contain差不多但是此属性不允许显示超过源图片大小，即可小不可大
              child: Image.asset(
                "assets/image/renlian.png",
                // fit: BoxFit.cover,
                //color 指定混合色，而 colorBlendMode 指定混合模式
                // colorBlendMode: BlendMode.difference,
                // color: Colors.red,
                //图像边界内对齐图像
                // alignment: Alignment.topCenter,

                //九片图像的中心切片。未研究明白
                // centerSlice: Rect.fromLTRB(0, 0, 0, 0),
                // 当图像提供者发生变化时，是继续显示旧图像（true）还是暂时不显示（false）
                // gaplessPlayback: false,
                //是否在图像的方向上绘制图像 TextDirection 未研究明白
                // matchTextDirection: true,
                //未充分容器时，是否重复图片
                // repeat: ImageRepeat.repeat,
              ),
            ),
            //圆角图片
            Container(
              width: 100.0,
              height: 100.0,
              margin: const EdgeInsets.all(20.0),
              decoration: new BoxDecoration(
                color: Colors.white,
                image: new DecorationImage(
                    image: new NetworkImage(
                        "http://123.57.32.68:36631/Public/uploads/20190809/5d4d53ea09957.png"),
                    fit: BoxFit.cover),
                shape: BoxShape.rectangle, // <-- 这里需要设置为 rectangle  官方说的最好不用
                // shape: ,
                borderRadius: new BorderRadius.all(
                    // const Radius.circular( //设置圆
                    //     50.0), // <-- rectangle 时，BorderRadius 才有效
                    const Radius.elliptical(20, 50)), //设置椭圆
              ),
            ),
            //加载网络图片
            Container(
              height: 100,
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              color: Colors.red,
              child: Image.network(
                  "http://123.57.32.68:36631/Public/uploads/20190809/5d4d53ea09957.png"),
            ),
            initView(),
            //加载网络图片并带占位图
            Container(
                height: 100,
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                color: Colors.red,
                child: FadeInImage.assetNetwork(
                  //图像比例尺寸
                  imageScale: 0.1,
                  //占位图规模
                  placeholderScale: 0.1,
                  //是否启用图像的语义描述  没看出来有啥区别
                  excludeFromSemantics: false,
                  //图像的语义描述，用于向Andoid上的TalkBack和iOS上的VoiceOver提供图像描述
                  // talkback是一款由谷歌官方开发的系统软件,它的定位是帮助盲人或者视力有障碍的用户提供语言辅助
                  // Voiceover功能是APPLE公司在2009年4月新推出的一种语音辅助程序
                  imageSemanticLabel: "图像",
                  //淡出时间
                  fadeOutDuration: Duration(milliseconds: 1300),
                  //淡出曲线
                  fadeOutCurve: Cubic(0.6, -0.28, 0.735, 0.045),
                  //淡入时间
                  fadeInDuration: Duration(milliseconds: 1300),
                  //淡入曲��
                  fadeInCurve: Cubic(0.6, -0.28, 0.735, 0.045),
                  // 图片和展位图宽度高度
                  // placeholderCacheWidth: 10,
                  // placeholderCacheHeight: 10,
                  // imageCacheWidth: 10,
                  // imageCacheHeight: 10,
                  image:
                      "http://123.57.32.68:36631/Public/uploads/20190809/5d4d53ea09957.png",
                  placeholder: "assets/image/renlian.png",
                )),
            initView(),
            //加载网络图片 assetNetwork  //这是个愚蠢的库 没鸡巴用 废了我好长时间
            Container(
                height: 100,
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                color: Colors.red,
                child: FadeInImage.memoryNetwork(
                  image:
                      "http://123.57.32.68:36631/Public/uploads/20190809/5d4d53ea09957.png",
                  placeholder: Uint8List(1),
                  // placeholder: "assets/image/renlian.png",
                )),
            initView(),
            //图片缓存
            Container(
              height: 100,
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              color: Colors.white,
              child: CachedNetworkImage(
                // width: 100,
                // height: 100,
                // fit: BoxFit.cover,

                imageUrl:
                    "http://123.57.32.68:36631/Public/uploads/20190809/5d4d53ea09957.png",
                //可选的生成器，以进一步自定义图像的显示。
                imageBuilder: (context, imageProvider) => Container(
                  //BoxDecoration类提供了多种绘制盒子的方法。
                  //这个盒子有边框、主体、阴影组成。
                  //对图片进行修改
                  decoration: BoxDecoration(
                    //一个盒子装饰的图案
                    image: DecorationImage(
                        image:
                            imageProvider, //AssetImage('assets/image/renlian.png'),
                        fit: BoxFit.scaleDown,
                        //位置
                        // alignment: Alignment.bottomLeft,
                        //重复
                        // repeat: ImageRepeat.repeat,

                        matchTextDirection: true,
                        //滤色器 第一个是滤色镜，第二个是blend mode(混合模式)。
                        colorFilter:
                            ColorFilter.mode(Colors.yellow, BlendMode.darken)),
                  ),
                ),
                //加载时显示的小部件。
                placeholder: (context, url) => CircularProgressIndicator(
                  backgroundColor: Colors.white, //背景颜色，不太好用
                  value: 1, //0~1的浮点数，用来表示进度多少
                  strokeWidth: 10, //粗细
                  valueColor: AlwaysStoppedAnimation(
                      Colors.black), //是animation类型的参数，用来设定进度值的颜色
                ),
                //也可以直接图片
                // placeholder: (context, url) =>
                //     Image.asset("assets/image/renlian.png"),

                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            initView(),
            //用于确定文本和文字方向
            Directionality(
              textDirection: TextDirection.rtl,
              child: new Image.network(
                'http://pic1.win4000.com/wallpaper/2017-10-25/59f083092ed4f.jpg',
                width: 100.0,
                height: 100.0,
                matchTextDirection: false, //可以让图片里面的内容实现左右转换
//               gaplessPlayback: true,//当ImageProvider发生变化后，重新加载图片的过程中，原图片的展示是否保留。若值为true，保留，若为false，不保留，直接空白等待下一张图片加载。
              ),
            ),
            initView(),
            Container(
              height: 100,
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              color: Colors.white,
              child: CachedNetworkImage(
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                imageUrl:
                    "http://123.57.32.68:36631/Public/uploads/20190809/5d4d53ea09957.png",
                placeholder: (context, url) => CircularProgressIndicator(
                  backgroundColor: Colors.white, //背景颜色，不太好用
                  value: 1, //0~1的浮点数，用来表示进度多少
                  valueColor: AlwaysStoppedAnimation(
                      Colors.yellow), //是animation类型的参数，用来设定进度值的颜色
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Container(
              height: 100,
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              color: Colors.white,
              child: FlatButton(
                color: Colors.orange,
                child: Text("banner"),
                onPressed: () {
                  print("banner");
                  // Navigator.pushNamed(context, "lc/ranran/three");
                  // RouterUtil.navigateTo(context, "lc/ranran/second/:",transType: TransitionType.nativeModal);
                  Navigator.of(context).pushNamed("ranran/three");
                },
              ),
            ),
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.white,
              //加载一个本地 File 图片
              child: fileImg == null ? null : Image.file(fileImg),
            ),
          ],
        ),
      ),
    );
  }

  Widget initView() {
    return Container(
      height: 20,
      width: double.infinity,
      color: Colors.green,
    );
  }

// 图片文件
  var file;
  void downloadImage(String url) async {
    await FilePersistenceUtils.downloadFile(url, success: (file) {
      setState(() {
        fileImg = file;
        this.file = file;
        print("文件路径：" + file.path);
      });
    }, directory: (StorageDirectory.pictures));
  }
}
