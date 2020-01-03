import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class FixTabBarView extends StatefulWidget {
  final TabController tabController;
  final PageController pageController;
  final List<Widget> children;
  final ScrollPhysics physics;
  final DragStartBehavior dragStartBehavior;
  final ValueChanged<int> onPageChange;

  FixTabBarView(
      {Key key,
      @required this.children,
      @required this.tabController,
      @required this.pageController,
      this.physics,
      this.dragStartBehavior,
      this.onPageChange})
      : assert(children != null),
        assert(dragStartBehavior != null),
        super(key: key);

  @override
  _FixTabBarViewState createState() => _FixTabBarViewState();
}

class _FixTabBarViewState extends State<FixTabBarView> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.tabController.dispose();
    widget.pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        dragStartBehavior: widget.dragStartBehavior,
        physics: widget.physics,
        controller: widget.pageController,
        children: widget.children,
        onPageChanged: (index) {
          widget.tabController.animateTo(index);
          widget.onPageChange(index);
        },
      ),
    );
  }
}
