import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bloc.dart';

class SharedPrefsBloc extends Bloc<SharedPrefsEvent, SharedPrefsState> {
  @override
  SharedPrefsState get initialState => SharedPrefsInit();

  @override
  Stream<SharedPrefsState> mapEventToState(SharedPrefsEvent event) async* {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (event is SetSharedPref) {
      event.sharedPrefs.forEach((key, value) => sharedPreferences.setString(key, value));

      yield SharedPrefsLoaded(sharedPreferences);
    }

    if (event is GetSharedPrefs) {
      yield SharedPrefsLoaded(sharedPreferences);
    }
  }
}
