import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/app_role.dart';
import '../../../../data/repositories/auth_repository.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  LoginCubit(this._authRepository) : super(const LoginState());

  void setRole(AppRole role) => emit(state.copyWith(role: role));

  void login() async {
    if (!formKey.currentState!.validate()) return;

    emit(state.copyWith(status: LoginStatus.loading));

    try {
      final user = await _authRepository.login(
        email: emailController.text.trim(),
        password: passwordController.text,
      );
      emit(state.copyWith(status: LoginStatus.success, user: user));
    } catch (e) {
      emit(
        state.copyWith(
          status: LoginStatus.failed,
          errorMessage: 'Une erreur est survenue. Veuillez réessayer.',
        ),
      );
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
