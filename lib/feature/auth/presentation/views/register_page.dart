import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/route_name.dart';
import '../../../../core/theme/app_colors.dart';
import '../manager/cubit/register_cubit/register_cubit.dart';
import '../manager/cubit/register_cubit/register_state.dart';
import 'widgets/auth_background.dart';
import 'widgets/auth_footer_link.dart';
import 'widgets/auth_header.dart';
import 'widgets/register/register_form.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBackground(
      child: BlocListener<RegisterCubit, RegisterState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status == RegisterStatus.success) {
            context.go(RouteName.home);
          }
          if (state.status == RegisterStatus.failed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? "Erreur d'inscription"),
                backgroundColor: AppColors.error,
              ),
            );
          }
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AuthHeader(
                title: 'Inscription',
                subtitle: 'Créez votre compte',
                topSpacing: 40,
              ),
              SizedBox(height: 32.h),
              const RegisterForm(),
              SizedBox(height: 24.h),
              AuthFooterLink(
                message: 'Déjà un compte ? ',
                linkLabel: 'Se connecter',
                onLinkTap: () => context.go(RouteName.login),
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
