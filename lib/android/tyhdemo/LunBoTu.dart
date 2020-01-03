import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LunBoTu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LunBoTu();
  }
}

class _LunBoTu extends State<LunBoTu> {
  List<Widget> imgList = new List();
  List<NetworkImage> netImgList = new List();

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
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: new Column(
      children: <Widget>[
        new Container(
          width: double.infinity,
          height: 200,
          child: new Swiper(
            itemCount: imgList.length,
            itemBuilder: (BuildContext context, int index) {
              return imgList[index];
            },
            controller: SwiperController(),
            scrollDirection: Axis.horizontal,
            autoplay: true,
            duration: 300,
            onTap: (int index) {
              Fluttertoast.showToast(msg: index.toString());
            },
            pagination: SwiperPagination(
                alignment: Alignment.bottomLeft,

//            分数形式
//            builder: FractionPaginationBuilder(
//                color: Colors.white,
//                activeColor: Colors.redAccent,
//                activeFontSize: 40
//            ),
                builder: DotSwiperPaginationBuilder(
                  color: Colors.red,
                  activeColor: Colors.greenAccent,
                  space: 10,
                  activeSize: 20,
                )),
          ),
        ),
        Container(
          height: 20,
        ),
        Container(
          width: double.infinity,
          height: 200,
          child: new Swiper(
            itemCount: netImgList.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: netImgList[index]
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ));
            },
            controller: SwiperController(),
            scrollDirection: Axis.horizontal,
            autoplay: true,
            duration: 300,
            onTap: (int index) {
              Fluttertoast.showToast(msg: index.toString());
            },
            pagination: SwiperPagination(
                alignment: Alignment.bottomLeft,

//            分数形式
//            builder: FractionPaginationBuilder(
//                color: Colors.white,
//                activeColor: Colors.redAccent,
//                activeFontSize: 40
//            ),
                builder: DotSwiperPaginationBuilder(
                  color: Colors.red,
                  activeColor: Colors.greenAccent,
                  space: 10,
                  activeSize: 20,
                )),
          ),
        )
      ],
    ));
  }
}
