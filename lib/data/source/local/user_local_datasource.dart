

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mecar_test/data/model/userAuth.dart';
import 'package:mecar_test/data/source/local/pref/app_preferences.dart';

abstract class UserLocalDataSource {
  List<UserAuth> getListUser();
  void saveListUser(List<UserAuth> listUser);
}

class UserLocalDataSourceImpl implements UserLocalDataSource {

  final AppPreferences appPreferences;

  UserLocalDataSourceImpl({@required this.appPreferences});

  @override
  List<UserAuth> getListUser() {
    try {
      final jsonString = appPreferences.getListUser();
      if (jsonString != null) {
        final List<dynamic> strMap = json.decode(jsonString);
        final data = strMap.map((v) => UserAuth.fromJson(v)).toList();
        return data;
      } else {
        return null;
      }
    } on Exception catch (exception) {
      print(exception);
      return null;
    } catch (error) {
      print(error);
      return null;
    }
  }

  @override
  void saveListUser(List<UserAuth> listUser) {
    final str = listUser.map((v) => v.toJson()).toList();
    appPreferences.saveListUser(json.encode(str));
  }

}