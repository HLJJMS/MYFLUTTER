import 'package:flutter/material.dart';

class BaseCtrl {
  gotoPage(BuildContext context, Object page){
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (BuildContext context) => page
      )
    );
  }
}