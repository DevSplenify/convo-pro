part of '../joined_live_session.dart';

void showShareToBottomSheet(BuildContext context) {
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Handle bar
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 12.h),
                          width: 38.w,
                          height: 5.h,
                          decoration: BoxDecoration(
                            color: Color(0xFFE0E0E0),
                            borderRadius: BorderRadius.circular(2.r),
                          ),
                        ),
                      ),
                      Space.yf(20),
                      BottomsheetHeader(title: "Share To"),
                      Space.yf(24),
                      _buildShareOption('Copy Link', 'assets/svgs/copy.svg'),
                      _buildShareOption('WhatsApp', 'assets/svgs/WhatsApp.svg'),
                      _buildShareOption('Facebook', 'assets/svgs/Facebook.svg'),
                      _buildShareOption('LinkedIn', 'assets/svgs/LinkedIn.svg'),
                      _buildShareOption('Youtube', 'assets/svgs/youtube.svg'),

                      // The meal list widget
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

Widget _buildShareOption(String platform, String iconPath) {
  return Container(
    padding: Space.all(16),
    margin: EdgeInsets.only(bottom: 10.h),
    decoration: BoxDecoration(
      color: AppTheme.c.white,
      borderRadius: UIProps.buttonRadius,
      border: Border.all(color: AppTheme.c.lightGrey.main!, width: 1.w),
    ),
    child: Row(
      children: [
        SvgPicture.asset(iconPath, width: 24.w, height: 24.h),
        Space.xf(10),
        Text(platform, style: AppText.inter.b2!.cl(AppTheme.c.text.main!)),
      ],
    ),
  );
}
