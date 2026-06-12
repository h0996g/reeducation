import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_role.dart';
import '../../../../../../core/utils/validators.dart';
import '../../../../../../core/widgets/password_text_form_field_widget.dart';
import '../../../../../../core/widgets/primary_button.dart';
import '../../../../../../core/widgets/text_form_field_widget.dart';
import '../../../manager/cubit/login_cubit/login_cubit.dart';
import '../../../manager/cubit/login_cubit/login_state.dart';
import '../role_chip.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final cubit = context.read<LoginCubit>();
        return Form(
          key: cubit.formKey,
          child: Column(
            children: [
              TextFormFieldWidget(
                label: 'Email',
                hint: 'exemple@email.com',
                controller: cubit.emailController,
                keyboardType: TextInputType.emailAddress,
                validator: Validators.email,
                prefixIcon: const Icon(Icons.email_outlined),
              ),
              SizedBox(height: 20.h),
              PasswordTextFormFieldWidget(
                label: 'Mot de passe',
                hint: 'Entrez votre mot de passe',
                controller: cubit.passwordController,
                validator: (v) => Validators.password(v),
              ),
              SizedBox(height: 20.h),
              Text(
                'Vous êtes :',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => cubit.setRole(AppRole.medcin),
                      child: RoleChip(
                        label: 'Médecin',
                        icon: Icons.local_hospital_outlined,
                        isSelected: state.role == AppRole.medcin,
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => cubit.setRole(AppRole.user),
                      child: RoleChip(
                        label: 'Patient',
                        icon: Icons.person_outlined,
                        isSelected: state.role == AppRole.user,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              PrimaryButton(
                label: 'Se connecter',
                isLoading: state.status == LoginStatus.loading,
                onPressed: () => cubit.login(),
              ),
            ],
          ),
        );
      },
    );
  }
}
