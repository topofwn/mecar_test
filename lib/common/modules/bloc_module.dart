
import 'package:mecar_test/ui/base/bloc/base_bloc.dart';
import 'package:mecar_test/ui/home/bloc/home_bloc.dart';
import 'package:mecar_test/ui/login/bloc/login_bloc.dart';
import 'package:mecar_test/ui/register/bloc/register_bloc.dart';
import 'package:mecar_test/ui/splash/bloc/splash_bloc.dart';

import '../injection/injector.dart';

class BlocModule extends DIModule {
  @override
  Future<void> provides() async {
    sl.registerLazySingleton(() => BaseBloc(userRepository: sl()));
    sl.registerFactory(() => SplashBloc(userRepository: sl()));
    sl.registerFactory(() => LoginBloc(userRepository: sl()));
    sl.registerFactory(() => RegisterBloc(userRepository: sl()));
    sl.registerFactory(() => HomeBloc());
  }
}
