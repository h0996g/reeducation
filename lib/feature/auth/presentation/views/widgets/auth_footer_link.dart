import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';

class AuthFooterLink extends StatelessWidget {
  final String message;
  final String linkLabel;
  final VoidCallback onLinkTap;

  const AuthFooterLink({
    super.key,
    required this.message,
    required this.linkLabel,
    required this.onLinkTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          message,
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.textSecondary,
          ),
        ),
        GestureDetector(
          onTap: onLinkTap,
          child: Text(
            linkLabel,
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
