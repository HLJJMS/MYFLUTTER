import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewProgress extends StatefulWidget {

  @override
  _MyWebViewState createState() => _MyWebViewState();
}

class _MyWebViewState extends State<WebViewProgress> {
  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();

  double lineProgress = 0.0;

  void initState() {
    super.initState();
    flutterWebviewPlugin.onProgressChanged.listen((progress){
      print(progress);
      setState(() {
        lineProgress = progress;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        title: Text('带进度条的web'),
        bottom: PreferredSize(
          child: _progressBar(lineProgress,context),
          preferredSize: Size.fromHeight(3.0),
        ),
      ),
      url: 'https://www.baidu.com',
    );
  }

  @override
  void dispose() {
    flutterWebviewPlugin.dispose();
    super.dispose();
  }
}


_progressBar(double progress,BuildContext context) {

  return LinearProgressIndicator(
    backgroundColor: Colors.white70.withOpacity(0),
    value: progress == 1.0 ? 0 : progress,
    valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
  );
}