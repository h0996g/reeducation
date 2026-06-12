import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/app_role.dart';
import '../../../../data/repositories/auth_repository.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository _authRepository;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  RegisterCubit(this._authRepository) : super(const RegisterState());

  void setRole(AppRole role) => emit(state.copyWith(role: role));

  void register() async {
    if (!formKey.currentState!.validate()) return;

    emit(state.copyWith(status: RegisterStatus.loading));

    try {
      final user = await _authRepository.register(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text,
        role: state.role,
      );
      emit(state.copyWith(status: RegisterStatus.success, user: user));
    } catch (e) {
      emit(
        state.copyWith(
          status: RegisterStatus.failed,
          errorMessage: 'Une erreur est survenue. Veuillez réessayer.',
        ),
      );
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}
