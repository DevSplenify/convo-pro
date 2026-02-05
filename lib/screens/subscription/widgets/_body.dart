part of '../subscription.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final state = _ScreenState.s(context, true);

    return Scaffold(
      appBar: const CustomAppBar(
        type: AppBarType.withText,
        title: 'Subscription Plan',
      ),
      body: Padding(
        padding: Space.hf(
          24,
        ).copyWith(bottom: MediaQuery.of(context).padding.bottom + 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Space.yf(16),
            Text(
              'Choose the Plan that is\nRight for you',
              style: AppText.h3b,
              textAlign: TextAlign.center,
            ),
            Space.yf(15),
            Text(
              'Downgrade or upgrade at any time',
              style: AppText.inter.b2!.copyWith(color: AppTheme.c.text.main),
            ),
            Space.yf(25),

            ...subscriptionPlans.map((plan) {
              return Padding(
                padding: EdgeInsets.only(bottom: 15.h),
                child: SubscriptionPlanCard(
                  isSelected: state.selectedPlan == plan['id'],
                  title: plan['title'],
                  subtitle: plan['subtitle'],
                  price: plan['price'],
                  onTap: () => state.selectPlan(plan['id']),
                ),
              );
            }),

            Space.yf(9),

            AppButton(
              label: 'Continue',
              onPressed: () {
                // Handle continue action, e.g., navigate to payment screen
                AppRoutes.paymentMethod.push(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
