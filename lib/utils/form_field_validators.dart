class FormFieldValidators {
  static String? email(String? value) {
    if (value == null) {
      return 'Please provide a valid email address';
    }
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!value.contains(emailRegex)) {
      return 'Please provide a valid email address';
    }

    return null;
  }

  static String? password(String? value) {
    if (value == null) {
      return 'Please provide a valid password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain a lower case character';
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain an upper case  character';
    }
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain special characters';
    }
    return null;
  }
}
