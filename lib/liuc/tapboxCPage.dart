
import 'package:flutter/material.dart';

class ParentWidgetC extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ParentWidgetCState();
  }
}

class _ParentWidgetCState extends State<ParentWidgetC> {

  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    print("_handleTapboxChanged......");
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("混合状态管理"),
      ),
      body: Center(
        child: Container(
          child: TapboxC(
            active: _active, 
            onChanged: _handleTapboxChanged,
          ),
        ),
      )
    );
  }
}

class TapboxC extends StatefulWidget {
  const TapboxC({Key key, this.active, this.onChanged}) : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TapboxCState();
  }
}

class _TapboxCState extends State<TapboxC> {

  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    print("_handleTapDown......");
    setState(() {
      _highlight = true;
    });
  }
void _handleTapUp(TapUpDetails details) {
  print("_handleTapUp......");
    setState(() {
      _highlight = false;
    });
  }
  void _handleTapCannel() {
    print("_handleTapCannel......");
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    print("_handleTap......");
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTap: _handleTap,
      onTapCancel: _handleTapCannel,
      child: Container(
        child: Center(
          child: Text(
            widget.active ? 'Active' : 'Inactive',
            style: TextStyle(
              fontSize: 32,
              color: Colors.white
            )
          ),
        ),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight ? new Border.all(
            color: Colors.teal[700],
            width: 10
          ) : null,
        ),
      ),
    );
  }
  
}