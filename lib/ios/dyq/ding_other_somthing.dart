import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'currency_button.dart';
import 'time_button.dart';
class DingOtherSomthing extends StatefulWidget {
  DingOtherSomthing({Key key}) : super(key: key);

  @override
  _DingOtherSomthingState createState() => _DingOtherSomthingState();
}

class _DingOtherSomthingState extends State<DingOtherSomthing> {

  int _groupValue = 0;

  Map<int,bool> rowchecks = {0:false,1:false};
  Map<int,bool> checks = {0:false,1:false,2:false,3:false};
  Map<int,bool> rowSwichchecks = {0:false,1:false};
  Map<int,bool> rowiosSwichchecks = {0:false,1:false};

  Map<int,double> sliderval = {0:0,1:0};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("按钮之类"),
      ),
      body: ListView(
        children: <Widget>[

          Text('下面那个是爬行动物?'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Radio(
                  activeColor: Colors.pink,
                  value: 1,
                  groupValue: _groupValue,
                  onChanged: (T){
                    print(T);
                    updateGroupValue(T);
                  }
              ),
              Radio(
                  activeColor: Colors.amber,
                  value: 2,
                  groupValue: _groupValue,
                  onChanged: (T){
                    print(T);
                    updateGroupValue(T);
                  }
              ),
            ],
          ),

          RadioListTile(
            secondary: Icon(Icons.accessibility),
              title: Text('小鸟'),
              subtitle: Text('会飞'),
              activeColor: Colors.pink,
              value: 3,
              groupValue: _groupValue,
              onChanged: (T){
                print(T);
                updateGroupValue(T);
              }
          ),

          RadioListTile(
              secondary: Icon(Icons.accessibility),
              title: Text('小猪'),
              subtitle: Text('会跑'),
              activeColor: Colors.pink,
              value: 4,
              groupValue: _groupValue,
              onChanged: (T){
                print(T);
                updateGroupValue(T);
              }
          ),

          RadioListTile(
              secondary: Icon(Icons.accessibility),
              title: Text('鳄鱼'),
              subtitle: Text('会爬'),
              activeColor: Colors.pink,
              value: 5,
              groupValue: _groupValue,
              onChanged: (T){
                print(T);
                updateGroupValue(T);
              }
          ),

          Container(
            color: Colors.grey,
            height: 1,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Checkbox(
                value: rowchecks[0],
                activeColor: Colors.blue,
                onChanged: (bool val) {
                  setState(() {
                    rowchecks[0] = !rowchecks[0];
                  });
                },
              ),


              Checkbox(
                value: rowchecks[1],
                activeColor: Colors.blue,
                onChanged: (bool val) {
                  setState(() {
                    rowchecks[1] = !rowchecks[1];
                  });
                },
              ),

            ],
          ),

          CheckboxListTile(
            secondary: Icon(Icons.shutter_speed),
            activeColor: Colors.blue,
            checkColor: Colors.amber,
            title: Text('硬件加速'),
            value: checks[0],
            onChanged: (bool value) {
              setState(() {
                checks[0] = !checks[0];
              });
            },
          ),
          CheckboxListTile(
            secondary: Icon(Icons.map),
            activeColor: Colors.blue,
            checkColor: Colors.amber,
            title: Text('内存加速'),
            value: checks[1],
            onChanged: (bool value) {
              setState(() {
                checks[1] = !checks[1];
              });
            },
          ),
          CheckboxListTile(
            secondary: Icon(Icons.style),
            activeColor: Colors.blue,
            checkColor: Colors.amber,
            title: Text('免费加速'),
            value: checks[2],
            onChanged: (bool value) {
              setState(() {
                checks[2] = !checks[2];
              });
            },
          ),
          CheckboxListTile(
            secondary: Icon(Icons.print),
            activeColor: Colors.blue,
            title: Text('收费加速'),
            value: checks[3],
            onChanged: (bool value) {
              setState(() {
                checks[3] = !checks[3];
              });
            },
          ),
          Container(
            color: Colors.grey,
            height: 1,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Switch(
                value: rowSwichchecks[0],
                activeColor: Colors.blue,     // 激活时原点颜色
                activeTrackColor: Colors.pink,
                inactiveThumbColor: Colors.amber,
                inactiveTrackColor: Colors.purple,
                activeThumbImage: AssetImage('images/loginAgree.png',),
                inactiveThumbImage: AssetImage('images/loginDissAgree.png',),
                onChanged: (bool val) {
                  setState(() {
                    rowSwichchecks[0] = !rowSwichchecks[0];
                  });
                },
              ),

              Switch(
                value: rowSwichchecks[1],
                activeColor: Colors.blue,     // 激活时原点颜色
                activeTrackColor: Colors.pink,
                inactiveThumbColor: Colors.amber,
                inactiveTrackColor: Colors.purple,
                activeThumbImage: AssetImage('images/loginAgree.png',),
                inactiveThumbImage: AssetImage('images/loginDissAgree.png',),
                onChanged: (bool val) {
                  setState(() {
                    rowSwichchecks[1] = !rowSwichchecks[1];
                  });
                },
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CupertinoSwitch(
                  value: rowiosSwichchecks[0],
                  activeColor: Colors.purple,
                  onChanged: (bool value) {///点击切换开关的状态
                    setState(() {
                      rowiosSwichchecks[0] = value;
                    });
                  }
              ),
              CupertinoSwitch(
                  value: rowiosSwichchecks[1],
//                  activeColor: Colors.purple,
                  onChanged: (bool value) {///点击切换开关的状态
                    setState(() {
                      rowiosSwichchecks[1] = value;
                    });
                  }
              ),

            ],
          ),
          Container(
            color: Colors.grey,
            height: 1,
          ),

          Slider(
            divisions: 100,
            label: "进度" + sliderval[0].toString(),
            value: sliderval[0],
            max: 100.0,
            min: 0.0,
            activeColor: Colors.blue,
            inactiveColor: Colors.amber,
            onChangeStart: (double val){
              print("onChangeStart" + val.toString());
            },
            onChanged: (double val) {
              setState(() {
                sliderval[0] = val;
              });
              print("onChanged" + val.toString());
            },
            onChangeEnd: (double val){
              print("onChangeEnd" + val.toString());
            },
          ),
          Slider(
            divisions: 100,
            label: "进度" + sliderval[1].toString(),
            value: sliderval[1],
            max: 100.0,
            min: 0.0,
            activeColor: Colors.red,
            inactiveColor: Colors.black,
            onChangeStart: (double val){
              print("onChangeStart" + val.toString());
            },
            onChanged: (double val) {
              setState(() {
                sliderval[1] = val;
              });
              print("onChanged" + val.toString());
            },
            onChangeEnd: (double val){
              print("onChangeEnd" + val.toString());
            },
          ),
          SizedBox(
            height: 30,
          ),
          CupertinoSlider(
            divisions: 100,
            value: sliderval[0],
            max: 100.0,
            min: 0.0,
            activeColor: Colors.red,
            onChangeStart: (double val){
              print("onChangeStart" + val.toString());
            },
            onChanged: (double val) {
              setState(() {
                sliderval[0] = val;
              });
              print("onChanged" + val.toString());
            },
            onChangeEnd: (double val){
              print("onChangeEnd" + val.toString());
            },
          ),



          MaterialButton(//默认带背景
            color: Colors.blue,
            disabledColor: Colors.amber,
            textColor: Colors.white,
            disabledTextColor: Colors.red,
            focusColor: Colors.purple,
            hoverColor: Colors.green,
            highlightColor: Colors.grey,
            splashColor: Colors.orange,//水波纹颜色
            elevation: 50,
            focusElevation: 100,
            hoverElevation: 50,
            highlightElevation: 5,
            disabledElevation: 50,
            shape: Border.all(
              color: Colors.greenAccent
            ),
            clipBehavior: Clip.hardEdge,
            child: new Text('MaterialButton'),
            onPressed: () {
              print('onPressed');
            },
            onHighlightChanged: (bol){
              print('onHighlightChanged');
            },
          ),


          RaisedButton(
            textTheme: ButtonTextTheme.accent,

            color: Colors.blue,
            disabledColor: Colors.amber,
            textColor: Colors.white,
            disabledTextColor: Colors.red,
            focusColor: Colors.purple,
            hoverColor: Colors.green,
//            highlightColor: Colors.grey,
            splashColor: Colors.orange,//水波纹颜色
            elevation: 50,
            focusElevation: 100,
            hoverElevation: 50,
            highlightElevation: 5,
            disabledElevation: 50,
            shape: Border.all(
                color: Colors.greenAccent
            ),
            clipBehavior: Clip.hardEdge,
            child: new Text('RaisedButton'),
            onPressed: () {
              print('onPressed');
            },
            onHighlightChanged: (bol){
              print('onHighlightChanged');
            },
          ),
          FlatButton(
            textTheme: ButtonTextTheme.accent,

            color: Colors.blue,
            disabledColor: Colors.amber,
            textColor: Colors.white,
            disabledTextColor: Colors.red,
            focusColor: Colors.purple,
            hoverColor: Colors.green,
//            highlightColor: Colors.grey,
            splashColor: Colors.orange,//水波纹颜色
            shape: Border.all(
                color: Colors.greenAccent
            ),
            clipBehavior: Clip.hardEdge,
            child: Text('FlatButton'),
            onPressed: () {
              print('onPressed');
            },
            onHighlightChanged: (bol){
              print('onHighlightChanged');
            },
          ),

          IconButton(
            iconSize: 50,
            icon: Icon(Icons.print),
            color: Colors.blue,
            disabledColor: Colors.amber,
            focusColor: Colors.purple,
            hoverColor: Colors.green,
//            highlightColor: Colors.grey,
            splashColor: Colors.orange,//水波纹颜色
            onPressed: () {
              print('onPressed');
            },
          ),


          CupertinoButton(
            child: Text('CupertinoButton'),
            pressedOpacity: 0.8,
            color: Colors.blue,
            disabledColor: Colors.amber,
            minSize: 44,
            borderRadius: BorderRadius.all(Radius.circular(0.0)),
            onPressed: (){
              print('onPressed');
            },
          ),
          OutlineButton(
              textColor: Colors.blue,
              highlightedBorderColor: Colors.deepOrange,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              borderSide: new BorderSide(color: Colors.blueAccent),
              onPressed: () {},
              child: new Text("OutlineButton")
          ),
          SizedBox(
            height: 20,
          ),


          CurrencyButton(
            Text('CurrencyButton'),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)) ,//  .vertical(top: Radius.elliptical(20, 50)),
              border: new Border.all(color: Colors.red, width: 0.5), // 边色与边宽度
              color: Colors.white,
              // 生成俩层阴影，一层绿，一层黄，
              // 阴影位置由offset决定,
              // 阴影模糊层度由blurRadius大小决定（大就更透明更扩散），
              // 阴影模糊大小由spreadRadius决定
              boxShadow: [
                BoxShadow(
                    color: Colors.purple,
                    offset: Offset(0.0, 4.0),
                    blurRadius: 8.0,
                    spreadRadius: 1.0
                ),
              ],
            ),
            margin: EdgeInsets.only(left: 100,right: 100),
            callBack: (){
              print('CurrencyButton点击');
            },
          ),



          TimeButton(
            timeStr: '倒计时#秒',
            normalStr: '获取验证码',
            countdownTime: 60,
            callBack: (){
              print('倒计时按钮点击了');
            },
          ),

          SizedBox(
            height: 100,
          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {print('floatingActionButton');},
        child: Text('FloatingActionButton'),
        elevation: 3.0,
        highlightElevation: 2.0,
        backgroundColor: Colors.red,
        foregroundColor: Colors.orange,
      ),
    );
  }



  void updateGroupValue(int v){
    setState(() {
      _groupValue = v;
    });
  }



}