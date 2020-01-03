import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/util/FilePersistenceUtils.dart';
import 'package:path_provider/path_provider.dart';

class FileDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FileDemoState();
  }
}

class _FileDemoState extends State<FileDemo> {
  // 图片文件
  var file;

  final String url = "http://123.57.32.68:26631//Public/avatar/20190903/5d6ddb7c24ea8.png";

  // 输入内容控制器
  TextEditingController _inputController = new TextEditingController();
  String _data = "暂无数据";

  @override
  void initState() {
    super.initState();
    _download();
  }

  _download() async{
    await FilePersistenceUtils.downloadFile(url, success: (file) {
      setState(() {
        this.file = file;
      });
    }, directory: (StorageDirectory.pictures));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "文件",
          style: TextStyle(color: Colors.white),
        ),
      ),
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 10)),
              _getInputView(),
              _getSetBtnView(),
              Text(
                _data,
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
              _getGetBtnView(),
              Padding(padding: EdgeInsets.only(top: 10)),
//              RaisedButton(
//                child: Text('下载图片'),
//                onPressed: () => downloadImage(
//                    ),
//              ),
//              Padding(padding: EdgeInsets.only(top: 10)),
              Container(
                child: file != null ? Image.file(file) : Container(),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),

              Image.network("https://imgm.gmw.cn/attachement/jpg/site215/20191209/5242903555389307817.jpg"),
              // 三方插件 网络图片本地缓存映射 存储到数据库中
              CachedNetworkImage(
                imageUrl: "http://via.placeholder.com/350x150",
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void downloadImage(String url) async {
    await FilePersistenceUtils.downloadFile(url, success: (file) {
      setState(() {
        this.file = file;
        print("文件路径：" + file.path);
      });
    }, directory: (StorageDirectory.pictures));
  }

  _getInputView() {
    return TextField(
      keyboardType: TextInputType.text,
      style: TextStyle(color: Color(0xFF888888)),
      controller: _inputController,
      decoration: InputDecoration(
        hintText: "姓名",
        hintStyle: TextStyle(color: Color(0xFF888888)),
        contentPadding:
            EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  _getSetBtnView() {
    return RaisedButton(
      onPressed: () async {
        FilePersistenceUtils.writeToFile(
            _inputController.text,
            await FilePersistenceUtils.getFileByType(
                "test.text", StorageDirectory.documents));
      },
      child: Text(
        "存储输入内容",
      ),
    );
  }

  _getGetBtnView() {
    return RaisedButton(
      onPressed: () async {
        var str = await FilePersistenceUtils.readAsString(
            await FilePersistenceUtils.getFileByType(
                "test.txt", StorageDirectory.documents));
        setState(() {
          _data = str;
        });
      },
      child: Text(
        "获取输入内容",
      ),
    );
  }
}
