import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:mecar_test/data/repository/user_repository.dart';
import 'package:mecar_test/data/source/local/user_local_datasource.dart';


import '../injection/injector.dart';

class RepositoryModule extends DIModule {
  @override
  Future<void> provides() async {
    /// Repositories

    sl.registerFactory<UserLocalDataSource>(
      () => UserLocalDataSourceImpl(appPreferences: sl()),
    );
    sl.registerFactory<UserRepository>(
            () => UserRepositoryImpl( localDataSrc: sl()));
  }
}
