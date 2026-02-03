part of '../edit_profile.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final screenState = _ScreenState.s(context, true);
    return Scaffold(
      appBar: const CustomAppBar(
        type: AppBarType.withText,
        title: 'Edit Profile',
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.r,
                backgroundImage: AssetImage('assets/pngs/pp.png'),
              ),
              Space.yf(16),
              Text(
                'Change Image',
                style: AppText.inter.b2!.copyWith(
                  color: AppTheme.c.text.shade700,
                  decoration: TextDecoration.underline,
                  decorationColor: AppTheme.c.text.shade700,
                ),
              ),
              Space.yf(25),
              Row(children: [Text('General Info', style: AppText.b1b!.w(6))]),
              Space.yf(15),
              AppTextField(
                name: _FormKeys.userName,
                type: TextFieldType.withIcon,
                hint: 'User Name',
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
              Space.yf(10),
              AppTextField(
                name: _FormKeys.email,
                textInputType: TextInputType.emailAddress,
                type: TextFieldType.withIcon,
                hint: 'Email Address',
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
              Space.yf(10),
              AppTextField(
                name: _FormKeys.phoneNumber,
                textInputType: TextInputType.phone,
                type: TextFieldType.withIcon,
                hint: 'Phone Number',
                textInputAction: TextInputAction.next,

                // validator: FormBuilderValidators.compose([
                //   FormBuilderValidators.required(errorText: 'Phone number is required'),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 16.w, right: 8.w),
                  child: SvgPicture.asset(
                    'assets/svgs/phone.svg',
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
              ),
              Space.yf(25),
              Row(
                children: [Text('Security Settings', style: AppText.b1b!.w(6))],
              ),
              Space.yf(15),
              AppTextField(
                name: _FormKeys.oldPassword,
                type: TextFieldType.withIcon,

                hint: 'Old Password',
                textInputAction: TextInputAction.next,
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
              Space.yf(10),
              AppTextField(
                name: _FormKeys.newPassword,
                type: TextFieldType.withIcon,

                hint: 'New Password',
                textInputAction: TextInputAction.next,
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
              Space.yf(10),
              AppTextField(
                name: _FormKeys.confirmPassword,
                type: TextFieldType.withIcon,

                hint: 'Confirm New Password',
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
              Space.yf(24),
              AppButton(
                label: 'Save Changes',
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
