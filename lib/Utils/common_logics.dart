import 'package:email_validator/email_validator.dart';
import 'package:toast/toast.dart';

bool validateEmail(String? val) {
  if (val == null) {
    Toast.show('Email cannot be empty');
    return false;
  }
  if (val.isEmpty) {
    Toast.show('Email cannot be empty');
    return false;
  } else if (!EmailValidator.validate(val, true)) {
    Toast.show('Please enter a valid Email');
    return false;
  }
  return true;
}

bool validatePassword(String? val) {
  if (val == null) {
    Toast.show('Password cannot be empty');
    return false;
  }
  if (val.isEmpty) {
    Toast.show('Password cannot be empty');
    return false;
  } else if (val.length < 6) {
    Toast.show('Password length must be minimum 6 digits');
    return false;
  }
  return true;
}
