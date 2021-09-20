import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:mecar_test/data/model/userAuth.dart';
import 'package:meta/meta.dart';

import '../../../data/repository/user_repository.dart';
import '../../../utils/utils.dart';

part 'base_event.dart';
part 'base_state.dart';

class BaseBloc extends Bloc<BaseEvent, BaseBlocState> {
  final UserRepository userRepository;
  BaseBloc({this.userRepository})
      : super(BaseInitial(userAuth: userRepository.getListUser()));

  @override
  Stream<BaseBlocState> mapEventToState(
      BaseEvent event,
      ) async* {
    if (!(state is LogoutState) && event is Logout) {
      yield LogoutState();
    }   else if (event is Init) {
      yield BaseInitial(
          userAuth: state?.userAuth ?? userRepository.getListUser());
    }
  }
}
