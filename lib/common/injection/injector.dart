
import 'package:get_it/get_it.dart';
import 'package:mecar_test/common/modules/bloc_module.dart';
import 'package:mecar_test/common/modules/repository_module.dart';

final sl = GetIt.instance;

abstract class DIModule {
  void provides();
}

class Injection {
  static Future<void> inject() async {
    await RepositoryModule().provides();
    await BlocModule().provides();
  }
}