class FormValidatorsHandler {
  static String validateEmail(String value) {
    if (value.isEmpty) {
      return "Please enter your Email";
    } else {
      return null;
    }
  }

  static String validatePassword(String value) {
    if (value.isEmpty || value.length < 6) {
      return "Please enter a Password of at least 6 characters";
    } else {
      return null;
    }
  }
}
