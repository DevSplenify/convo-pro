part of '../sign_in.dart';

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
                  title: 'Login Now',
                  subtitle: 'Enter Credentials To Login to Your Account',
                ),
                Space.yf(24),
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
                Space.yf(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        AppRoutes.forgotPassword.push(context);
                      },
                      child: Text(
                        'Forgot Password?',
                        style: AppText.b2!.copyWith(
                          height: 1.5,
                          decoration: TextDecoration.underline,
                          decorationColor: AppTheme.c.text.shade800!,
                        ),
                      ),
                    ),
                  ],
                ),
                Space.yf(12),
                AppButton(
                  label: 'Log In',
                  onPressed: () {
                    AppRoutes.bottomNavbar.pushReplace(context);
                  },
                ),
                Space.yf(12),
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
                Space.yf(12),
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
                      "Don’t Have An Account?",
                      style: AppText.inter.b2!.cl(AppTheme.c.text.main!),
                    ),
                    GestureDetector(
                      onTap: () {
                        AppRoutes.signUp.pushReplace(context);
                      },
                      child: Text(
                        ' Create Account',
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
