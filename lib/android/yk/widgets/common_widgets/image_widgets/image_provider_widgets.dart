import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/util/FilePersistenceUtils.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageProviderView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ImageProviderViewState();
  }
}

class _ImageProviderViewState extends State {
  var file;

  @override
  void initState() {
    super.initState();
    downloadImage();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('图片加载方式'),
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
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              Text(
                'Image',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
              Text(
                  'Image 的一个参数是 ImageProvider，基本上所有形式的图片加载都是依赖它，这个类里面就是实现图片加载的原理'),
              new Image(image: new AssetImage('images/loginAgree.png')),
              new Image(
                  image: new NetworkImage(
                      'http://n.sinaimg.cn/sports/2_img/upload/cf0d0fdd/107/w1024h683/20181128/pKtl-hphsupx4744393.jpg')),
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              Text(
                'Image.asset',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
              Text(
                  '加载一个本地资源图片，和 Android 一样，有多种分辨率的图片可供选择，但是沿袭的是 iOS 的图片风格，分为 1x，2x，3x，具体做法是在项目的根目录下创建两个文件夹'),
              new Image.asset('images/loginAgree.png'),
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              Text(
                'Image.file',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
              Text('加载一个本地 File 图片，比如相册中的图片'),
              getFileImageView(),
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              Text(
                'Image.network',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
              Text('加载一个网络图片，会在内存中缓存，关闭应用再次打开需要重新下载'),
              new Image.network(
                  'http://n.sinaimg.cn/sports/2_img/upload/cf0d0fdd/107/w1024h683/20181128/pKtl-hphsupx4744393.jpg'),
              Padding(padding: EdgeInsets.only(top: 20)),
              Text(
                'FadeInImage',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
              Text(
                  '有的时候我们需要像Android那样使用一个占位图或者图片加载出错时显示某张特定的图片，这时候需要用到 FadeInImage 这个组件'),
              Text(
                'FadeInImage.assetNetwork',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              Text(
                  '使用本地图片作为错误图片'),
              FadeInImage.assetNetwork(
                placeholder: 'images/loginAgree.png',
                image:
                    'http://n.sinaimg.cn/sports/2_img/upload/cf0d0fdd/107/w1024h683/20181128/pKtl-hphsupx47443931.jpg',
                width: 120,
                fit: BoxFit.fitWidth,
              ),
              Text(
                'FadeInImage.memoryNetwork',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              Text('有默认占位图和淡入效果，使用transparent_image三方'),
              FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image:
                    'http://n.sinaimg.cn/sports/2_img/upload/cf0d0fdd/107/w1024h683/20181128/pKtl-hphsupx4744393.jpg',
                width: 120,
                fit: BoxFit.fitWidth,
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              Text(
                'cached_network_image',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
              Text('使用缓存图片，传入url，下载后会在本地保存，使用cached_network_image三方'),
              CachedNetworkImage(
                imageUrl:
                    'http://n.sinaimg.cn/sports/2_img/upload/cf0d0fdd/107/w1024h683/20181128/pKtl-hphsupx4744393.jpg',
              ),
            ],
          ),
        ),
      ),
    );
  }

  void downloadImage() async {
    await FilePersistenceUtils.downloadFile(
        'http://n.sinaimg.cn/sports/2_img/upload/cf0d0fdd/107/w1024h683/20181128/pKtl-hphsupx4744393.jpg',
        success: (file) {
      setState(() {
        this.file = file;
      });
    });
  }

  getFileImageView() {
    if (file == null) {
      return Container();
    } else {
      return new Image.file(file);
    }
  }
}
