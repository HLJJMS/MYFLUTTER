import 'package:flutter/material.dart';
import 'transaction_password_text_field.dart';
class DingPwdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("交易密码"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 100),
            child: TransactionPasswordTextField(
              44,
              margin: EdgeInsets.only(left: 15,right: 15),
              callback: (text){
                print('当前pwd为:' + text);
              },
            ),
          ),
        ],
      ),
    );
  }
}
