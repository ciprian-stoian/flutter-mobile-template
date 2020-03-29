import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoDialog extends StatelessWidget {
  final String title;
  final Widget child;

  InfoDialog({
    @required this.title,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 0,
      title: Text(
        title,
        textAlign: TextAlign.center,
      ),
      content: child,
    );
  }
}
