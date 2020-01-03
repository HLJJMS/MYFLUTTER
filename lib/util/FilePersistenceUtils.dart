import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class FilePersistenceUtils {
  /// 利用文件存储数据
  /// 直接调用File的writeAs函数时
  /// 默认文件打开方式为WRITE:如果文件存在，会将原来的内容覆盖
  /// 如果不存在，则创建文件
  /// 写入String，默认将字符串以UTF8进行编码
  static writeToFile(String content, File file) async {
    //写入数据
    file.writeAsStringSync(content);
  }

  /// 以字节方式写入文件
  static writeToFileByBytes(List<int> bytes, File file) async {
    file.writeAsBytesSync(bytes);
  }

  /// 获取存在文件中的数据
  /// readAsString读取文件，并返回字符串
  /// 默认返回的String编码为UTF8
  /// 相关的编解码器在dart:convert包中
  /// 包括以下编解码器：ASCII、LANTI1、BASE64、UTF8、SYSTEM_ENCODING
  /// SYSTEM_ENCODING可以自动检测并返回当前系统编码
  static Future<String> readAsString(File file) async {
    if (file != null) {
      return file.readAsStringSync();
    } else {
      return "";
    }
  }

  /// 读取字节流文件
  static Future<List<int>> readAsBytes(File file) async {
    if (file != null) {
      return file.readAsBytesSync();
    } else {
      return new List();
    }
  }

  /// 根据文件名生成文件对象 默认将对象放置在downloads文件夹下
  static Future<File> getFile(String fileName) async {
    return getFileByType(fileName, StorageDirectory.downloads);
  }

  /// 根据文件名及文件类型生成文件对象
  static Future<File> getFileByType(
      String fileName, StorageDirectory type) async {
    var directory = await getDirectoryByType(type);
    final path = "${directory.path}/$fileName";
    print("文件存储路径：$path");
    return new File(path);
  }

  /// 获取存储目录根目录文件夹
  static Future<Directory> getDirectory() async {
    Directory directory;
    if (Platform.isAndroid) {
      var list = await getExternalStorageDirectories();
      directory = list[0];
    } else {
      //获取应用文件目录类似于Ios的NSDocumentDirectory和Android上的 AppData目录
      directory = await getApplicationDocumentsDirectory();
    }
    print("文件存储路径：${directory.path}");
    return directory;
  }

  /// 根据类型获取目录文件夹
  static Future<Directory> getDirectoryByType(StorageDirectory type) async {
    Directory directory;
    if (Platform.isAndroid) {
      var list = await getExternalStorageDirectories(type:type);
      directory = list[0];
    } else {
      //获取应用文件目录类似于Ios的NSDocumentDirectory和Android上的 AppData目录
      final fileDirectory = await getApplicationDocumentsDirectory();
      //获取存储路径
      var filePath = fileDirectory.path + "/" + type.toString().split(".")[1];
      directory = new Directory(filePath);
      if (!await directory.exists()) {
        directory.create();
      }
    }
    print("文件夹存储路径：${directory.path}");
    return directory;
  }

  /// 下载文件
  static downloadFile(String url,
      {String fileName,
      StorageDirectory directory,
      DownLoadFileProgress progress,
      DownLoadFileSuccess success}) async {
    var name;
    if (fileName == null) {
      if (url.contains("?")) {
        var urlStart = url.split("?")[0];
        var nameStartIndex = urlStart.lastIndexOf("/");
        name = urlStart.substring(nameStartIndex + 1);
        print('截取的文件名：$name');
      } else {
        var nameStartIndex = url.lastIndexOf("/");
        name = url.substring(nameStartIndex + 1);
        print('截取的文件名：$name');
      }
    } else {
      name = fileName;
    }
    var file;
    // 获取文件对象
    file = await getFileByType(name, directory ?? StorageDirectory.downloads);
    // 创建文件
    if (await file.exists()) {
      if (success != null) success(file);
      print('创建已存在，跳过下载直接返回文件对象');
      return;
    } else {
      file.create();
      print('创建文件');
    }
    // 下载文件
    await Dio().download(url, file.path, onReceiveProgress: (count, total) {
      // 文件进度监听
      double percentage = double.parse((count / total).toString());
      print('下载进度：$percentage');
      if (progress != null) progress(percentage);
    }).whenComplete(() {
      // 下载完成监听
      print('下载进度：下载成功');
      if (success != null) success(file);
    });
  }
}

typedef DownLoadFileSuccess = void Function(File flie);
typedef DownLoadFileProgress = void Function(double progress);
