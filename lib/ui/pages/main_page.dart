import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttermobiletemplate/bloc/bloc.dart';
import 'package:fluttermobiletemplate/handlers/form_validators_handler.dart';
import 'package:fluttermobiletemplate/models/user.dart';
import 'package:fluttermobiletemplate/ui/widgets/custom_text_form_field.dart';
import 'package:fluttermobiletemplate/ui/widgets/loading_dialog.dart';
import 'package:fluttermobiletemplate/ui/widgets/primary_flat_button.dart';
import 'package:fluttermobiletemplate/utils/constants.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  FocusNode _passwordFocusNode;
  TextEditingController _emailController;
  TextEditingController _passwordController;
  GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();

    _passwordFocusNode = FocusNode();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => LoadingDialog(),
          );
        } else if (state is RegisterSuccess) {
          BlocProvider.of<SharedPrefsBloc>(context).add(SetSharedPref(key: USERNAME_KEY, value: _emailController.text));
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Mobile Template"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    BlocBuilder<SharedPrefsBloc, SharedPrefsState>(
                      builder: (context, state) {
                        if (state is SharedPrefsLoaded && state.sharedPreferences.get(USERNAME_KEY) != null) {
                          return Column(
                            children: <Widget>[
                              Text(
                                "Hello, ${state.sharedPreferences.get(USERNAME_KEY)}!",
                                style: Theme.of(context).textTheme.headline,
                              ),
                              const SizedBox(height: 16),
                            ],
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                    CustomTextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      controller: _emailController,
                      validator: (value) => FormValidatorsHandler.validateEmail(value),
                      onFieldSubmitted: (value) => FocusScope.of(context).requestFocus(_passwordFocusNode),
                      labelText: "Username",
                      icon: Icons.alternate_email,
                    ),
                    const SizedBox(height: 16),
                    CustomTextFormField(
                      obscureText: true,
                      focusNode: _passwordFocusNode,
                      controller: _passwordController,
                      validator: (value) => FormValidatorsHandler.validatePassword(value),
                      onFieldSubmitted: (value) => _login(),
                      labelText: "Password",
                      icon: Icons.lock,
                    ),
                    const SizedBox(height: 16),
                    PrimaryFlatButton(
                      onPressed: () => _login(),
                      child: Text("Login"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login() {
    FocusScope.of(context).unfocus();

    if (formKey.currentState.validate()) {
      BlocProvider.of<RegisterBloc>(context).add(
        Register(
          User(
            username: _emailController.text,
            password: _passwordController.text,
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }
}
