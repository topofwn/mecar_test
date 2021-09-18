import 'package:data_connection_checker/data_connection_checker.dart';


import '../injection/injector.dart';

class RepositoryModule extends DIModule {
  @override
  Future<void> provides() async {
    /// Repositories
//    sl.registerLazySingleton<NetworkInfo>(
//      () => NetworkInfoImpl(sl()),
//    );
//    sl.registerLazySingleton(() => DataConnectionChecker());
//
//    /// Repositories - Remote
//    sl.registerFactory<UserRemoteDataSource>(
//      () => UserRemoteDataSourceImpl(),
//    );
//    sl.registerFactory<BookingRemoteDataSource>(
//      () => BookingRemoteDataSourceImpl(),
//    );
//    sl.registerFactory<ServiceRemoteDataSource>(
//      () => ServiceRemoteDataSourceImpl(),
//    );
//    sl.registerFactory<TipRemoteDataSource>(
//      () => TipRemoteDataSourceImpl(),
//    );
//    sl.registerFactory<HomeRemoteDataSource>(
//      () => HomeRemoteDataSourceImpl(),
//    );
//    sl.registerFactory<StaticContentRemoteDataSource>(
//      () => StaticContentRemoteDataSourceImpl(),
//    );
//    sl.registerFactory<ConfigRemoteDataSource>(
//      () => ConfigRemoteDataSourceImpl(),
//    );
//    sl.registerFactory<HelpAndReportRemoteDataSource>(
//      () => HelpAndReportRemoteDataSourceImpl(),
//    );
//    sl.registerFactory<NotificationRemoteDataSource>(
//      () => NotificationRemoteDataSourceImpl(),
//    );
//    sl.registerFactory<PaymentRemoteDataSource>(
//      () => PaymentRemoteDataSourceImpl(),
//    );
//
//    /// Repositories - LocalData
//    ///
//    sl.registerFactory<UserLocalDataSource>(
//      () => UserLocalDataSourceImpl(appPreferences: sl()),
//    );
//    sl.registerFactory<PaymentLocalDataSource>(
//      () => PaymentLocalDataSourceImpl(appPreferences: sl()),
//    );
//    sl.registerFactory<BookingLocalDataSource>(
//      () => BookingLocalDataSourceImpl(appPreferences: sl()),
//    );
//    sl.registerFactory<ServiceLocalDataSource>(
//      () => ServiceLocalDataSourceImpl(appPreferences: sl()),
//    );
//    sl.registerFactory<TipLocalDataSource>(
//      () => TipLocalDataSourceImpl(appPreferences: sl()),
//    );
//    sl.registerFactory<HomeLocalDataSource>(
//      () => HomeLocalDataSourceImpl(appPreferences: sl()),
//    );
//    sl.registerFactory<NotificationLocalDataSource>(
//      () => NotificationLocalDataSourceImpl(appPreferences: sl()),
//    );
//    sl.registerFactory<StaticContentLocalDataSource>(
//      () => StaticContentLocalDataSourceImpl(appPreferences: sl()),
//    );
//    sl.registerFactory<ConfigLocalDataSource>(
//      () => ConfigLocalDataSourceImpl(appPreferences: sl()),
//    );
//    sl.registerFactory<HelpReportLocalDataSource>(
//      () => HelpReportLocalDataSourceImpl(appPreferences: sl()),
//    );
//
//    /// Repositories - Impl
//    sl.registerFactory<UserRepository>(
//        () => UserRepositoryImpl(remoteDataSource: sl(), localDataSrc: sl()));
//    sl.registerFactory<BookingRepository>(() =>
//        BookingRepositoryImpl(remoteDataSource: sl(), localDataSrc: sl()));
//    sl.registerFactory<ServiceRepository>(() =>
//        ServiceRepositoryImpl(remoteDataSource: sl(), localDataSrc: sl()));
//    sl.registerFactory<TipRepository>(
//        () => TipRepositoryImpl(remoteDataSource: sl(), localDataSrc: sl()));
//    sl.registerFactory<HomeRepository>(
//        () => HomeRepositoryImpl(remoteDataSource: sl(), localDataSrc: sl()));
//    sl.registerFactory<PaymentRepository>(() =>
//        PaymentRepositoryImpl(remoteDataSource: sl(), localDataSrc: sl()));
//
//    sl.registerFactory<ConfigRepository>(
//        () => ConfigRepositoryImpl(remoteDataSource: sl(), localDataSrc: sl()));
//    sl.registerFactory<HelpAndReportRepository>(() =>
//        HelpAndReportRepositoryImpl(
//            remoteDataSource: sl(), localDataSrc: sl()));
//    sl.registerFactory<StaticContentRepository>(() =>
//        StaticContentRepositoryImpl(
//            remoteDataSource: sl(), localDataSrc: sl()));
//    sl.registerFactory<NotificationRepository>(() =>
//        NotificationRepositoryImpl(remoteDataSource: sl(), localDataSrc: sl()));
  }
}
