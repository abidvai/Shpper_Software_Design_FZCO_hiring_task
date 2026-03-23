import 'package:dhikr_hiring_task/utils/color.dart';
import 'package:dhikr_hiring_task/views/dhikr/widget/change_voice_button.dart';
import 'package:dhikr_hiring_task/views/dhikr/widget/global_live_count_section.dart';
import 'package:dhikr_hiring_task/views/dhikr/widget/recitation_button.dart';
import 'package:dhikr_hiring_task/views/dhikr/widget/session_goal_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../providers/dhikr_provider.dart';
import '../../providers/global_count_provider.dart';
import '../../utils/format_count.dart';

class DhikrScreen extends ConsumerWidget {
  const DhikrScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        title: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dhikr',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
              Text(
                'Joined',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary.withValues(alpha: 0.8),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30.h),

            /// ---------------------- Global Live Card ------------------------------- ///
            Center(child: GlobalLiveCountCard()),
            SizedBox(height: 20.h),

            /// ------------------- Global Dhikr Count ------------------------------ ///
            Consumer(
              builder: (context, ref, child) {
                final globalCount = ref.watch(globalCountProvider);

                return globalCount.when(
                  data: (count) => Text(
                    formatCount(count),
                    style: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                    ),
                  ),
                  loading: () =>
                      CircularProgressIndicator(color: AppColors.primary),
                  error: (_, _) => Text(
                    '0',
                    style: TextStyle(fontSize: 32.sp, color: AppColors.white),
                  ),
                );
              },
            ),
            SizedBox(height: 10.h),
            Text(
              'TOTAL RECITATIONS TODAY',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                fontFamily: GoogleFonts.amiri().fontFamily,
                color: AppColors.primary.withValues(alpha: 0.7),
              ),
            ),
            SizedBox(height: 30.h),

            /// ------------------------------ Recitation Button ------------------------ ///
            Consumer(
              builder: (context, ref, child) {
                final state = ref.watch(dhikrProvider);
                return RecitationButton(
                  count: state.count,
                  onTap: () => ref.read(dhikrProvider.notifier).increment(),
                );
              },
            ),
            SizedBox(height: 20.h),
            Text(
              'TAP TO RECITE',
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.white38,
                letterSpacing: 3,
              ),
            ),
            SizedBox(height: 20.h),

            /// --------------------------------- Change voice toggle button --------------------------- ///
            Consumer(
              builder: (context, ref, child) {
                final state = ref.watch(dhikrProvider);
                return changeVoiceButton(
                  onTap: () {
                    ref.read(dhikrProvider.notifier).toggleVoiceMode();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: AppColors.white,
                        content: Text(
                          'Voice mode changed to ${state.isVoiceMode ? 'ON' : 'OFF'}',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                );
              },
            ),
            SizedBox(height: 32.h),

            /// ------------------------ session goal section ---------------------------------- ///
            SessionGoalSection(),
          ],
        ),
      ),
    );
  }
}
