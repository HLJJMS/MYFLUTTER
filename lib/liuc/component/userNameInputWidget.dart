import 'package:flutter/material.dart';

class UserNameInputWidget extends StatelessWidget {
  final TextEditingController userNameEditCtrl;
  final FocusNode userNameFocusNode;
  final Function onClick;

  const UserNameInputWidget(
      {Key key, this.userNameEditCtrl, this.userNameFocusNode, this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: userNameEditCtrl,
        focusNode: userNameFocusNode,
        decoration: InputDecoration(
          hintText: '登录名/邮箱/手机',
          border: InputBorder.none,
          prefixIcon: Icon(Icons.person),
          suffixIcon: (userNameEditCtrl.text ?? "").isEmpty
              ? IconButton(
                  icon: Icon(Icons.scanner),
                  onPressed: () => {},
                )
              : IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    userNameEditCtrl.clear();
                    userNameFocusNode.unfocus();
                    onClick();
                  },
                ),
        ),
      ),
    );
  }
}
