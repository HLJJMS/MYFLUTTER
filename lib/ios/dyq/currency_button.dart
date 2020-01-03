import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class CurrencyButton extends StatefulWidget {

  EdgeInsetsGeometry padding;
  Color color;
  Decoration decoration;
  double width;
  double height;
  EdgeInsetsGeometry margin;
  Widget text;
  GestureTapCallback callBack;
  CurrencyButton(this.text,{this.padding = EdgeInsets.zero,this.color = Colors.white,this.decoration,this.width,this.height = 44,this.margin = EdgeInsets.zero,this.callBack});



  @override
  _CurrencyButtonState createState() => _CurrencyButtonState();
}

class _CurrencyButtonState extends State<CurrencyButton> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: widget.callBack,
      child: Container(
        color: widget.decoration == null ? widget.color:null,
        height: widget.height,
        width: widget.width,
        padding: widget.padding,
        margin: widget.margin,
        decoration: widget.decoration,
        alignment: Alignment.center,
        child: widget.text,
      ),
    );
  }
}