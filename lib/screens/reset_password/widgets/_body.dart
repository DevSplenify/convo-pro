part of '../reset_password.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final state = _ScreenState.s(context, true);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom + 10.h,
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
              // Space.yf(16),
              // AppHeadings(
              //   title: 'Reset Password',
              //   subtitle: 'Enter new password and login to your account',
              //   isCentered: false,
              // ),
              // Space.yf(16),
              // AppTextField(
              //   name: _FormKeys.newPassword,
              //   hint: 'New Password',
              //   label: 'New Password',
              //   isPass: true,
              //   // validator: FormBuilderValidators.compose([
              //   //   FormBuilderValidators.required(),
              //   //   FormBuilderValidators.minLength(6),
              //   // ]),
              //   prefixIcon: Padding(
              //     padding: EdgeInsets.only(left: 16.w, right: 8.w),
              //     child: SvgPicture.asset(
              //       'assets/svgs/lock.svg',
              //       width: 20.w,
              //       height: 20.h,
              //     ),
              //   ),
              // ),
              // Space.yf(12),
              // AppTextField(
              //   name: _FormKeys.confirmPassword,
              //   hint: 'Confirm New Password',
              //   label: 'Confirm New Password',
              //   isPass: true,
              //   // validator: FormBuilderValidators.compose([
              //   //   FormBuilderValidators.required(),
              //   //   FormBuilderValidators.minLength(6),
              //   //   (val) {
              //   //     if (val !=
              //   //         state.formKey.currentState?.fields[
              //   //                 _FormKeys.newPassword]
              //   //             ?.value) {
              //   //       return 'Passwords do not match';
              //   //     }
              //   //     return null;
              //   //   },
              //   // ]),
              //   prefixIcon: Padding(
              //     padding: EdgeInsets.only(left: 16.w, right: 8.w),
              //     child: SvgPicture.asset(
              //       'assets/svgs/lock.svg',
              //       width: 20.w,
              //       height: 20.h,
              //     ),
              //   ),
              // ),
              // Space.ym!,
              // AppButton(
              //   label: 'Reset & Login',
              //   onPressed: () {
              //     if (state.formKey.currentState?.saveAndValidate() ?? false) {
              //       AppRoutes.signIn.pushReplace(context);
              //     } else {
              //       if (kDebugMode) {
              //         print("Validation failed");
              //       }
              //     }
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
