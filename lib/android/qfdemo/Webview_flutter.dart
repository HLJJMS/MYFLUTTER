import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/util/toastUtil.dart';
import 'package:webview_flutter/webview_flutter.dart';

const String kNavigationExamplePage = '''
<!DOCTYPE html><html>
<head><title>Navigation Delegate Example</title></head>
<body>
<p>
The navigation delegate is set to block navigation to the youtube website.
</p>
<ul>
<ul><a href="https://www.youtube.com/">https://www.youtube.com/</a></ul>
<ul><a href="https://www.google.com/">https://www.google.com/</a></ul>
</ul>
</body>
</html>
''';



class WebViewPage extends StatefulWidget {
  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  WebViewController _controller;
  String _title = "Webview_flutter.dart";


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("$_title"),
      ),
      child: SafeArea(
        child: WebView(
          initialUrl: "https://www.baidu.com/",
          //JS执行模式 是否允许JS执行
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (controller) {
            _controller = controller;
          },
          //可以用这个方法监听页面加载完成
          onPageFinished: (url) {
            // Flutter调用JS
            _controller.evaluateJavascript("document.title").then((result) {
              setState(() {
                _title = result;
              });
            });
          },
          //对于需要拦截的页面 做判断
          navigationDelegate: (NavigationRequest request) {
            if (request.url.startsWith("myapp://")) {
              print("即将打开 ${request.url}");
              //拦住了 、、、、
              //想要通过webview打开app的原生页面，通过约定好的链接，拦截到指定链接后可跳转到原生页面。

              return NavigationDecision.prevent;//阻止路由替换；
            }
            return NavigationDecision.navigate;//允许路由替换；
          },

          // JS调用Flutter
          javascriptChannels:
              <JavascriptChannel>[_alertJavascriptChannel(context)].toSet(),

        ),
      ),
    );

  }


    //给js调用的方法
  //JS通过这个name去post对应的信息给Flutter（API为name.postMessage('xxxxxx')）
  JavascriptChannel _alertJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        //方法名字
        name: 'Toast',
        //JavascriptMessage js给我的参数 JavascriptMessage.message 获取
        //暂时只是一个string的成员变量，如果入参复杂可以传json
        onMessageReceived: (JavascriptMessage message) {
          showToast(message.message);
        });

  }

  //加载代码段
  void loadHtmlCode(){
    final String contentBase64 =
    base64Encode(const Utf8Encoder().convert(kNavigationExamplePage));
    _controller.loadUrl('data:text/html;base64,$contentBase64');
  }

}
