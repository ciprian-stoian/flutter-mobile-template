abstract class SharedPrefsEvent {
  const SharedPrefsEvent();
}

class SetSharedPref extends SharedPrefsEvent {
  final Map<String, String> sharedPrefs;

  SetSharedPref(this.sharedPrefs);
}

class GetSharedPrefs extends SharedPrefsEvent {}
