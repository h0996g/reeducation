import 'package:equatable/equatable.dart';

import '../../../../../../core/utils/app_role.dart';
import '../../../../data/models/user_model.dart';

enum LoginStatus { init, loading, success, failed }

class LoginState extends Equatable {
  final LoginStatus status;
  final String? errorMessage;
  final UserModel? user;
  final AppRole role;

  const LoginState({
    this.status = LoginStatus.init,
    this.errorMessage,
    this.user,
    this.role = AppRole.user,
  });

  LoginState copyWith({
    LoginStatus? status,
    String? errorMessage,
    UserModel? user,
    AppRole? role,
  }) {
    return LoginState(
      status: status ?? this.status,
      errorMessage: errorMessage,
      user: user ?? this.user,
      role: role ?? this.role,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, user, role];
}
