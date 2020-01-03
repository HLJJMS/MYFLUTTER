import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/* MARK: 自定义选择器
 * @LastEditors: 郑群昌
 * @Version: 版本号, YYYY-MM-DD
 * @param {type} 
 * @return: 
 * @Deprecated: 否
 */
class ZQCPageBar extends StatelessWidget {
  final selectPage;
  final pageController;
  final ValueChanged<int> onChanged;
  ZQCPageBar({
    Key key,
    this.onChanged,
    this.selectPage,
    this.pageController,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return _buildPageBar();
  }

  Widget _buildPageBar() {
    return Container(
      padding: EdgeInsets.only(left: 16),
      color: Colors.blue,
      alignment: Alignment.centerLeft,
      child: Row(
        children: <Widget>[
          FlatButton(
            child: Text(
              '第一项',
              style: TextStyle(
                  color: selectPage == 0 ? Colors.yellow : Colors.grey),
            ),
            onPressed: () {
              pageController.animateToPage(0,
                  curve: Curves.ease, duration: Duration(milliseconds: 200));
              onChanged(0);
            },
          ),
          FlatButton(
            child: Text(
              '第二项',
              style: TextStyle(
                  color: selectPage == 1 ? Colors.yellow : Colors.grey),
            ),
            onPressed: () {
              pageController.animateToPage(1,
                  curve: Curves.ease, duration: Duration(milliseconds: 200));
              onChanged(1);
            },
          ),
          FlatButton(
            child: Text(
              '第三项',
              style: TextStyle(
                  color: selectPage == 2 ? Colors.yellow : Colors.grey),
            ),
            onPressed: () {
              pageController.animateToPage(2,
                  curve: Curves.ease, duration: Duration(milliseconds: 200));
              onChanged(2);
            },
          ),
        ],
      ),
    );
  }
}

/* MARK: pageView
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
enum PageViewType {
  typeNomal, // 0
  typeWithRemaining, // 1
}

class ZQCPageView extends StatelessWidget {
  final PageViewType pageViewType;
  final selectPage;
  final pageController;
  final ValueChanged<int> onChanged;
  final pages;
  ZQCPageView({
    Key key,
    this.pageViewType,
    this.onChanged,
    this.selectPage,
    this.pageController,
    this.pages,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    switch (pageViewType) {
      case PageViewType.typeNomal:
        return _buildPageView();
        break;
      case PageViewType.typeWithRemaining:
        return _buildPageViewSliverFillRemaining();
        break;
      default:
    }
    return _buildPageView();
  }

  Widget _buildPageView() {
    return Container(
      color: Colors.yellow,
      child: PageView.builder(
        onPageChanged: onChanged,
        controller: pageController,
        itemBuilder: (BuildContext context, int index) {
          return pages[index];
        },
        itemCount: pages.length,
      ),
    );
  }

  Widget _buildPageViewSliverFillRemaining() {
    return SliverFillRemaining(
      child: Container(
        color: Colors.yellow,
        child: PageView.builder(
          onPageChanged: onChanged,
          controller: pageController,
          itemBuilder: (BuildContext context, int index) {
            return pages[index];
          },
          itemCount: pages.length,
        ),
      ),
    );
  }
}
