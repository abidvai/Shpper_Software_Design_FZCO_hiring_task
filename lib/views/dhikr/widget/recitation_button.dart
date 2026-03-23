import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/color.dart';

class RecitationButton extends StatelessWidget {
  const RecitationButton({
    super.key,
    required this.count,
    required this.onTap,
  });

  final int count;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 250.w,
        height: 250.h,
        decoration: BoxDecoration(
          color: AppColors.surface,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.12),
              offset: Offset(0, 0),
              blurRadius: 30,
              spreadRadius: 5,
            ),
          ],
          border: Border.all(width: 1.2, color: AppColors.primary),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'سُبْحَانَ ٱللَّٰه',
              style: TextStyle(
                fontFamily: GoogleFonts.amiri().fontFamily,
                fontSize: 36.sp,
                color: AppColors.primary,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'SUBHANALLAH',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.white,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              'GLORY BE TO ALLAH',
              style: TextStyle(
                fontSize: 11.sp,
                color: Colors.white54,
                letterSpacing: 1.5,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              count.toString(),
              style: TextStyle(
                fontSize: 22.sp,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}