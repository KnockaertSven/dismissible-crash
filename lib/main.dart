import 'package:flutter/material.dart';
import 'package:gridview_test/DismissibleList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => DimissibleList(),
        '/other': (context) => OtherPage(),
      },
    );
  }
}

class OtherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Text("A new page")),
      ),
    );
  }
}
