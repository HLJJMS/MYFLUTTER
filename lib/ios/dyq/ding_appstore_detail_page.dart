import 'package:flutter/material.dart';

class DingAppstoreDetailPage extends StatefulWidget {

  String tagStr;

  DingAppstoreDetailPage(this.tagStr);

  @override
  _DingAppstorePageState createState() => _DingAppstorePageState();


}
class _DingAppstorePageState extends State<DingAppstoreDetailPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('详情页'),),
      body: Center(
        child: Column(
          children: <Widget>[
            Hero(
              tag: widget.tagStr == '' ? null:widget.tagStr,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: Image.asset(
                  'images/bggg.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Text('是的发送到发送到' * 10),
//            Stepper
          ],
        ),
      ),
    );
  }
}