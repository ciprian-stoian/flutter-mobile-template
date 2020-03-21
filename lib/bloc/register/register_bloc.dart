import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fluttermobiletemplate/repositories/authentication_repository.dart';
import 'package:http/http.dart';

import '../bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthenticationRepository authenticationRepository;

  RegisterBloc(this.authenticationRepository);

  @override
  RegisterState get initialState => RegisterInit();

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is Register) {
      yield RegisterLoading();

      Response response = await authenticationRepository.register(event.userModel);

      if (response.statusCode == 201) {
        yield RegisterSuccess();
      } else {
        yield RegisterError();
      }
    }
  }
}
