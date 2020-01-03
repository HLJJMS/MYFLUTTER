import 'package:flutter/material.dart';

class ImageLoadingBuilderView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ImageLoadingBuilderViewState();
  }
}

class _ImageLoadingBuilderViewState extends State {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('loadingBuilder'),
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
              Text('一个生成器，它指定在图像仍在加载时显示给用户的小部件。'),
              Image.network(
                'https://cn.bing.com/th?id=OIP.xq1C2fmnSw5DEoRMC86vJwD6D6&pid=Api&rs=1',
                scale: 2,
                frameBuilder: (BuildContext context, Widget child, int frame,
                    bool wasSynchronouslyLoaded) {
                  return Padding(
                    padding: EdgeInsets.all(10.0),
                    child: child,
                  );
                },
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor:Colors.blue,
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes
                          : null,
                    ),
                  );
                },
                //fit: BoxFit.fill,
                alignment: Alignment.center,
                repeat: ImageRepeat.noRepeat,
                centerSlice: Rect.fromLTRB(10, 10, 10, 10),
                matchTextDirection: false,
                gaplessPlayback: false,
                filterQuality: FilterQuality.low,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
