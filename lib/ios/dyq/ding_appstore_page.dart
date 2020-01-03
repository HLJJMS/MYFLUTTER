import 'package:flutter/material.dart';
import '../../util/routerUtil.dart';
class DingAppstorePage extends StatefulWidget {
  DingAppstorePage({Key key}) : super(key: key);

  @override
  _DingAppstorePageState createState() => _DingAppstorePageState();
}

class _DingAppstorePageState extends State<DingAppstorePage> with TickerProviderStateMixin {

  List<String> _games;
  bool isCanEnterDetailPage = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _games = ['是是是','顶顶顶顶','滴答滴答','柔柔弱弱若','顶顶顶顶','滴答滴答','柔柔弱弱若','顶顶顶顶','滴答滴答','柔柔弱弱若'];

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("仿appstore"),
      ),
      body: ListView.builder(
        itemCount: _games.length,
          addAutomaticKeepAlives: true,
          itemBuilder: (context,index){
          return createItemView(index);
          }
      ),
    );
  }


  Widget createItemView(int index) {
    var game = _games[index]; // 获取数据
    // 定义动画控制器
    var _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    // 定义动画
    var _animation =
    Tween<double>(begin: 1, end: 0.98).animate(_animationController);
    return Listener(
      onPointerDown: (event){
        print('onPointerDown');
        _animationController.forward(); // 点击的时候播放动画
      },
      onPointerMove: (event){
        print('onPointerMove');
        _animationController.reverse(); // cancel的时候回弹动画
        setState(() {
          isCanEnterDetailPage = false;
        });
      },
      onPointerUp: (event){
        print('onPointerUp');
        _animationController.reverse(); // cancel的时候回弹动画
        if (isCanEnterDetailPage){
          RouterUtil.navigateTo(
            context,
            "dingAppstoredetailPage/${index.toString()}",
          );
        }else{
          setState(() {
            isCanEnterDetailPage = true;
          });
        }
      },
      onPointerCancel: (event){
        print('onPointerCancel');
        _animationController.reverse(); // cancel的时候回弹动画
        setState(() {
          isCanEnterDetailPage = true;
        });
      },
      child: Container(
          height: 450,
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: ScaleTransition(
            scale: _animation, // 定义动画
            child: Stack( // 圆角图片为背景，上面为text
              children: <Widget>[
                Positioned.fill(
                  child: Hero(
                    tag: index.toString(),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      child: Image.asset(
                        'images/bggg.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        game,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),

                      Expanded(
                        child: Text(
                          game,
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),

                      Text(
                        game,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );

  }



}