class AppValidator {
  static String? validateUserID(String? value) {
    if (value == null || value.isEmpty) {
      return 'The User ID can not be empty';
    }
    return null;
  }

  static String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return "Please enter email address  ";
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9-_]+\.[a-zA-Z]+")
        .hasMatch(value.trim())) {
      return "please submit a valid email address";
    }
    return null;
  }

  bool isPasswordValid(String password) {
    final RegExp passwordRegExp = RegExp(
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\W_])[A-Za-z\d\W_]{8,25}$',
    );

    return passwordRegExp.hasMatch(password);
  }

  static String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return "Please enter your password";
    } else if (value.length < 6) {
      return "password must be at least 6 characters long";
    }
    // else if (!isPasswordValid(value)) {
    //   return 'Password should contain an alphabet, a special character and a number ';
    // }
    // }
    return null;
  }

  static String? confirm_passwordValidator(String? value) {
    if (value!.isEmpty) {
      return "Please enter confirm password ";
    } else if (value.length < 5) {
      return "the password must be the same";
    }
    return null;
  }

  static String? nameValidator(String? value) {
    if (value!.isEmpty) {
      return "please enter your first name ";
    } else if (value.length < 3) {
      return "please enter at least 3 characters long";
    }
    return null;
  }

  static String? lastnameValidator(String? value) {
    if (value!.isEmpty) {
      return "please enter your last name";
    } else if (value.length < 3) {
      return "please enter at least 3 characters long";
    }
    return null;
  }

  static String? mobileValidator(String? value) {
    if (value!.isEmpty) {
      return "please enter phone number";
    } else if (value.length < 6 || value.length > 11) {
      return "enter a valid phone number";
    }
    return null;
  }

  static String? currentpasswordValidator(String? value) {
    if (value!.isEmpty) {
      return "please enter your current password";
    } else if (value.length < 5) {
      return "password must be the same";
    }
    return null;
  }

  static String? emptyValidator(String? value) {
    if (value!.isEmpty) {
      return "please enter some text";
    }
    return null;
  }
}
