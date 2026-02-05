part of '../subscription.dart';

class SubscriptionPlanCard extends StatelessWidget {
  final bool isSelected;
  final String title;
  final String subtitle;
  final String price;
  final VoidCallback onTap;

  const SubscriptionPlanCard({
    super.key,
    required this.isSelected,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: Space.all(16, 17),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.c.primary.shade200 : AppTheme.c.white,
          borderRadius: UIProps.radiusM,
          border: Border.all(
            color: isSelected
                ? AppTheme.c.primary.main!
                : AppTheme.c.lightGrey.main!,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              isSelected
                  ? 'assets/svgs/check round.svg'
                  : 'assets/svgs/check round_US.svg',
              width: 18.w,
              height: 18.h,
            ),
            Space.xf(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppText.b1bm),
                  Space.yf(5),
                  Text(
                    subtitle,
                    style: AppText.inter.b2!.copyWith(
                      color: AppTheme.c.text.main!,
                    ),
                  ),
                  Space.yf(6),
                  Text(price, style: AppText.inter.b2!.w(6)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
