import 'package:dhikr_hiring_task/providers/session_goal_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../providers/dhikr_provider.dart';
import '../../../utils/color.dart';

class SessionGoalSection extends ConsumerWidget {
  const SessionGoalSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dhikrProvider);
    final sessionGoalProgress = ref.watch(sessionGoalProvider);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'SESSION GOAL',
              style: TextStyle(
                fontSize: 10.sp,
                color: Colors.white38,
                letterSpacing: 2,
              ),
            ),
            Text(
              '72% COMPLETE',
              style: TextStyle(
                fontSize: 10.sp,
                color: AppColors.primary,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(height: 6.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${state.completedGoal} / ${state.goal}',
              style: TextStyle(
                fontSize: 13.sp,
                color: Colors.white70,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: LinearProgressIndicator(
            value: sessionGoalProgress,
            minHeight: 6.h,
            backgroundColor: Colors.white12,
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
          ),
        ),
      ],
    );
  }
}
