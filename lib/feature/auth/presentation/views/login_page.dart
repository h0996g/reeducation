import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/route_name.dart';
import '../../../../core/theme/app_colors.dart';
import '../manager/cubit/login_cubit/login_cubit.dart';
import '../manager/cubit/login_cubit/login_state.dart';
import 'widgets/auth_background.dart';
import 'widgets/auth_footer_link.dart';
import 'widgets/auth_header.dart';
import 'widgets/login/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBackground(
      child: BlocListener<LoginCubit, LoginState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status == LoginStatus.success) {
            context.go(RouteName.home);
          }
          if (state.status == LoginStatus.failed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Erreur de connexion'),
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
                title: 'Connexion',
                subtitle: 'Connectez-vous pour continuer',
              ),
              SizedBox(height: 40.h),
              const LoginForm(),
              SizedBox(height: 24.h),
              AuthFooterLink(
                message: 'Pas encore de compte ? ',
                linkLabel: "S'inscrire",
                onLinkTap: () => context.push(RouteName.register),
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
