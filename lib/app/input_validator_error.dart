mixin InputValidatorError {
  static String? getLinkValidator(String? value) {
    final linkRegex =
        RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+');

    return value != null && linkRegex.hasMatch(value)
        ? null
        : "Enter a valid link";
  }
}
