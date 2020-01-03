import 'package:flutter/material.dart';
import 'package:flutter_app/base/Tabbar.dart';
import 'package:flutter_app/extension/sh_extension_string.dart';
import 'package:flutter_app/util/routerUtil.dart';

class MyViewController extends StatefulWidget {
  MyViewController({Key key}) : super(key: key);

  @override
  _MyViewControllerState createState() => _MyViewControllerState();
}

class _MyViewControllerState extends State<MyViewController> {
  @override
  void initState() {
    super.initState();

    @override
    void didChangeDependencies() {
      // TODO: implement didChangeDependencies
      super.didChangeDependencies();
      var bools = ModalRoute.of(context).isCurrent;
      if (bools) {
        debugPrint("返回到该页面，并刷新数据");
      }
    }
  }

  ///当移除渲染树的时候调用
  @override
  // void deactivate() {
  //   super.deactivate();
  //   var bools = ModalRoute.of(context).isCurrent;
  //   if (bools) {
  //     debugPrint("返回到该页面，并刷新数据");
  //   }
  // }

  List _listData = [
    {
      "type": "1",
      "icon": Image.asset(
        'assets/image/bag.png',
        fit: BoxFit.fill,
      ),
      "title": "待付款"
    },
    {
      "type": "2",
      "icon": Image.asset(
        'assets/image/car.png',
        fit: BoxFit.fill,
      ),
      "title": "待发货"
    },
    {
      "type": "3",
      "icon": Image.asset(
        'assets/image/download.png',
        fit: BoxFit.fill,
      ),
      "title": "待收货"
    },
    {
      "type": "4",
      "icon": Image.asset(
        'assets/image/money.png',
        fit: BoxFit.fill,
      ),
      "title": "退换/售后"
    },
  ];

  List _listBottomData = [
    {"type": "1", "title": "我的额度"},
    {"type": "2", "title": "借款记录"},
    {"type": "3", "title": "还款记录"},
    {"type": "4", "title": "认证中心"},
    {"type": "5", "title": "银行卡"},
    {"type": "6", "title": "帮助中心"},
    {"type": "7", "title": "设置"},
  ];

  @override
  Widget build(BuildContext context) {
    setState(() {
      var bools = ModalRoute.of(context).isCurrent;
      if (bools) {
        debugPrint("返回到该页面，并刷新数据");
      }
    });
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("我的"),
      // ),
      body: SingleChildScrollView(
        // controller: controller,
        //滑动的方向 Axis.vertical为垂直方向滑动，Axis.horizontal 为水平方向
        scrollDirection: Axis.vertical,
        //true 滑动到底部
        reverse: false,
        padding: EdgeInsets.all(0),
////滑动到底部回弹效果
        physics: BouncingScrollPhysics(),

        child: Column(
          children: <Widget>[
            /// MARK: ------------------------头
            Container(
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  /* MARK: 头部视图
                   * @LastEditors: 张龙江
                   * @Version: 版本号, YYYY-MM-DD
                   * @param {type} 
                   * @return: 
                   * @Deprecated: 否
                   */
                  _buildTopHeaderView(context),
                ],
              ),
            ),

            /* MARK: 中间账单
                   * @LastEditors: 张龙江
                   * @Version: 版本号, YYYY-MM-DD
                   * @param {type} 
                   * @return: 
                   * @Deprecated: 否
                   */
            _buildCenterBill(context),

            /* MARK: 列表
                   * @LastEditors: 张龙江
                   * @Version: 版本号, YYYY-MM-DD
                   * @param {type} 
                   * @return: 
                   * @Deprecated: 否
                   */
            _buildList(context),
          ],
        ),
      ),
    );
  }

  /* MARK:   头部视图
   * @LastEditors: 张龙江
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _buildTopHeaderView(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.white,
          margin: EdgeInsets.all(0),
          child: SizedBox(
            width: double.infinity,
            height: 189,
            child: Image.asset(
              'assets/image/bgroundd.png',
              fit: BoxFit.fill,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 49, 0, 0),
          child: SizedBox(
            width: double.infinity,
            height: 226,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image/juxing.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Container(
                          // color: Colors.red,
                          child: Row(
                            children: <Widget>[
                              ///MARK: --------- 头像
                              Padding(
                                padding: EdgeInsets.only(left: 30, top: 31),
                                child: SizedBox(
                                  width: 56,
                                  height: 56,
                                  child: Image.asset(
                                    'assets/image/icon.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Container(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: 10, top: 31),
                                        child: SizedBox(
                                          height: 26,
                                          child: Text(
                                            "137****6377",
                                            style: TextStyle(
                                              fontSize: 19,
                                              fontWeight: FontWeight.bold,
                                              color: "#333333".toColor(),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Stack(
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 10, top: 5),
                                            child: SizedBox(
                                              width: 16,
                                              height: 16,
                                              child: Image.asset(
                                                  'assets/image/fenzu.png'),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 34, top: 5),
                                            child: SizedBox(
                                              height: 26,
                                              child: Text(
                                                "尊敬的银多卡贷用户",
                                                style: TextStyle(
                                                  fontSize: 12.5,
                                                  fontWeight: FontWeight.w400,
                                                  color: "#9A9A9A".toColor(),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ]),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        // color: Colors.red,
                        margin: EdgeInsets.only(top: 41, right: 7),
                        child: SizedBox(
                            // width: 100,
                            height: 43,
                            child: Stack(
                              children: <Widget>[
                                Image.asset(
                                  'assets/image/juxingvip.png',
                                  fit: BoxFit.fill,
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 11, left: 17),
                                  child: Text(
                                    "免费领取VIP",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: "#FFFFFF".toColor(),
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 33, top: 22),
                        child: SizedBox(
                          height: 26,
                          child: Text(
                            "我的订单",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: "#333333".toColor(),
                            ),
                          ),
                        ),
                      ),
                      Stack(
                        alignment: Alignment.centerRight,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 36, top: 22),
                            child: SizedBox(
                              height: 26,
                              child: Text(
                                "全部订单",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: "#9A9A9A".toColor(),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 28, top: 13),
                            child: SizedBox(
                              height: 8,
                              width: 4,
                              child: Image.asset(
                                'assets/image/mymy.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Container(
                    // color: Colors.yellow,
                    margin: EdgeInsets.only(
                        left: 20, top: 11, right: 20, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: _listData.map((value) {
                        return GestureDetector(
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                width: 40,
                                height: 40,
                                child: value["icon"],
                              ),
                              Text(
                                value["title"],
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: "#444444".toColor(),
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            switch (value["type"]) {
                              case "1":
                                debugPrint("待付款");
                                break;
                              case "2":
                                debugPrint("待发货");
                                break;
                              case "3":
                                debugPrint("待收货");
                                break;
                              case "4":
                                debugPrint("退换/售后");
                                break;
                              default:
                                break;
                            }
                          },
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  /* MARK:   中间账单视图
   * @LastEditors: 张龙江
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _buildCenterBill(BuildContext context) {
    return Container(
      child: IndexedStack(
        index: 0,
        children: <Widget>[
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.only(right: 10, top: 0, left: 10),
              child: SizedBox(
                height: 67,
                child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/image/kaitongbaitiao.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 33),
                          padding: EdgeInsets.only(top: 14),
                          // color: Colors.green,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Container(
                                    height: 20,
                                    child: Text(
                                      "开通额度 购物无忧",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: "#F0F0F0".toColor(),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 16,
                                    // color: Colors.yellow,
                                    margin: EdgeInsets.only(top: 25),
                                    child: Text(
                                      "最  高  额  度  1 0 0 0 0  元",
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w400,
                                        color: "#CFD0E5".toColor(),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 32),
                          // color: Colors.yellow,
                          child: Stack(
                            children: <Widget>[
                              Container(
                                child: SizedBox(
                                  height: 28,
                                  width: 78,
                                  child: Image.asset(
                                    'assets/image/yellowBtn.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5, left: 13),
                                child: Text(
                                  "立即开通",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: "#393018".toColor(),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )),
              ),
            ),
            onTap: () {
              debugPrint("开通额度 购物无忧");
            },
          ),
          Container(
            child: Text("data"),
          )
        ],
      ),
    );
  }

  /* MARK:   列表视图
   * @LastEditors: 张龙江
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _buildList(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(bottom: 34),
        child: Column(
          children: _listBottomData.map((value) {
            return GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 25, top: 20),
                      child: Text(
                        value["title"],
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: "#333333".toColor(),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // color: Colors.green,
                    margin: EdgeInsets.only(right: 10, top: 20),
                    child: Text(
                      value["type"] == "1"
                          ? "查看额度"
                          : value["type"] == "4" ? "未认证" : "",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: "#ADADAD".toColor(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15, top: 20),
                    child: Container(
                      child: Image.asset('assets/image/三角形.png',
                          width: 5, height: 6),
                    ),
                  ),
                ],
              ),
              onTap: () {
                switch (value["type"]) {
                  case "1":
                    debugPrint("我的额度");
                    break;
                  case "2":
                    debugPrint("借款记录");
                    break;
                  case "3":
                    debugPrint("还款记录");
                    break;

                  case "4":
                    debugPrint("认证中心");
                    RouterUtil.navigateTo(context, "iosDemoPage");
                    break;
                  case "5":
                    debugPrint("银行卡");
                    break;
                  case "6":
                    debugPrint("帮助中心");
                    break;
                  case "7":
                    debugPrint("设置");
                    break;
                  default:
                    break;
                }
              },
            );
          }).toList(),
        ),
      ),
      onTap: () {},
    );
  }
}
