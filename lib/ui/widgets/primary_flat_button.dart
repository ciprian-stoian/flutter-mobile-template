import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryFlatButton extends StatelessWidget {
  final Function onPressed;
  final Widget child;

  PrimaryFlatButton({
    this.onPressed,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Theme.of(context).primaryColor,
      textColor: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
