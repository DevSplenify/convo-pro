part of '../confirm_payment_method.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    _ScreenState.s(context, true);
    return Scaffold(
      appBar: const CustomAppBar(
        type: AppBarType.withText,
        title: 'Confirm Payment Method',
      ),
      body: SingleChildScrollView(
        padding: Space.hf(24).copyWith(
          bottom: MediaQuery.of(context).padding.bottom + 24.h,
          top: 16.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Subscription Plan', style: AppText.b1bm),
            Space.yf(16),
            SubscriptionPlanCard(
              isSelected: true,
              title: 'Yearly Plan',
              subtitle: 'Include sharing friends & family',
              price: '\$99.99',
              onTap: () {},
            ),
            Space.yf(16),
            Text('Payment Method', style: AppText.b1bm),
            Space.yf(16),
            PaymentMethodList(
              titles: const ['********8468'],
              images: const ['assets/pngs/citadele.png'],

              // Read the current selection from state
              selectedMethod: '********8468',
              onChanged: (method) {},
            ),
            Space.yf(12),
            AppButton(
              label: 'Pay now',
              onPressed: () {
                AppRoutes.paymentSuccess.push(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
