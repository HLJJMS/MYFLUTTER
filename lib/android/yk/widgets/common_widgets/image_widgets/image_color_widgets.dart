import 'package:flutter/material.dart';
import 'package:flutter_app/util/FilePersistenceUtils.dart';

import '../../../ykRouter.dart';

class ImageColorView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ImageColorViewState();
  }
}

class _ImageColorViewState extends State {
  var file;
  var fit = BoxFit.fill;
  var alignment = Alignment.center;
  /// todo 没弄懂什么意思
  var excludeFromSemantics = true;
  var filterQuality = FilterQuality.high;
  var centerSlice =
      new Rect.fromCircle(center: Offset(100.0, 100.0), radius: 10.0);
  var gaplessPlayback = true;
  var matchTextDirection = true;
  var repeat = ImageRepeat.noRepeat;
  var semanticLabel = 'Image组件学习';

  var colorBlendMode = null;

  @override
  void initState() {
    super.initState();
    downloadImage();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('color'),
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
              Text('单独设置color，父控件背景色red,包裹Image设置color为yellow'),
              Container(
                padding: EdgeInsets.all(10),
                color: Colors.red,
                child: Image.network(
                  'http://n.sinaimg.cn/sports/2_img/upload/cf0d0fdd/107/w1024h683/20181128/pKtl-hphsupx4744393.jpg',
                  fit: fit,
                  width: 200,
                  height: 200,
                  color: Colors.yellow,
                ),
              ),
              Text(
                  '同时设置color和colorBlendMode属性，颜色混合效果，父控件背景色red,包裹Image设置color为yellow'),
              Container(
                color: Colors.red,
                padding: EdgeInsets.all(10),
                child: Image.network(
                  'http://n.sinaimg.cn/sports/2_img/upload/cf0d0fdd/107/w1024h683/20181128/pKtl-hphsupx4744393.jpg',
                  fit: fit,
                  width: 200,
                  height: 200,
                  color: Colors.yellow,
                  colorBlendMode: colorBlendMode,
                ),
              ),
              RaisedButton(
                child: Text("选择混合方式 ：$colorBlendMode"),
                onPressed: () {
                  setState(() {
                    _colorBlendModeDialog();
                  });
                },
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

  /// 选择图片颜色混合样式弹窗
  Future _colorBlendModeDialog() async {
    showDialog<Null>(
      context: context,
      builder: (BuildContext context) {
        return new SimpleDialog(
          title: new Text('选择colorBlendMode'),
          children: <Widget>[
            new SimpleDialogOption(
              child: new Text('null 正常；也是默认的模式。前景图会覆盖背景图'),
              onPressed: () {
                setState(() {
                  colorBlendMode = null;
                });
                Navigator.of(context).pop();
              },
            ),
            //Apple额外定义的枚举
            //R: premultiplied result, 表示混合结果
            //S: Source, 表示源颜色(Sa对应透明度值: 0.0-1.0)
            //D: destination colors with alpha, 表示带透明度的目标颜色(Da对应透明度值: 0.0-1.0)
            new SimpleDialogOption(
              child: new Text('BlendMode.clear 删除源图像和目标图像，不留任何内容。'),
              onPressed: () {
                setState(() {
                  colorBlendMode = BlendMode.clear;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text(
                  'BlendMode.src 删除目标图像，仅绘制源图像。从概念上讲，首先清除目的地，然后绘制源图像。'),
              onPressed: () {
                setState(() {
                  colorBlendMode = BlendMode.src;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child:
                  new Text('BlendMode.dst 删除源图像，仅绘制目标图像。从概念上讲，源图像被丢弃，保持目的地不变。'),
              onPressed: () {
                setState(() {
                  colorBlendMode = BlendMode.dst;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text(
                  'BlendMode.srcOver 将源图像合成到目标图像上。这是默认值。它代表了最直观的情况，其中形状被绘制在下面的内部，透明区域显示目标层。'),
              onPressed: () {
                setState(() {
                  colorBlendMode = BlendMode.srcOver;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text(
                  'BlendMode.dstOver 合并目标图像下的源图像。这与srcOver相反。当源图像应该在目标图像之前绘制但是不可能时，这非常有用'),
              onPressed: () {
                setState(() {
                  colorBlendMode = BlendMode.dstOver;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text(
                  'BlendMode.srcIn 显示源图像，但仅显示两个图像重叠的位置。目标图像不会渲染，仅将其视为蒙版。目标的颜色通道被忽略，只有不透明度才有效。要显示目标图像，请考虑dstIn。要反转掩码的语义（仅显示目标不在的源，而不是存在的位置），请考虑 srcOut。'),
              onPressed: () {
                setState(() {
                  colorBlendMode = BlendMode.srcIn;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text(
                  'BlendMode.dstIn 显示源图像，但仅显示两个图像重叠的位置。目标图像不会渲染，仅将其视为蒙版。目标的颜色通道被忽略，只有不透明度才有效。要显示目标图像，请考虑dstIn。要反转掩码的语义（仅显示目标不在的源，而不是存在的位置），请考虑 srcOut。'),
              onPressed: () {
                setState(() {
                  colorBlendMode = BlendMode.dstIn;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text(
                  'BlendMode.srcOut 显示源图像，但仅显示两个图像不重叠的位置。目标图像不会渲染，仅将其视为蒙版。目标的颜色通道被忽略，只有不透明度才有效。要显示目标图像，请考虑dstOut。要反转掩码的语义（仅显示目标所在的源，而不是缺少的位置），请考虑srcIn。'),
              onPressed: () {
                setState(() {
                  colorBlendMode = BlendMode.srcOut;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text(
                  'BlendMode.dstOut 显示目标图像，但仅限于两个图像不重叠的位置。源图像未呈现，仅被视为蒙版。忽略源的颜色通道，只有不透明度才有效。要显示源图像，请考虑srcOut。'),
              onPressed: () {
                setState(() {
                  colorBlendMode = BlendMode.dstOut;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text(
                  'BlendMode.srcATop 将源图像合成到目标图像上，但仅限于它与目标重叠的位置。这对应于“Source atop Destination”Porter-Duff运算符。这本质上是srcOver运算符，但输出的不透明度通道设置为目标图像的不透明度，而不是两个图像的不透明度通道的组合。'),
              onPressed: () {
                setState(() {
                  colorBlendMode = BlendMode.srcATop;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text(
                  'BlendMode.dstATop 将目标图像合成到源图像上，但仅限于它与源重叠的位置。这对应于“Destination atop Source”Porter-Duff运算符。这本质上是dstOver运算符，但输出的不透明度通道设置为源图像的不透明度通道，而不是图像的不透明度通道的组合。对于源位于顶部而非目标的变体，请参阅 srcATop。'),
              onPressed: () {
                setState(() {
                  colorBlendMode = BlendMode.dstATop;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text('BlendMode.xor 将按位运算xor符应用于源图像和目标图像。这会留下重叠的透明度。'),
              onPressed: () {
                setState(() {
                  colorBlendMode = BlendMode.xor;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text(
                  'BlendMode.plus 对源图像和目标图像的组件求和。其中一个图像的像素中的透明度降低了该图像对相应输出像素的贡献，就好像该图像中该像素的颜色较暗。'),
              onPressed: () {
                setState(() {
                  colorBlendMode = BlendMode.plus;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text(
                  'BlendMode.modulate 将源图像和目标图像的颜色分量相乘。这只能产生相同或更暗的颜色（乘以白色，1.0，结果不变;乘以黑色，0.0，结果为黑色）。合成两个不透明图像时，这与在投影仪上重叠两个透明胶片具有相似的效果。对于也乘以alpha通道的变体，请考虑乘法。也可以看看：屏幕，它执行类似的计算但反转。叠加，它结合了调制和屏幕以支持目标图像。hardLight，它结合了调制和屏幕以支持源图像。'),
              onPressed: () {
                setState(() {
                  colorBlendMode = BlendMode.modulate;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text(
                  'BlendMode.screen 将源图像和目标图像的分量的倒数相乘，并反转结果。反转组件意味着完全饱和的通道（不透明的白色）被视为值0.0，通常被视为0.0（黑色，透明）的值被视为1.0。这与调制混合模式基本相同，但是在乘法之前将颜色的值反转，并且在渲染之前将结果反转回来。这只能产生相同或较浅的颜色（乘以黑色，1.0，结果不变;乘以白色，0.0，结果为白色）。同样，在Alpha通道中，它只能产生更多不透明的颜色。这与两台同时在同一屏幕上显示图像的投影机具有相似的效果。也可以看看：调制，它执行类似的计算但不反转值。叠加，它结合了调制和屏幕以支持目标图像。hardLight，它结合了调制和屏幕以支持源图像。'),
              onPressed: () {
                setState(() {
                  colorBlendMode = BlendMode.screen;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text(
                  'BlendMode.overlay 在调整源图像和目标图像的组件以使其有利于目标之后，将其相乘。具体来说，如果目标值较小，则将其与源值相乘，而源值较小，它将源值的倒数乘以目标值的倒数，然后反转结果。反转组件意味着完全饱和的通道（不透明的白色）被视为值0.0，通常被视为0.0（黑色，透明）的值被视为1.0。也可以看看：调制，总是乘以值。屏幕，它总是乘以值的倒数。hardLight，类似于叠加但有利于源图像而不是目标图像。'),
              onPressed: () {
                setState(() {
                  colorBlendMode = BlendMode.overlay;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text(
                  'BlendMode.darken 通过从每个颜色通道中选择最低值来合成源图像和目标图像。输出图像的不透明度的计算方法与srcOver相同 。'),
              onPressed: () {
                setState(() {
                  colorBlendMode = BlendMode.darken;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text(
                  'BlendMode.lighten 通过从每个颜色通道中选择最高值来合成源图像和目标图像。输出图像的不透明度的计算方法与srcOver相同 。'),
              onPressed: () {
                setState(() {
                  colorBlendMode = BlendMode.lighten;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text(
                  'BlendMode.colorDodge 将目的地除以源的倒数。反转组件意味着完全饱和的通道（不透明的白色）被视为值0.0，通常被视为0.0（黑色，透明）的值被视为1.0。'),
              onPressed: () {
                setState(() {
                  colorBlendMode = BlendMode.colorDodge;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text(
                  'BlendMode.colorBurn 将目标的倒数除以源，并反转结果。反转组件意味着完全饱和的通道（不透明的白色）被视为值0.0，通常被视为0.0（黑色，透明）的值被视为1.0。'),
              onPressed: () {
                setState(() {
                  colorBlendMode = BlendMode.colorBurn;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text(
                  'BlendMode.hardLight 将源图像和目标图像的组件调整为有利于源后，将它们相乘。具体来说，如果源值较小，则将其与目标值相乘，而目标值较小，它将目标值的倒数乘以源值的倒数，然后反转结果。反转组件意味着完全饱和的通道（不透明的白色）被视为值0.0，通常被视为0.0（黑色，透明）的值被视为1.0。也可以看看：调制，总是乘以值。屏幕，它总是乘以值的倒数。overlay，类似于hardLight但有利于目标图像而不是源图像。'),
              onPressed: () {
                setState(() {
                  colorBlendMode = BlendMode.hardLight;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text(
                  'BlendMode.softLight 使用colorDodge为源值低于0.5和colorBurn为源值在0.5以上。这导致与覆盖相似但更柔和的效果。也可以看看：颜色，这是一种更微妙的着色效果。'),
              onPressed: () {
                setState(() {
                  colorBlendMode = BlendMode.softLight;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text(
                  'BlendMode.difference 从每个通道的较大值中减去较小的值。合成黑色没有效果; 合成白色会反转另一幅图像的颜色。输出图像的不透明度的计算方法与srcOver相同 。效果类似于排斥，但更严厉。'),
              onPressed: () {
                setState(() {
                  colorBlendMode = BlendMode.difference;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text(
                  'BlendMode.exclusion 从两个图像的总和中减去两个图像的乘积的两倍。合成黑色没有效果; 合成白色会反转另一幅图像的颜色。输出图像的不透明度的计算方法与srcOver相同 。效果类似于差异但更柔软。'),
              onPressed: () {
                setState(() {
                  colorBlendMode = BlendMode.exclusion;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text(
                  'BlendMode.multiply 将源图像和目标图像的组件相乘，包括Alpha通道。这只能产生相同或更暗的颜色（乘以白色，1.0，结果不变;乘以黑色，0.0，结果为黑色）。由于Alpha通道也是相乘的，因此一个图像中的完全透明像素（不透明度为0.0）会在输出中产生完全透明的像素。这与dstIn类似，但颜色组合在一起。对于将颜色相乘但不会乘以alpha通道的变体，请考虑调制。'),
              onPressed: () {
                setState(() {
                  colorBlendMode = BlendMode.multiply;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text(
                  'BlendMode.hue 获取源图像的​​色调，以及目标图像的饱和度和亮度。效果是使用源图像为目标图像着色。输出图像的不透明度的计算方法与srcOver相同 。在源图像中完全透明的区域从目的地获取其色调。也可以看看：颜色，这是一种类似但更强的效果，因为它也适用于源图像的饱和度。HSVColor，允许使用Hue而不是颜色的红色/绿色/蓝色通道表示颜色。'),
              onPressed: () {
                setState(() {
                  colorBlendMode = BlendMode.hue;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text(
                  'BlendMode.saturation 获取源图像的​​饱和度以及目标图像的色调和亮度。输出图像的不透明度的计算方法与srcOver相同 。在源图像中完全透明的区域从目的地获取饱和度。也可以看看：颜色，也适用于源图像的色调。发光度，将源图像的亮度应用于目标。'),
              onPressed: () {
                setState(() {
                  colorBlendMode = BlendMode.saturation;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text(
                  'BlendMode.color 获取源图像的​​色调和饱和度以及目标图像的亮度。效果是使用源图像为目标图像着色。输出图像的不透明度的计算方法与srcOver相同 。在源图像中完全透明的区域从目的地获取其色调和饱和度。也可以看看：色调，这是一种类似但较弱的效果。softLight，这是一种类似的着色效果，但也有白色。饱和度，仅应用源图像的饱和度。'),
              onPressed: () {
                setState(() {
                  colorBlendMode = BlendMode.color;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text(
                  'BlendMode.luminosity 获取源图像的​​亮度，以及目标图像的色调和饱和度。输出图像的不透明度的计算方法与srcOver相同 。在源图像中完全透明的区域从目的地获取其亮度。也可以看看：饱和度，将源图像的饱和度应用于目标。ImageFilter.blur，可与BackdropFilter一起使用以获得相关效果。'),
              onPressed: () {
                setState(() {
                  colorBlendMode = BlendMode.luminosity;
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
