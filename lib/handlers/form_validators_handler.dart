import 'package:flutter/cupertino.dart';
import 'package:fluttermobiletemplate/utils/app_localizations.dart';

class FormValidatorsHandler {
  static BuildContext context;

  static FormValidatorsHandler of(BuildContext buildContext) {
    if (context == null ) {
      context = buildContext;
    }

    return FormValidatorsHandler();
  }

  String validateEmail(String value) {
    if (value.isEmpty) {
      return AppLocalizations.of(context).get(key: "formEmail");
    } else {
      return null;
    }
  }

  String validatePassword(String value) {
    if (value.isEmpty || value.length < 6) {
      return AppLocalizations.of(context).get(key: "formPassword");
    } else {
      return null;
    }
  }
}
