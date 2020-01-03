import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/util/toastUtil.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'dart:convert';

const String kNavigationExamplePage = '''
<!DOCTYPE html><html>
<head><title>Navigation Delegate Example</title></head>
<body>
<div style="color: red">哈哈哈</div>
 <audio src="http://www.170mv.com/kw/other.web.rj01.sycdn.kuwo.cn/resource/n3/2/63/3890495760.mp3" controls="controls">
        </audio>
<p>
加载本地代码测试
</p>
<ul>
<ul><a href="https://www.baidu.com/">百度一下</a></ul>
</ul>
  <video style="width: 300px"  controls="controls">
            <source src="https://genesis-cdn.ff.com/homepage/01_marquee/FF_HomePage_Video_E4_JJ_HIGH.mp4" type="video/mp4" data-reactid="74"></video>
</body>
</html>
''';

class WebViewPage extends StatefulWidget {
  String news_url;
  String title;

  WebViewPage(this.news_url, this.title);

  @override
  State<StatefulWidget> createState() => new WebViewPageState(news_url, title);
}

class WebViewPageState extends State<WebViewPage> {
  String news_url;
  String title;
  bool _isShowWeb = false;
  bool _isShowError = true;

  // URL变化监听器
  StreamSubscription<String> onUrlChanged;
  StreamSubscription<WebViewHttpError> onErrorlisten;

  var list = List<JavascriptChannel>();

  // WebView加载状态变化监听器
  StreamSubscription<WebViewStateChanged> onStateChanged;

  // 插件提供的对象，该对象用于WebView的各种操作
  FlutterWebviewPlugin flutterWebViewPlugin = new FlutterWebviewPlugin();

  WebViewPageState(this.news_url, this.title);

  double lineProgress = 0.0;

  @override
  void initState() {
    setStateChange();
    setUrlChange();
    setErrorListen();
    setProgressListen();
    //js交互方法list
    list.add(_jsSetTitle(context));
    list.add(_jsToast(context));
  }


  @override
  Widget build(BuildContext context) {
    // WebviewScaffold是插件提供的组件，用于在页面上显示一个WebView并加载URL
    return Scaffold(
      appBar: new AppBar(
        title: Text(
          title,
          style: TextStyle(fontSize: 15),
        ),
        iconTheme: new IconThemeData(color: Colors.white),
        bottom: PreferredSize(
          child: _progressBar(lineProgress, context),
          preferredSize: Size.fromHeight(3.0),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              loadHtmlCode();
            },
            child: Text(
              '加载本地',
              style: TextStyle(color: Colors.white),
            ),
          ),
          FlatButton(
            onPressed: () {
              flutterWebViewPlugin.reloadUrl("htps://www.taptap.com/");
            },
            child: Text(
              '加载错误地址',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Offstage(offstage: _isShowWeb, child: getWebView()),
          Offstage(offstage: _isShowError, child: getErrorPage()),
        ],
      ),
    );
  }

  Widget getWebView() {
    return WebviewScaffold(
      url: news_url,
      scrollBar: false,
      // 允许网页缩放
      withZoom: true,
      // 允许LocalStorage
      withLocalStorage: true,
      // 允许执行js代码
      withJavascript: true,
      // JS调用Flutter
      //接受一个javascriptChannels集合，javascriptChannels包含方法名和回调js传参方法
      javascriptChannels: list.toSet(),
    );
  }

  Widget getErrorPage() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () {
          flutterWebViewPlugin.reloadUrl("https://www.taptap.com/");
          flutterWebViewPlugin.show();
        },
        child: Text(
          '加载失败，点击重试',
          style: new TextStyle(fontSize: 25),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // 回收相关资源
    // Every listener should be canceled, the same should be done with this stream.
    onUrlChanged.cancel();
    onStateChanged.cancel();
    onErrorlisten.cancel();
    flutterWebViewPlugin.dispose();
    super.dispose();
  }

  _progressBar(double progress, BuildContext context) {
    return LinearProgressIndicator(
      backgroundColor: Colors.white70.withOpacity(0),
      value: progress == 1.0 ? 0 : progress,
      valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
    );
  }

//加载代码段
  void loadHtmlCode() {
    final String contentBase64 =
        base64Encode(const Utf8Encoder().convert(kNavigationExamplePage));
    flutterWebViewPlugin.reloadUrl('data:text/html;base64,$contentBase64');
    flutterWebViewPlugin.show();
  }

  //是否显示web
  void setShowState() {
    flutterWebViewPlugin.hide();
    setState(() {
      _isShowError = false;
//      _isShowWeb = true;
      print(_isShowWeb);
    });
  }

  //给js调用的方法
  //JS通过这个name去post对应的信息给Flutter（API为name.postMessage('xxxxxx')）
  JavascriptChannel _jsToast(BuildContext context) {
    return JavascriptChannel(
        //方法名字
        name: 'Toast',
        //JavascriptMessage js给我的参数 JavascriptMessage.message 获取
        //暂时只是一个string的成员变量，如果入参复杂可以传json
        onMessageReceived: (JavascriptMessage message) {
          showToast(message.message);
        });
  }

  JavascriptChannel _jsSetTitle(BuildContext context) {
    return JavascriptChannel(
        //方法名字
        name: 'title',
        //JavascriptMessage js给我的参数 JavascriptMessage.message 获取
        //暂时只是一个string的成员变量，如果入参复杂可以传json
        onMessageReceived: (JavascriptMessage message) {
          setState(() {
            title = message.message;
          });
        });
  }

  //web加载状态监听
  void setStateChange() {
    onStateChanged =
        flutterWebViewPlugin.onStateChanged.listen((WebViewStateChanged state) {
      // state.type是一个枚举类型，取值有：WebViewState.shouldStart, WebViewState.startLoad, WebViewState.finishLoad
      switch (state.type) {
        case WebViewState.shouldStart:
          // 准备加载
          print('准备加载');
          break;
        case WebViewState.startLoad:
          // 开始加载
          print('开始加载');
          break;
        case WebViewState.finishLoad:
          // 加载完成
          print('加载完成');
          //在加载完成后可以调用通用方法获取网页title
//          parseResult();
          break;

        case WebViewState.abortLoad:
          // 中断加载
          print('中断加载');
          break;
      }
    });
  }

  //url变化监听
  void setUrlChange() {
    onUrlChanged = flutterWebViewPlugin.onUrlChanged.listen((String str) {
      //这里拦截url变化，
    });
  }

  //加载错误监听
  void setErrorListen() {
    onErrorlisten =
        flutterWebViewPlugin.onHttpError.listen((WebViewHttpError w) {
      setShowState();
      print('错误代码：' + w.code);
    });
  }

  //加载进度的监听
  void setProgressListen() {
    flutterWebViewPlugin.onProgressChanged.listen((progress) {
      print(progress);
      setState(() {
        lineProgress = progress;
      });
    });
  }

  // 解析WebView中的数据
  // Flutter调用JS
  void parseResult() {
    flutterWebViewPlugin.evalJavascript("document.title").then((result) {
      setState(() {
        title = result;
      });
    });
  }

}
