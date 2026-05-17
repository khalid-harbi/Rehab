// validators.dart
class Validators {
  Validators._();

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[\w\.-]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(value)) {
      return 'Invalid email address';
    }
    return null;
  }

  // static String? validatePassword(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Password is required';
  //   }
  //   if (value.length < 8) {
  //     return 'Password must be at least 8 characters';
  //   }
  //   return null;
  // }

    static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Password is required';
    }

    final password = value.trim();

    if (password.length < 12) {
      return 'Password must be at least 12 characters';
    }

    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return 'Must contain uppercase letter';
    }

    if (!RegExp(r'[a-z]').hasMatch(password)) {
      return 'Must contain lowercase letter';
    }

    if (!RegExp(r'\d').hasMatch(password)) {
      return 'Must contain a number';
    }

    if (!RegExp(r'[!@#$%^&*()_\-+=\[{\]};:<>|./?]').hasMatch(password)) {
      return 'Must contain special character';
    }

    if (password.contains(' ')) {
      return 'Password must not contain spaces';
    }

    if (RegExp(r'(.)\1{3,}').hasMatch(password)) {
      return 'Too many repeated characters';
    }

    final weakPasswords = [
      'password',
      '12345678',
      'qwerty',
      'admin',
      'welcome',
    ];

    if (weakPasswords.any(
      (weak) => password.toLowerCase().contains(weak),
    )) {
      return 'Password is too common';
    }

    return null;
  }

  static double passwordStrength(String value) {
    if (value.trim().isEmpty) return 0.0;

    final password = value.trim();
    int score = 0;
    int totalChecks = 6;

    if (password.length >= 12) score++;

    if (RegExp(r'[A-Z]').hasMatch(password)) score++;

    if (RegExp(r'[a-z]').hasMatch(password)) score++;

    if (RegExp(r'\d').hasMatch(password)) score++;

    if (RegExp(r'[!@#$%^&*()_\-+=\[{\]};:<>|./?]').hasMatch(password)) score++;

    bool isTooCommon = [
      'password',
      '12345678',
      'qwerty',
      'admin',
      'welcome',
    ].any((weak) => password.toLowerCase().contains(weak));

    bool hasRepeated = RegExp(r'(.)\1{3,}').hasMatch(password);
    bool hasSpace = password.contains(' ');

    if (!isTooCommon && !hasRepeated && !hasSpace) {
      score++;
    }

    return score / totalChecks;
  }

  static String? validateRequired(String? value, {String? fieldName}) {
    if (value == null || value.isEmpty) {
      return '${fieldName ?? 'This field'} is required';
    }
    return null;
  }

  static String? validateMinLength(String? value, int minLength) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    if (value.length < minLength) {
      return 'Must be at least $minLength characters';
    }
    return null;
  }
}
