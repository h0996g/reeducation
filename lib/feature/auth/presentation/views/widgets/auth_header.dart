import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_colors.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final double topSpacing;

  const AuthHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.topSpacing = 60,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: topSpacing.h),
        Center(
          child: Icon(
            Icons.healing,
            size: 48.sp,
            color: AppColors.primary,
          ),
        ),
        SizedBox(height: 24.h),
        Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Center(
          child: Text(
            subtitle,
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}
