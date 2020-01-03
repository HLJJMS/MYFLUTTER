import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/liuc/provider/CounterModel.dart';
import 'package:provider/provider.dart';

class DroviderSecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('providerSecondPage'),
      ),
      body: Consumer2<CounterModel, int>(
        builder: (context, CounterModel counter, int textSize, _) => Center(
          child: Text(
            "Value:${counter.value}",
            style: TextStyle(
              fontSize: textSize.toDouble(),
            ),
          ),
        ),
      ),
      floatingActionButton: Consumer<CounterModel>(
        builder: (context, CounterModel counter, child) =>
            FloatingActionButton(onPressed: counter.increment, child: child),
        child: Icon(Icons.add),
      ),
    );
  }
}
