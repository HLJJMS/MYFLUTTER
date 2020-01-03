import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GestureRecognizerScreen extends StatefulWidget {
  GestureRecognizerScreen({Key key}) : super(key: key);

  @override
  _GestureRecognizerScreenState createState() =>
      _GestureRecognizerScreenState();
}

class _GestureRecognizerScreenState extends State<GestureRecognizerScreen> {
  TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('手势识别'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Text.rich(
              TextSpan(
                children: <InlineSpan>[
                  TextSpan(
                    text: "Room is not",
                    style: TextStyle(fontSize: 25.0),
                  ),
                  TextSpan(
                      text: "built",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: _tapGestureRecognizer
                        ..onTap = () {
                          showInSnackBar("built: 建造");
                        }),
                  TextSpan(
                    text: " in one day.",
                    style: TextStyle(fontSize: 25),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(
          value,
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
