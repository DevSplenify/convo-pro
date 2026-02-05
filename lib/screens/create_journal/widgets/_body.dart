part of '../create_journal.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final screenState = _ScreenState.s(context, true);
    return Scaffold(
      appBar: const CustomAppBar(
        type: AppBarType.withText,
        title: 'Create Journal',
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormBuilderMoodSlider(name: _FormKeys.mood, title: 'Mood'),
              Space.yf(24),
              FormChoiceChips(
                name: _FormKeys.affectingMood,
                title: 'What is affecting your mood ?',
                options: [
                  'Work',
                  'Exercise',
                  'Family',
                  'Hobbies',
                  'Finances',
                  'Sleep',
                  'Drink',
                  'Food',
                  'Relationships',
                  'Education',
                  'Weather',
                  'Music',
                  'Travel',
                  'Health',
                ],
                initialValue: 'Social',
                multiSelect: false,
              ),
              Space.yf(24),
              AppTextField(
                name: _FormKeys.title,
                type: TextFieldType.withLableOnly,
                hint: 'Enter title',
                label: 'Title',
              ),
              Space.yf(24),
              AppTextField(
                name: _FormKeys.journalEntry,
                type: TextFieldType.withLableOnly,
                hint:
                    'How is your day going? How has it affected your mood? Or anything else...',
                label: "Let’s write about it",
                textInputAction: TextInputAction.next,
                maxLines: 4,
                minLines: 4,
              ),
              Space.yf(24),
              _buildSwitchItem('Privacy Lock', screenState.isPrivacyOn, (
                bool value,
              ) {
                screenState.togglePrivacy(value);
              }),
              Space.yf(24),
              AppButton(
                label: 'Add Log',
                onPressed: () {
                  screenState.formKey.currentState?.save();
                  debugPrint(
                    'Form Values: ${screenState.formKey.currentState?.value}',
                  );

                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSwitchItem(
    String title,

    bool value,
    ValueChanged<bool> onChanged,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: Space.all(16, 12),
      decoration: BoxDecoration(
        color: AppTheme.c.white,
        borderRadius: UIProps.radiusM,
      ),
      child: Row(
        children: [
          Text(title, style: AppText.inter.b2!.w(6)),
          const Spacer(),
          SizedBox(
            width: 33.33.w,
            height: 24.h,
            child: Transform.scale(
              scale: 0.7,
              child: Switch(
                value: value,
                onChanged: onChanged,
                thumbColor: WidgetStateProperty.all(AppTheme.c.white!),
                trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
                inactiveTrackColor: AppTheme.c.lightGrey.main!,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
