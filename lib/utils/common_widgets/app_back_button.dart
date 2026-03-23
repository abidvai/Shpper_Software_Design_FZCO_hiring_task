import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../color.dart';

class AppBackButton extends StatelessWidget {
  final VoidCallback? onTap;

  const AppBackButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap ?? Navigator.pop(context),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.surface.withValues(alpha: 0.1),
          border: Border.all(color: AppColors.white, width: 1.2.w),
        ),
        child: Padding(
          padding: EdgeInsets.all(4.h),
          child: Icon(Icons.arrow_back_ios_new, size: 16.h, color: AppColors.white,),
        ),
      ),
    );
  }
}