part of '../add_payment_method.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final screenState = _ScreenState.s(context, true);
    return Scaffold(
      appBar: const CustomAppBar(
        type: AppBarType.withText,
        title: 'Add Payment Method',
      ),
      body: SingleChildScrollView(
        padding: Space.hf(24).copyWith(
          bottom: MediaQuery.of(context).padding.bottom + 24.h,
          top: 16.h,
        ),
        child: FormBuilder(
          key: screenState.formKey,
          initialValue: _FormData.initialValues(),

          child: Column(
            children: [
              AppTextField(
                name: _FormKeys.nameOnCard,
                type: TextFieldType.withLableOnly,
                hint: 'Enter name on card',
                label: 'Name on Card',
              ),
              Space.yf(16),
              AppTextField(
                name: _FormKeys.cardNumber,
                type: TextFieldType.withLableOnly,
                hint: '0000 0000 0000 0000',
                label: 'Card Number',
              ),
              Space.yf(16),
              Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      name: _FormKeys.expiryDate,
                      type: TextFieldType.withLableOnly,
                      hint: 'MM/YY',
                      label: 'Expiry Date',
                    ),
                  ),
                  Space.xf(12),
                  Expanded(
                    child: AppTextField(
                      name: _FormKeys.cvc,
                      type: TextFieldType.withLableOnly,
                      hint: '123',
                      label: 'CVC',
                    ),
                  ),
                ],
              ),
              Space.yf(16),
              AppTextField(
                name: _FormKeys.postalCode,
                type: TextFieldType.withLableOnly,
                hint: '12345',
                label: 'Postal Code',
              ),
              Space.yf(24),
              AppButton(
                label: 'Save',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
