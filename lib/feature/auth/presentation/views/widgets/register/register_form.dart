import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/validators.dart';
import '../../../../../../core/widgets/password_text_form_field_widget.dart';
import '../../../../../../core/widgets/primary_button.dart';
import '../../../../../../core/widgets/text_form_field_widget.dart';
import '../../../manager/cubit/register_cubit/register_cubit.dart';
import '../../../manager/cubit/register_cubit/register_state.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        final cubit = context.read<RegisterCubit>();
        return Form(
          key: cubit.formKey,
          child: Column(
            children: [
              TextFormFieldWidget(
                label: 'Nom complet',
                hint: 'Entrez votre nom',
                controller: cubit.nameController,
                validator: (v) => Validators.required(v, 'Le nom'),
                prefixIcon: const Icon(Icons.person_outline),
              ),
              SizedBox(height: 16.h),
              TextFormFieldWidget(
                label: 'Email',
                hint: 'exemple@email.com',
                controller: cubit.emailController,
                keyboardType: TextInputType.emailAddress,
                validator: Validators.email,
                prefixIcon: const Icon(Icons.email_outlined),
              ),
              SizedBox(height: 16.h),
              PasswordTextFormFieldWidget(
                label: 'Mot de passe',
                hint: 'Entrez votre mot de passe',
                controller: cubit.passwordController,
                validator: (v) => Validators.password(v),
              ),
              SizedBox(height: 16.h),
              PasswordTextFormFieldWidget(
                label: 'Confirmer le mot de passe',
                hint: 'Confirmez votre mot de passe',
                controller: cubit.confirmPasswordController,
                validator: (v) => Validators.confirmPassword(
                  v,
                  cubit.passwordController.text,
                ),
              ),
              SizedBox(height: 20.h),
              PrimaryButton(
                label: "S'inscrire",
                isLoading: state.status == RegisterStatus.loading,
                onPressed: () => cubit.register(),
              ),
            ],
          ),
        );
      },
    );
  }
}
