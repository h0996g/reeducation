import 'package:equatable/equatable.dart';

import '../../../../../../core/utils/app_role.dart';
import '../../../../data/models/user_model.dart';

enum RegisterStatus { init, loading, success, failed }

class RegisterState extends Equatable {
  final RegisterStatus status;
  final String? errorMessage;
  final UserModel? user;
  final AppRole role;

  const RegisterState({
    this.status = RegisterStatus.init,
    this.errorMessage,
    this.user,
    this.role = AppRole.user,
  });

  RegisterState copyWith({
    RegisterStatus? status,
    String? errorMessage,
    UserModel? user,
    AppRole? role,
  }) {
    return RegisterState(
      status: status ?? this.status,
      errorMessage: errorMessage,
      user: user ?? this.user,
      role: role ?? this.role,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, user, role];
}
