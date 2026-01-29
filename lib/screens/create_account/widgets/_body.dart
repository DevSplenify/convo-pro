part of '../create_account.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final state = _ScreenState.s(context, true);
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 16.h,
          bottom: MediaQuery.of(context).padding.bottom,
          left: 24.w,
          right: 24.w,
        ),
        child: FormBuilder(
          key: state.formKey,
          initialValue: _FormData.initialValues(),
          child: SizedBox(
            height:
                MediaQuery.of(context).size.height -
                (MediaQuery.of(context).padding.top +
                    MediaQuery.of(context).padding.bottom +
                    32.h),
            child: Column(
              children: [
                SvgPicture.asset(AppStaticData.logo, height: 72.h, width: 55.w),
                Space.yf(24),
                AppHeadings(
                  title: 'Create New Account',
                  subtitle: 'Please fill out the form to create a new account',
                ),
                Space.yf(24),
                AppTextField(
                  name: _FormKeys.userName,
                  type: TextFieldType.withIcon,
                  hint: 'Enter your Name',
                  textInputAction: TextInputAction.next,
                  // validator: FormBuilderValidators.compose([
                  //   FormBuilderValidators.required(errorText: 'Email is required'),
                  //   FormBuilderValidators.email(errorText: 'Enter a valid email'),
                  // ]),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 16.w, right: 8.w),
                    child: SvgPicture.asset(
                      'assets/svgs/user.svg',
                      width: 24.w,
                      height: 24.h,
                    ),
                  ),
                ),
                Space.yf(12),
                AppTextField(
                  name: _FormKeys.email,
                  textInputType: TextInputType.emailAddress,
                  type: TextFieldType.withIcon,
                  hint: 'Enter your Email',
                  textInputAction: TextInputAction.next,
                  // validator: FormBuilderValidators.compose([
                  //   FormBuilderValidators.required(errorText: 'Email is required'),
                  //   FormBuilderValidators.email(errorText: 'Enter a valid email'),
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
                Space.yf(12),
                AppTextField(
                  name: _FormKeys.password,
                  isPass: true,
                  type: TextFieldType.withIcon,
                  hint: 'Enter your Password',
                  textInputAction: TextInputAction.done,
                  // validator: FormBuilderValidators.compose([
                  //   FormBuilderValidators.required(
                  //     errorText: 'Password is required',
                  //   ),
                  //   FormBuilderValidators.minLength(
                  //     6,
                  //     errorText: 'Minimum length is 6 characters',
                  //   ),
                  // ]),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 16.w, right: 8.w),
                    child: SvgPicture.asset(
                      'assets/svgs/lock.svg',
                      width: 24.w,
                      height: 24.h,
                    ),
                  ),
                ),
                Space.yf(16),
                // SizedBox(height: 42.h),
                AppCheckbox(
                  name: _FormKeys.termsAccepted,
                  label: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: 'I’ve read and agreed to '),
                        TextSpan(
                          text: 'Terms & Conditions\n ',
                          style: AppText.inter.b2!.copyWith(
                            color: AppTheme.c.text.shade800!,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(text: 'and '),
                        TextSpan(
                          text: 'Privacy Policy ',
                          style: AppText.inter.b2!.copyWith(
                            color: AppTheme.c.text.shade800!,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),

                    style: AppText.inter.b2!.cl(AppTheme.c.text.main!),
                  ),
                ),
                Space.yf(16),
                AppButton(
                  label: 'Sign Up',
                  onPressed: () {
                    AppRoutes.termsConditions.push(context);
                  },
                ),
                Space.yf(16),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1.h,
                        color: AppTheme.c.lightGrey.main!,
                      ),
                    ),
                    Space.xf(12),
                    Text(
                      'Or continue with',
                      style: AppText.inter.b2!
                          .cl(AppTheme.c.text.main!)
                          .copyWith(height: 1.5),
                    ),
                    Space.xf(12),
                    Expanded(
                      child: Container(
                        height: 1.h,
                        color: AppTheme.c.lightGrey.main!,
                      ),
                    ),
                  ],
                ),
                Space.yf(16),
                Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        label: 'Apple',
                        onPressed: () {},
                        buttonType: ButtonType.outlinedWithIconLeft,
                        iconPath: 'assets/svgs/apple.svg',
                        borderColor: AppTheme.c.lightGrey.main!,
                        backgroundColor: AppTheme.c.white,
                        textColor: AppTheme.c.text.shade800!,
                      ),
                    ),
                    Space.xf(10),
                    Expanded(
                      child: AppButton(
                        label: 'Google',
                        onPressed: () {},
                        buttonType: ButtonType.outlinedWithIconLeft,
                        iconPath: 'assets/svgs/google.svg',
                        borderColor: AppTheme.c.lightGrey.main!,
                        backgroundColor: AppTheme.c.white,
                        textColor: AppTheme.c.text.shade800!,
                      ),
                    ),
                  ],
                ),
                Space.ym!,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: AppText.inter.b2!.cl(AppTheme.c.text.main!),
                    ),
                    GestureDetector(
                      onTap: () {
                        AppRoutes.signIn.pushReplace(context);
                      },
                      child: Text(
                        ' Sign in',
                        style: AppText.inter.b2b!.cl(AppTheme.c.text.shade800!),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
