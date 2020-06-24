import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttermobiletemplate/utils/app_localizations.dart';

class LoadingDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 0,
      title: Text(
        AppLocalizations.of(context).get(key: "loading"),
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
