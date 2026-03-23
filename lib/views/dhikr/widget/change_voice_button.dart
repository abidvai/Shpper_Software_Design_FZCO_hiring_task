
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/color.dart';

Widget changeVoiceButton({required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(width: 1, color: AppColors.primary),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.swap_horiz, color: AppColors.primary, size: 16.sp),
          SizedBox(width: 8.w),
          Text(
            'CHANGE TO VOICE',
            style: TextStyle(
              fontSize: 11.sp,
              color: AppColors.primary,
              letterSpacing: 2,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ),
  );
}
