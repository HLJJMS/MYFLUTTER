import 'package:flutter/material.dart';
import 'package:flutter_app/android/tyhdemo/tool/MyColors.dart';

class LoanView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoanView();
  }
}

class _LoanView extends State<LoanView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(19, 47, 0, 5),
            child: Text(
              "小银号-借款",
              style: TextStyle(color: Colors.white, fontSize: 23),
            ),
          ),
          _oneCard()
        ],
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

  Widget _oneCard() {
    return Container(
      margin: EdgeInsets.all(20),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(6.0),
          child: Container(
            color: Colors.white,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    Baseline(
                      baselineType: TextBaseline.ideographic,
                      baseline: 50,
                      child: new Container(
                        padding: EdgeInsets.fromLTRB(22, 17, 12, 0),
                        child: Text(
                          "银好贷",
                          style: TextStyle(
                              color: MyColors.color_333333, fontSize: 17),
                        ),
                      ),
                    ),
                    Baseline(
                      child: Text(
                        "高额低息 极速放款",
                        style: TextStyle(
                          color: MyColors.color_333333,
                          fontSize: 14,
                        ),
                      ),
                      baselineType: TextBaseline.ideographic,
                      baseline: 50,
                    ),
                  ],
                ),
                Container(
                  height: 1,
                  color: MyColors.color_E3E3E3,
                  margin: EdgeInsets.fromLTRB(22, 11, 22, 0),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(22, 15, 0, 0),
                  child: Text(
                    "可借金额(元)",
                    style:
                        TextStyle(color: MyColors.color_666666, fontSize: 12),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(22, 1, 0, 0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Container(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: new Text(
                          "额度不足",
                          style: TextStyle(
                              color: MyColors.color_848484, fontSize: 24),
                        ),
                      ),
                      new Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(18.0),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(15, 9, 15, 9),
                            color: MyColors.color_EDD29D,
                            child: Text(
                              "立即借款",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(22, 19, 0, 0),
                  child: new Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: MyColors.color_848484,
                            width: 1,
                          ),
                        ),
                        child: Text(
                          "日利率0.03%",
                          style: TextStyle(
                              color: MyColors.color_848484, fontSize: 11),
                        ),
                        padding: EdgeInsets.fromLTRB(7, 3, 7, 3),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: MyColors.color_848484,
                            width: 1,
                          ),
                        ),
                        child: Text(
                          "日利率0.03%",
                          style: TextStyle(
                              color: MyColors.color_848484, fontSize: 11),
                        ),
                        padding: EdgeInsets.fromLTRB(7, 3, 7, 3),
                        margin: EdgeInsets.fromLTRB(12, 0, 0, 0),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: MyColors.color_848484,
                            width: 1,
                          ),
                        ),
                        child: Text(
                          "日利率0.03%",
                          style: TextStyle(
                              color: MyColors.color_848484, fontSize: 11),
                        ),
                        padding: EdgeInsets.fromLTRB(7, 3, 7, 3),
                        margin: EdgeInsets.fromLTRB(12, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
                new Container(
                  margin: EdgeInsets.fromLTRB(11, 20, 11, 11),
                  color: MyColors.color_F6F7FF,
                  padding: EdgeInsets.fromLTRB(11, 15, 0, 14),
                  child: new Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Text(
                            "待还金额 11,112.23元",
                            style: TextStyle(
                                fontSize: 14, color: MyColors.color_404040),
                          ),
                          new Container(
                            height: 5,
                          ),
                          new Text(
                            "还款日 11月20日",
                            style: TextStyle(
                                fontSize: 12, color: MyColors.color_A0A0A0),
                          ),
                        ],
                      ),
                      Container(
                        color: Colors.black,
                        child: new Transform(
                          alignment: Alignment.topRight, //相对于坐标系原点的对齐方式
                          transform: new Matrix4.skewY(0), //沿Y轴倾斜0.3弧度
                          child: new Container(
                            padding: const EdgeInsets.all(8.0),
                            color: Colors.deepOrange,
                            child: const Text('Apartment for rent!'),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
