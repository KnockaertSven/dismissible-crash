import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gridview_test/CustomDialog.dart';

class DimissibleList extends StatefulWidget {
  @override
  _DimissibleListState createState() => _DimissibleListState();
}

class _DimissibleListState extends State<DimissibleList> {
  int childSize = 3;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: childSize,
        itemBuilder: (context, index) {
          if(index == 0){
            return _buildNextPageAction(context);
          }
          return _buildDismissible();
        },
      ),
    );
  }

  Widget _buildNextPageAction(ctx) {
    return FlatButton(
      child: Text("Go to a new page"),
      onPressed: () => Navigator.of(ctx).pushNamed('/other'),
    );
  }

  Dismissible _buildDismissible() {
    GlobalKey key = GlobalKey();

    return Dismissible(
      key: key,
      child: ListTile(
        title: Container(
          padding: const EdgeInsets.all(8.0),
          color: Colors.red,
          child: Text("A dismissible. Nice."),
        ),
      ),
      confirmDismiss: (direction) async {
        await Future.delayed(const Duration(milliseconds: 100), () {});
        return showDialog(
          context: context,
          builder: (context) => CustomDialog(),
        );
      },
      resizeDuration: null,
      onDismissed: (direction) => childSize--,
    );
  }
}
