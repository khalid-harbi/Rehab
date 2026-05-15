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

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  // static String? validatePassword(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Password is required';
  //   }

  //   if (value.length < 12) {
  //     return 'Password must be at least 12 characters';
  //   }

  //   if (!RegExp(r'[A-Z]').hasMatch(value)) {
  //     return 'Password must contain at least one uppercase letter';
  //   }

  //   if (!RegExp(r'[a-z]').hasMatch(value)) {
  //     return 'Password must contain at least one lowercase letter';
  //   }

  //   if (!RegExp(r'[0-9]').hasMatch(value)) {
  //     return 'Password must contain at least one number';
  //   }

  //   if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
  //     return 'Password must contain at least one special character';
  //   }

  //   if (value.contains(' ')) {
  //     return 'Password must not contain spaces';
  //   }

  //   return null;
  // }

  //=================================
  //   static String? validatePassword(String? value) {
  //   if (value == null || value.trim().isEmpty) {
  //     return 'Password is required';
  //   }

  //   final password = value.trim();

  //   if (password.length < 12) {
  //     return 'Password must be at least 12 characters';
  //   }

  //   if (!RegExp(r'[A-Z]').hasMatch(password)) {
  //     return 'Must contain uppercase letter';
  //   }

  //   if (!RegExp(r'[a-z]').hasMatch(password)) {
  //     return 'Must contain lowercase letter';
  //   }


  //   if (!RegExp(r'\d').hasMatch(password)) {
  //     return 'Must contain a number';
  //   }

  //   if (!RegExp(r'[!@#$%^&*()_\-+=\[{\]};:<>|./?]').hasMatch(password)) {
  //     return 'Must contain special character';
  //   }

  //   if (password.contains(' ')) {
  //     return 'Password must not contain spaces';
  //   }

  //   if (RegExp(r'(.)\1{3,}').hasMatch(password)) {
  //     return 'Too many repeated characters';
  //   }

  //   final weakPasswords = [
  //     'password',
  //     '12345678',
  //     'qwerty',
  //     'admin',
  //     'welcome',
  //   ];

  //   if (weakPasswords.any(
  //     (weak) => password.toLowerCase().contains(weak),
  //   )) {
  //     return 'Password is too common';
  //   }

  //   return null;
  // }

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

  static double passwordStrength(String password) {
    double strength = 0;

    if (password.length >= 12) strength += 0.25;
    if (RegExp(r'[A-Z]').hasMatch(password)) strength += 0.25;
    if (RegExp(r'[a-z]').hasMatch(password)) strength += 0.15;
    if (RegExp(r'\d').hasMatch(password)) strength += 0.15;
    if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) {
      strength += 0.20;
    }

    return strength.clamp(0, 1);
  }
}
