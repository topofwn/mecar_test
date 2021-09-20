part of 'login_bloc.dart';

@immutable
 class LoginState extends Equatable{
  final LoginStatus status;

  LoginState({
    this.status
  });

  factory LoginState.initial() {
    return LoginState(
      status: LoginStatus.idle
    );
  }

  @override
  List<Object> get props => [
      status
  ];

}

enum LoginStatus {
  idle,
  success,
  fail,
}

