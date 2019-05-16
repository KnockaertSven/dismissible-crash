import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gridview_test/CustomDialog.dart';

class DimissibleList extends StatefulWidget {
  @override
  _DimissibleListState createState() => _DimissibleListState();
}

class _DimissibleListState extends State<DimissibleList> {
  List<Widget> children = [];

  @override
  void initState() {
    children.add(_buildNextPageAction(context));
    children.add(_buildDismissible());
    children.add(_buildDismissible());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: children.length,
        itemBuilder: (context, index) => children[index],
      ),
    );
  }

  Widget _buildNextPageAction(context) {
    return FlatButton(
      child: Text("Go to a new page"),
      onPressed: () => Navigator.of(context).pushNamed('/other'),
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
      onDismissed: (direction) => children.removeAt(1),
    );
  }
}
