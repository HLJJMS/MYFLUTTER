import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RanGeThree extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RanGeThree();
  }
}

class _RanGeThree extends State<RanGeThree> {
  List<Widget> imgList = new List();
  List<NetworkImage> netImgList = new List();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("banner"),
      ),
      body: buildSet(context),
    );
  }

  @override
  void initState() {
    imgList.add(Image.network(
        "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=4207821633,988016005&fm=26&gp=0.jpg",
        fit: BoxFit.fill));
    imgList.add(Image.network(
        "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1378239769,2329623677&fm=26&gp=0.jpg",
        fit: BoxFit.fill));
    imgList.add(Image.network(
        "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2595508360,28762262&fm=26&gp=0.jpg",
        fit: BoxFit.fill));
    imgList.add(Image.network(
        "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2846494025,2896358583&fm=26&gp=0.jpg",
        fit: BoxFit.fill));

    netImgList.add(NetworkImage(
        "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2595508360,28762262&fm=26&gp=0.jpg"));
    netImgList.add(NetworkImage(
        "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=4207821633,988016005&fm=26&gp=0.jpg"));
    netImgList.add(NetworkImage(
        "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1378239769,2329623677&fm=26&gp=0.jpg"));
    netImgList.add(NetworkImage(
        "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2846494025,2896358583&fm=26&gp=0.jpg"));

    super.initState();
  }

  @override
  Widget buildSet(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: new Column(
      children: <Widget>[
        //第一个banner
        firstSwiperView(),
        Container(
          height: 20,
          width: double.infinity,
          color: Colors.red,
        ),
        Container(
          width: double.infinity,
          height: 100,
          child: new Swiper(
            itemCount: netImgList.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  decoration: BoxDecoration(
                image:
                    DecorationImage(fit: BoxFit.fill, image: netImgList[index]),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ));
            },
            controller: SwiperController(),
            scrollDirection: Axis.horizontal,
            autoplay: true,
            duration: 300,
            // onTap: (int index) {
            //   Fluttertoast.showToast(msg: index.toString());
            // },
            pagination: SwiperPagination(
                alignment: Alignment.bottomLeft,
                builder: SwiperControl(
                  iconPrevious: Icons.arrow_back_ios,
                  iconNext: Icons.arrow_forward_ios,
                  padding: EdgeInsets.all(5),
                )),
          ),
        ),
        Container(
          height: 20,
          width: double.infinity,
          color: Colors.red,
        ),
        /* MARK: 样式
         * @LastEditors: 赵翌然
         * @Version: 版本号, YYYY-MM-DD
         * @param {type} 
         * @return: 
         * @Deprecated: 否
         */
        Container(
          width: double.infinity,
          height: 100,
          child: new Swiper(
            itemCount: netImgList.length,
            itemWidth: 100,
            itemHeight: 50,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  decoration: BoxDecoration(
                image:
                    DecorationImage(fit: BoxFit.fill, image: netImgList[index]),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ));
            },
            layout: SwiperLayout.TINDER,
            controller: SwiperController(),
            scrollDirection: Axis.horizontal,
            autoplay: true,
            duration: 300,
            onTap: (int index) {
              Fluttertoast.showToast(msg: index.toString());
            },
            pagination: SwiperPagination(
                alignment: Alignment.bottomLeft,
                builder: SwiperControl(
                  iconPrevious: Icons.arrow_back_ios,
                  iconNext: Icons.arrow_forward_ios,
                  padding: EdgeInsets.all(5),
                )),
          ),
        ),
        Container(
          height: 20,
          width: double.infinity,
          color: Colors.red,
        ),
        collectionView(),
        initIcon(),
        initIconButton()
      ],
    ));
  }

/* MARK: 第一个banner
 * @LastEditors: 赵翌然
 * @Version: 版本号, YYYY-MM-DD
 * @param {type}  
 * @return: 
 * @Deprecated: 否
 */
  Widget firstSwiperView() {
    return Container(
      padding: EdgeInsets.all(0),
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: Swiper(
        itemCount: imgList.length,
        itemBuilder: _swiperBuilder,
        // onTap: (int index) {
        //   Fluttertoast.showToast(msg: index.toString());
        // },
        pagination: SwiperPagination(
          //page 位置
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
          //设置page
          builder: DotSwiperPaginationBuilder(
            //FractionPaginationBuilder
            //背景颜色
            color: Colors.yellow,
            //当前位置颜色
            activeColor: Colors.white,
            //当前位置大小
            activeSize: 20,
            //其他位置大小
            size: 10,
            //间距大小
            space: 3,
          ),

          //   //page 另一种样式
          // builder: FractionPaginationBuilder(
          //   color: Colors.white,
          //   activeColor: Colors.red,
          //   activeFontSize: 40
          // )

          //page 另一种样式
          // builder: SwiperControl(
          //       iconPrevious: Icons.arrow_back_ios,
          //       iconNext: Icons.arrow_forward_ios,
          //       padding: EdgeInsets.all(5),
          //     )
        ),

        // layout: SwiperLayout.STACK,

        //用户拖拽的时候，是否停止自动播放
        autoplayDisableOnInteraction: true,
        //设定滚动时间
        autoplayDelay: 10000,

        controller: SwiperController(),
        //滚动方向
        scrollDirection: Axis.horizontal,
        // 动画时间，默认300.0毫秒
        duration: 300,
        //是否自动播放
        autoplay: true,
        //点击啊事件
        onTap: (int index) {
          Fluttertoast.showToast(msg: index.toString());
        },
        // 初始播放轮播时的下标位置
        index: 0,
        //无限轮播模式开关
        loop: true,
        // 动画的方式 个人感觉没啥区别
        curve: Curves.easeInSine,
      ),
    );
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return imgList[index];
  }

/* MARK: collection
 * @LastEditors: 赵翌然
 * @Version: 版本号, YYYY-MM-DD
 * @param {type} 
 * @return: 
 * @Deprecated: 否
 */
  Widget collectionView() {
    return Container(
      width: double.infinity,
      height: 100,
      color: Colors.yellow,
      child: GridView.count(
        scrollDirection: Axis.horizontal,
        //列数
        crossAxisCount: 1,
        //左右间离
        crossAxisSpacing: 20,
        //上下间距
        mainAxisSpacing: 20,

        padding: EdgeInsets.all(10),

        children: listView(),
      ),
    );
  }

  List<Widget> listView() {
    List<Widget> list = List();
    for (var i = 0; i < 20; i++) {
      list.add(
        GestureDetector(
            onTap: () {
              Fluttertoast.showToast(msg: "$i");
              print(i);
            },
            child: Container(
              color: Colors.blue,
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 50,
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    color: Colors.white,
                    child: Image.asset("assets/image/renlian.png",
                        fit: BoxFit.cover),
                  ),
                  Container(
                    child: Text("第$i"),
                  ),
                ],
              ),
            )),
      );
    }
    return list;
  }

  Widget initIcon() {
    return Container(
      width: double.infinity,
      height: 100,
      color: Colors.blue,
      child: Icon(
        Icons.arrow_downward,
        color: Colors.red,
        //语义标签 不会显示
        semanticLabel: "123",
        size: 64,
        //显示方向
        textDirection: TextDirection.rtl,
      ),
    );
  }

  Widget initIconButton() {
    return Container(
      width: double.infinity,
      height: 100,
      color: Colors.yellow,
      child: Column(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            iconSize: 50,
            focusColor: Colors.green,
            color: Colors.red,

            // color: Colors.red,
            onPressed: () {
              print("点击了");
            },
          ),
        ],
      ),
      // child:
    );
  }
}
