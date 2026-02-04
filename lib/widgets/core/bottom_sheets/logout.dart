import 'package:convo_pro/configs/configs.dart';
import 'package:convo_pro/widgets/core/headers/app_header.dart';
import 'package:convo_pro/widgets/design/buttons/app_button/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

void showLogoutBottomSheet(BuildContext context, VoidCallback onLogout) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(32.r)),
    ),
    backgroundColor: AppTheme.c.background.main!,
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).padding.bottom + 10.h,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.c.background.main!,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(32.r),
                  ),
                ),

                child: SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.manual,
                  padding: Space.hf(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Handle bar
                      Container(
                        margin: EdgeInsets.only(top: 12.h),
                        width: 40.w,
                        height: 5.h,
                        decoration: BoxDecoration(
                          color: Color(0xFFE0E0E2),
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                      ),
                      Space.yf(20),
                      Container(
                        width: 60.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                          color: AppTheme.c.accent.purple!,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.c.accent.purple!.withValues(
                                alpha: 0.25,
                              ),
                              blurRadius: 0,
                              spreadRadius: 3.6,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/svgs/logout.svg',
                            width: 24.w,
                            height: 24.h,
                          ),
                        ),
                      ),
                      Space.yf(24),
                      AppHeadings(
                        title: 'Are You Sure ?',
                        subtitle:
                            'Do you really want to logout of your account ?',
                        titleFontSize: 16,
                        spacingBetweenTitleAndSubtitle: 8,
                      ),

                      Space.yf(24),
                      AppButton(
                        label: 'Yes Logout',
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        textColor: AppTheme.c.text.shade800,

                        backgroundColor: AppTheme.c.accent.purple,
                      ),
                      Space.yf(12),
                      AppButton(
                        label: 'No, Cancel',
                        buttonType: ButtonType.outlined,
                        backgroundColor: AppTheme.c.white,
                        borderColor: AppTheme.c.accent.purple,
                        textColor: AppTheme.c.text.shade800,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    },
  );
}
