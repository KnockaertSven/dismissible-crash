import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: FlatButton(
        onPressed: () => Navigator.of(context).pop(true),
        child: Text("A button"),
      ),
    );
  }
}
