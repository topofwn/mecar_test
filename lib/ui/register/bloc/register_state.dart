part of 'register_bloc.dart';

@immutable
class RegisterState extends Equatable {
  final RegisterStatus status;
  final bool isUserNameValid;
  final bool isPasswordValid;
  final bool isPasswordTheSame;
  final bool isUserNameExist;

  RegisterState({
    @required this.isUserNameExist,
    @required this.isUserNameValid,
    @required this.isPasswordValid,
    @required this.isPasswordTheSame,
    this.status,
  });

  factory RegisterState.initial() {
    return RegisterState(
      isUserNameExist: false,
      isPasswordTheSame: true,
      isPasswordValid: true,
      isUserNameValid: true,
      status: RegisterStatus.idle,
    );
  }

  RegisterState copyWith({
    bool isUserNameExist,
    bool isUsernameValid,
    bool isPasswordValid,
    bool isPasswordTheSame,
    RegisterStatus status
  }) {
    return RegisterState(
      isUserNameExist: isUserNameExist ?? this.isUserNameExist,
      isUserNameValid: isUsernameValid ?? this.isUserNameValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isPasswordTheSame: isPasswordTheSame ?? this.isPasswordTheSame,
      status: status ?? this.status
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [
    isUserNameExist,
    isUserNameValid,
    isPasswordValid,
    isPasswordTheSame,
    status,
  ];
}


enum RegisterStatus {
  idle,
  success,
  fail
}