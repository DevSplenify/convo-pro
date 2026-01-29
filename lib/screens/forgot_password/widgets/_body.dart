part of '../forgot_password.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final state = _ScreenState.s(context, true);

    return Scaffold(
      // appBar: CustomAppBar(),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom,
          left: 24.w,
          right: 24.w,
          top: 16.h,
        ),
        child: FormBuilder(
          key: state.formKey,
          initialValue: _FormData.initialValues(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                'assets/svgs/key.svg',
                width: 54.5.w,
                height: 54.5.h,
              ),
              Space.yf(16),
              // AppHeadings(
              //   title: 'Forget Password? Don’t Worry',
              //   subtitle:
              //       'Please enter your email address to get the reset password link.',
              //   isCentered: false,
              // ),
              // Space.yf(24),
              // AppTextField(
              //   name: _FormKeys.email,
              //   hint: 'Email',
              //   textInputType: TextInputType.emailAddress,
              //   // validator: FormBuilderValidators.compose([
              //   //   FormBuilderValidators.required(),
              //   //   FormBuilderValidators.email(),
              //   // ]),
              //   prefixIcon: Padding(
              //     padding: EdgeInsets.only(left: 16.w, right: 8.w),
              //     child: SvgPicture.asset(
              //       'assets/svgs/sms.svg',
              //       width: 20.w,
              //       height: 20.h,
              //       colorFilter: ColorFilter.mode(
              //         AppTheme.c.text.shade800!,
              //         BlendMode.srcIn,
              //       ),
              //     ),
              //   ),
              // ),
              // Space.ym!,
              // AppButton(
              //   label: 'Send Link',
              //   onPressed: () {
              //     if (state.formKey.currentState?.saveAndValidate() ?? false) {
              //       AppRoutes.linkSent.push(context);
              //     } else {
              //       if (kDebugMode) {
              //         print("Validation failed");
              //       }
              //     }
              //   },
              // ),
              // Space.yf(10),
            ],
          ),
        ),
      ),
    );
  }
}
