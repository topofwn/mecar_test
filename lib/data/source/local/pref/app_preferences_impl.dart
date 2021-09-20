import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_preferences.dart';

class AppPreferencesImpl extends AppPreferences {
  final SharedPreferences sharedPreferences;
  final Box box;

  AppPreferencesImpl({
    @required this.sharedPreferences,
    @required this.box,
  });

  @override
  String getListUser() {
    return box.get(AppPreferences.CACHED_LIST_USER, defaultValue: null);
  }

  @override
  void saveListUser(String data) {
    box.put(AppPreferences.CACHED_LIST_USER, data);
  }

  @override
  Future<void> clearUserData() async{
    if (box.containsKey(AppPreferences.CACHED_LIST_USER)) {
      await box.delete(AppPreferences.CACHED_LIST_USER);
    }

  }

}
