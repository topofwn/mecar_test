import 'dart:io';

import 'package:hive/hive.dart';
import 'package:mecar_test/data/source/local/pref/app_preferences.dart';
import 'package:mecar_test/data/source/local/pref/app_preferences_impl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../injection/injector.dart';

class ComponentsModule extends DIModule {
  @override
  Future<void> provides() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton(() => sharedPreferences);

    final appDocDirectory = await getApplicationDocumentsDirectory();
    final pathStored = '${appDocDirectory.path}';
    await Directory(pathStored).create(recursive: true);
    ///Database
    Hive.init(pathStored);
    final box = await Hive.openBox('data');

    final AppPreferences appPreferences =
        AppPreferencesImpl(sharedPreferences: sharedPreferences, box: box);
    sl.registerLazySingleton(() => appPreferences);


  }
}
