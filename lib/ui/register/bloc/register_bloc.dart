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

  }) : super(null);

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is RegisterButtonPress) {
      List<UserAuth> listUser = userRepository.getListUser();
      yield _handleRegister(event.userName, event.password, event.rePassword, listUser);
    }
  }

  RegisterState _handleRegister(String userName, String pass, String rePass, List<UserAuth> list) {
    if ()
  }
}
