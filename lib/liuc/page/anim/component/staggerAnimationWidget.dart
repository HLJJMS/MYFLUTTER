import 'package:flutter/material.dart';

class StaggerAnimationWidget extends StatelessWidget {
  final AnimationController controller;
  Animation<double> opacity;
  Animation<double> width;
  Animation<double> height;
  Animation<EdgeInsets> padding;
  Animation<BorderRadius> borderRadius;
  Animation<Color> color;

  StaggerAnimationWidget({Key key, this.controller})
      : opacity = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 0.100, curve: Curves.ease),
          ),
        ),
        width = Tween(begin: 50.0, end: 150.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.125, 0.250, curve: Curves.ease),
          ),
        ),
        height = Tween(begin: 50.0, end: 150.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.250, 0.378, curve: Curves.ease),
          ),
        ),
        padding = EdgeInsetsTween(
          begin: EdgeInsets.only(bottom: 16.0),
          end: EdgeInsets.only(bottom: 75.0),
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.250, 0.375, curve: Curves.ease),
          ),
        ),
        borderRadius = BorderRadiusTween(
          begin: BorderRadius.circular(4.0),
          end: BorderRadius.circular(75.0),
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.375, 0.500, curve: Curves.ease),
          ),
        ),
        color = ColorTween(
          begin: Colors.indigo[100],
          end: Colors.orange[400],
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.5, 0.75, curve: Curves.ease),
          ),
        ),
        super(key: key);

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Container(
      padding: padding.value,
      alignment: Alignment.bottomCenter,
      child: Opacity(
        opacity: opacity.value,
        child: Container(
          width: width.value,
          height: height.value,
          decoration: BoxDecoration(
            color: color.value,
            border: Border.all(color: Colors.indigo[300], width: 3.0),
            borderRadius: borderRadius.value,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}
