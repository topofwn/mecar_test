import 'package:mecar_test/data/model/userAuth.dart';

abstract class AppPreferences {
  void saveListUser(String data);

  String getListUser();

  Future<void> clearUserData();

  static const CACHED_LIST_USER = 'CACHED_LIST_USER';
}
