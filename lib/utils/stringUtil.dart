import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

String format(String template, List<Object> arguments) {
  String result = "";
  int argumentsIndex = 0;
  for (int index = 0; index < template.length; index++) {
    if (template.codeUnitAt(index) == 37 /* ascii '%' */) {
      result += arguments[argumentsIndex++].toString();
    } else {
      result += template.substring(index, index + 1);
    }
  }
  return result;
}

bool isNumeric(String s) {
  if (s == null) {
    return false;
  }
   return double.tryParse(s) != null;
}


String generateMd5(String data) {
  var content = new Utf8Encoder().convert(data);
  var digest = md5.convert(content);
  // This is actually digest.toString()
  return hex.encode(digest.bytes);
}


String validateName(String value) {
  if (value == null ||  value.isEmpty) return 'Name is required';
//  final RegExp nameExp = new RegExp(r'^[A-za-z ]+$');
//  if (!nameExp.hasMatch(value))
//    return 'Please enter only alphabetical characters';
  return null;
}

String validatePhoneNumber(String value) {
  if (value == null || value.isEmpty) return 'Phone is required';
  var pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  final RegExp phoneExp = new RegExp(pattern);
//  if (value.length < 10) {
//    return 'Phone atleast 10 digits';
//  } else if (value.length > 15) {
//    return 'Phone length too long';
//  } else
    if (!phoneExp.hasMatch(value)) {
    return 'Invalid phone number';
  }
  return null;
}

String validateNumber(String value ) {
  var pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  final RegExp phoneExp = new RegExp(pattern);
//  if (value.length < 10) {
//    return 'Phone atleast 10 digits';
//  } else if (value.length > 15) {
//    return 'Phone length too long';
//  } else
  if (!phoneExp.hasMatch(value)) {
    return 'Invalid number';
  }
  return null;
}

String validateUserName(String value) {
  if (value == null || value.isEmpty) return 'Username is required';
  return null;
}

String validateEmail(String value) {
  if (value == null || value.isEmpty) return 'Email is required';
  final RegExp nameExp = new RegExp(r'^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$');
  if (!nameExp.hasMatch(value)) return 'Invalid email address';
  return null;
}

String validateEmail2(String value) {
  if (value == null || value.isEmpty) return null;
  final RegExp nameExp = new RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  if (!nameExp.hasMatch(value)) return 'Invalid email address';
  return null;
}

String validatePassword(String value) {
  if (value == null || value.isEmpty) return 'missing password';
  return null;
}

String validateRePassword(String pass, String repass) {
  if (repass != pass) return 'Re-password not match with Password.';
  return null;
}

String xoaDau(String str) {
  str = str.replaceAll(new RegExp(r'[à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ]'), "a");
  str = str.replaceAll(new RegExp(r'[è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ]'), "e");
  str = str.replaceAll(new RegExp(r'[ì|í|ị|ỉ|ĩ]'), "i");
  str = str.replaceAll(new RegExp(r'[ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ]'), "o");
  str = str.replaceAll(new RegExp(r'[ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ]'), "u");
  str = str.replaceAll(new RegExp(r'[ỳ|ý|ỵ|ỷ|ỹ]'), "y");
  str = str.replaceAll("đ", "d");

  return str;
}

bool isXoaDau(String str) {
  String result;
  result = str.replaceAll(new RegExp(r'[à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ]'), "a");
  result = result.replaceAll(new RegExp(r'[è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ]'), "e");
  result = result.replaceAll(new RegExp(r'[ì|í|ị|ỉ|ĩ]'), "i");
  result= result.replaceAll(new RegExp(r'[ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ]'), "o");
  result = result.replaceAll(new RegExp(r'[ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ]'), "u");
  result = result.replaceAll(new RegExp(r'[ỳ|ý|ỵ|ỷ|ỹ]'), "y");
  result = result.replaceAll("đ", "d");
  return result != str;
}
