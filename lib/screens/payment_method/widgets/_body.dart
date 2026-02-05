part of '../payment_method.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final screenState = _ScreenState.s(context, true);
    return Scaffold(
      appBar: const CustomAppBar(
        type: AppBarType.withText,
        title: 'Payment Method',
      ),
      body: SingleChildScrollView(
        padding: Space.hf(24).copyWith(
          bottom: MediaQuery.of(context).padding.bottom + 24.h,
          top: 16.h,
        ),
        child: Column(
          children: [
            PaymentMethodList(
              titles: const ['********8468', '********1234'],
              images: const [
                'assets/pngs/citadele.png',
                'assets/pngs/visa.png',
              ],

              // Read the current selection from state
              selectedMethod: screenState.selectedMethod,
              onChanged: (method) {
                // Update the state when a user taps a different method
                screenState.setPaymentMethod(method);
              },
            ),
            Space.yf(12),
            AppButton(
              label: 'Continue',
              onPressed: () {
                AppRoutes.confirmPaymentMethod.push(context);
              },
            ),
            Space.yf(12),
            AppButton(
              label: 'Add another method',
              onPressed: () {
                AppRoutes.addPaymentMethod.push(context);
              },
              buttonType: ButtonType.outlinedWithIconLeft,
              iconPath: AppStaticData.plus,
              iconSize: 20,
            ),
          ],
        ),
      ),
    );
  }
}
