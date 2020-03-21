import 'package:fluttermobiletemplate/models/user.dart';

abstract class RegisterEvent {
  const RegisterEvent();
}

class Register extends RegisterEvent {
  final User userModel;

  const Register(this.userModel);
}
