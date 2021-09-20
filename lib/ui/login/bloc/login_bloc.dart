import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:mecar_test/data/model/userAuth.dart';
import 'package:meta/meta.dart';
import 'package:package_info/package_info.dart';

import '../../../data/repository/user_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;


  LoginBloc({
    @required this.userRepository,

  }) : super(LoginState.initial());


  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
        List<UserAuth> listUser = userRepository.getListUser();
          yield _handleLogin(event.email, event.password, listUser);
    }
  }

  LoginState _handleLogin(String userName, String pass, List<UserAuth> list) {
    if (list.indexWhere((element) => element.pass == pass && element.userName == userName) != -1) {
      return LoginState(status: LoginStatus.success);
    } else {
      return LoginState(status: LoginStatus.fail);
    }
  }
}
