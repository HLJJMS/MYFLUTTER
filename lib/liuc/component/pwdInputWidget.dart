import 'package:flutter/material.dart';

class PwdInputWidget extends StatelessWidget {
  final TextEditingController pwdEditCtrl;
  final FocusNode pwdFocusNode;
  final Function clearClick;
  final Function forgetPwdClick;
  const PwdInputWidget(
      {Key key,
      this.pwdEditCtrl,
      this.pwdFocusNode,
      this.clearClick,
      this.forgetPwdClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: pwdEditCtrl,
        focusNode: pwdFocusNode,
        obscureText: true,
        decoration: InputDecoration(
          hintText: "密码",
          border: InputBorder.none,
          prefixIcon: Icon(Icons.remove_red_eye),
          suffixIcon: (pwdEditCtrl.text ?? "").isEmpty
              ? FlatButton(
                  child: Text("忘记密码"),
                  onPressed: () {
                    pwdFocusNode.unfocus();
                    // _userNameFocusNode.unfocus();
                    forgetPwdClick();
                  },
                )
              : IconButton(
                  icon: Icon(Icons.cancel),
                  color: Colors.grey,
                  onPressed: () {
                    pwdEditCtrl.clear();
                    pwdFocusNode.unfocus();
                    clearClick();
                  },
                ),
        ),
        onChanged: (val) {
          // print(val);
          // if (val.trim().length > 1 &&
          //     _userNameEditCtrl.text.length > 1) {
          //   print("都有值了");
          // }
        },
      ),
    );
  }
}
