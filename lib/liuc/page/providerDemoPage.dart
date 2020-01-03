import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/liuc/component/weatherWidget.dart';
import 'package:flutter_app/liuc/provider/CounterModel.dart';
import 'package:flutter_app/util/routerUtil.dart';
import 'package:provider/provider.dart';

class ProviderDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProviderDemoPage();
  }
}

class _ProviderDemoPage extends State<ProviderDemoPage> {
  String _txt;

  void _noticeTxtChange(String newTxt) {
    setState(() {
      _txt = newTxt;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // provider 保存对象
    final _counter = Provider.of<CounterModel>(context);
    // provider 保存变量
    final textSize = Provider.of<int>(context).toDouble();
    // 随机文字
    final wordPair = new WordPair.random();

    return Scaffold(
      appBar: AppBar(
        title: Text('provider'),
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          // 公共天气组件
          WeatherWidget(
            noticeTxt: _txt,
          ),
          Expanded(
            child: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Value:${_counter.value}',
                      style: TextStyle(fontSize: textSize),
                    ),
                    FlatButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text("修改provider中的值"),
                      onPressed: () {
                        _noticeTxtChange("今天天气不错！");
                        _counter.setTips(wordPair.asPascalCase);
                      },
                    )
                  ],
                )),
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
          onPressed: () => RouterUtil.navigateTo(context, "lc/provider2")),
    );
  }
}
