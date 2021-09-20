

import 'package:flutter/cupertino.dart';
import 'package:mecar_test/data/model/userAuth.dart';
import 'package:mecar_test/data/source/local/user_local_datasource.dart';

abstract class UserRepository {
  void saveListUser(List<UserAuth> listUser);
  List<UserAuth> getListUser();
}

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource localDataSrc;

  UserRepositoryImpl(
      {@required this.localDataSrc});

  @override
  List<UserAuth> getListUser() {
    final list = localDataSrc.getListUser();
    return list;
  }

  @override
  void saveListUser(List<UserAuth> listUser) {
    return localDataSrc.saveListUser(listUser);
  }

}