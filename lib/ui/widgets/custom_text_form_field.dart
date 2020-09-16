import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final bool autofocus;
  final bool enabled;
  final bool tappable;
  final int maxLines;
  final TextInputType keyboardType;
  final bool obscureText;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final FocusNode focusNode;
  final TextEditingController controller;
  final Function(String) validator;
  final Function(String) onFieldSubmitted;
  final String labelText;
  final String hintText;
  final IconData icon;
  final Function(String) onChanged;
  final Function() onTap;

  CustomTextFormField({
    this.autofocus = false,
    this.enabled,
    this.tappable = true,
    this.maxLines = 1,
    this.keyboardType,
    this.obscureText = false,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.focusNode,
    this.controller,
    this.validator,
    this.onFieldSubmitted,
    this.labelText,
    this.hintText,
    this.icon,
    this.onChanged,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: TextFormField(
        autofocus: autofocus,
        enabled: enabled,
        maxLines: maxLines,
        keyboardType: keyboardType,
        obscureText: obscureText,
        textInputAction: textInputAction,
        textCapitalization: textCapitalization,
        focusNode: focusNode,
        controller: controller,
        validator: validator,
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
        decoration: InputDecoration(
          isDense: true,
          labelText: labelText,
          hintText: hintText,
          prefixIcon: icon != null ? Icon(icon) : null,
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.black12),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Theme.of(context).errorColor),
          ),
          errorStyle: TextStyle(
            color: Theme.of(context).errorColor,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Theme.of(context).errorColor),
          ),
        ),
      ),
    );
  }
}
