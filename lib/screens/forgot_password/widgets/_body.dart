part of '../forgot_password.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final state = _ScreenState.s(context, true);

    return Scaffold(
      appBar: CustomAppBar(),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom,
          left: 24.w,
          right: 24.w,
        ),
        child: FormBuilder(
          key: state.formKey,
          initialValue: _FormData.initialValues(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                'assets/svgs/key.svg',
                width: 56.72.w,
                height: 56.72.h,
              ),
              Space.yf(16),
              AppHeadings(
                title: 'Forgot Password',
                subtitle:
                    'Please enter your email address to get the reset password link.',
                isCentered: false,
                spacingBetweenTitleAndSubtitle: 8,
              ),
              Space.yf(24),
              AppTextField(
                name: _FormKeys.email,
                hint: 'Email',
                textInputType: TextInputType.emailAddress,
                // validator: FormBuilderValidators.compose([
                //   FormBuilderValidators.required(),
                //   FormBuilderValidators.email(),
                // ]),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 16.w, right: 8.w),
                  child: SvgPicture.asset(
                    'assets/svgs/mail.svg',
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
              ),
              Space.ym!,
              AppButton(
                label: 'Send Resent Link',
                onPressed: () {
                  if (state.formKey.currentState?.saveAndValidate() ?? false) {
                    AppRoutes.linkSent.push(context);
                  } else {
                    if (kDebugMode) {
                      print("Validation failed");
                    }
                  }
                },
              ),
              Space.yf(16),
            ],
          ),
        ),
      ),
    );
  }
}
