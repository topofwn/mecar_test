

import 'package:equatable/equatable.dart';
import 'package:mecar_test/utils/logUtil.dart';

class UserAuth extends Equatable {
  final String userName;
  final String pass;

 UserAuth({
    this.userName,
    this.pass,
  });

 UserAuth copyWith({
  username,
  pass,
  }) {
   return UserAuth(
     userName: username ?? this.userName,
     pass: pass ?? this.pass,
   );
 }

  factory UserAuth.fromJson(Map<String, dynamic> json) {
    try {
      final userInfo = UserAuth(
        userName: json['userName'],
        pass: json['pass'] ,
      );
      return userInfo;
    } catch (e, stacktrace) {
      LogUtils.d(e, stacktrace: stacktrace.toString());
    }
    return null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    try {
      data['userName'] = this.userName;
      data['pass'] = this.pass;
    } catch (e, stacktrace) {
      LogUtils.d(e, stacktrace: stacktrace.toString());
    }

    return data;
  }

  @override
  // TODO: implement props
  List<Object> get props => [
      userName,
      pass,
  ];
}