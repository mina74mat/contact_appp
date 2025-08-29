class Validation {
  static String? validateEmptyField(String? value, String message) {
    if (value == null || value.isEmpty) {
      return message;
    }
    return null;
  }

  static String? validateEmailField(String? value) {
    String? result = validateEmptyField(value, "You should enter email");
    if (result == null) {
      if (!isValidEmail(value!)) {
        result = "Email is Not Valid";
      }
    }
    return result;
  }

  static bool isValidEmail(String email) {
    final bool emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }
}
