abstract class SharedPrefsEvent {
  const SharedPrefsEvent();
}

class SetSharedPref extends SharedPrefsEvent {
  final String key;
  final String value;

  SetSharedPref({
    this.key,
    this.value,
  });
}

class GetSharedPrefs extends SharedPrefsEvent {}
