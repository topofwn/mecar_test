import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:mecar_test/data/model/userAuth.dart';
import 'package:mecar_test/data/repository/user_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository userRepository;


  RegisterBloc({
    @required this.userRepository,

  }) : super(RegisterState.initial());

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is RegisterButtonPress) {
      List<UserAuth> listUser = userRepository.getListUser();
      if (listUser == null) {
        listUser = new List();
      }
      yield _handleRegister(event.userName, event.password, event.rePassword, listUser);
    }
  }

  RegisterState _handleRegister(String userName, String pass, String rePass, List<UserAuth> list) {
    if (list.indexWhere((element) => element.userName == userName) != -1) {
      return state.copyWith(isUserNameExist: true, status: RegisterStatus.fail);
    } else if (userName == "" || userName == null) {
      return state.copyWith(isUsernameValid: false, status: RegisterStatus.fail);
    } else if (pass == "" || pass == null || rePass == "" || rePass == null) {
      return state.copyWith(
        isPasswordValid: false,
        status: RegisterStatus.fail
      );
    } else if (pass != rePass) {
      return state.copyWith(isPasswordTheSame: false, status: RegisterStatus.fail);
    } else {
      list.add(new UserAuth(userName: userName, pass: pass));
      userRepository.saveListUser(list);
      return state.copyWith(status: RegisterStatus.success);
    }
  }
}
