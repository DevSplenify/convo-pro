part of '../terms_conditions.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: Space.hf(
              24,
            ).copyWith(bottom: 20.h, top: MediaQuery.of(context).padding.top),
            decoration: BoxDecoration(
              color: AppTheme.c.primary.main,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16.r),
                bottomRight: Radius.circular(16.r),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Space.yf(12),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    AppStaticData.backArrow,
                    width: 24.w,
                    height: 24.h,
                    colorFilter: ColorFilter.mode(
                      AppTheme.c.white!,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                Space.yf(57),
                Text(
                  'Hello\nBefore you create an account, please read and accept our Terms and Conditions ',
                  style: AppText.b1!.cl(AppTheme.c.white!),
                ),
              ],
            ),
          ),
          Space.yf(24),
          Padding(
            padding: Space.hf(24),
            child: Column(
              children: [
                AppHeadings(
                  title: 'Terms & Conditions',
                  subtitle:
                      'Welcome to our community. By joining and using this platform, you agree to follow the terms outlined below. These rules help keep the community safe, respectful, and valuable for everyone.',
                  isCentered: false,
                  spacingBetweenTitleAndSubtitle: 8,
                  titleFontSize: 16.sp,
                ),
                Space.yf(16),
                _buildTermsItem(
                  '  1. Community Conduct',
                  'You agree to interact respectfully with all members. Harassment, hate speech, bullying, or abusive behavior of any kind is not allowed.',
                ),
                _buildTermsItem(
                  '  2. Appropriate Use',
                  'You are responsible for the content you share. Make sure it is accurate, respectful, and does not violate anyone’s rights or privacy.',
                ),
                _buildTermsItem(
                  '  3. Privacy & Safety',
                  'Do not share personal, sensitive, or confidential information—yours or others’. Respect the privacy of all community members.',
                ),
                Space.yf(24),
                Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        label: 'Decline',
                        buttonType: ButtonType.outlined,
                        onPressed: () {
                          // Navigator.pop(context);
                        },
                      ),
                    ),
                    Space.xf(12),
                    Expanded(
                      child: AppButton(
                        label: 'Accept',
                        onPressed: () {
                          AppRoutes.bottomNavbar.pushReplace(context);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTermsItem(String title, String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppText.b1b!),
          Space.yf(8),
          Text(text, style: AppText.inter.b2!.cl(AppTheme.c.text.main!)),
        ],
      ),
    );
  }
}
