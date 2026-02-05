part of '../create_log.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final screenState = _ScreenState.s(context, true);
    return Scaffold(
      appBar: const CustomAppBar(
        type: AppBarType.withText,
        title: 'Today Date Here',
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 16.h,
          left: 24.w,
          right: 24.w,
          bottom: MediaQuery.of(context).padding.bottom + 10.h,
        ),
        child: FormBuilder(
          key: screenState.formKey,
          initialValue: _FormData.initialValues(),
          child: Column(
            children: [
              AppTextField(
                name: _FormKeys.emotions,
                type: TextFieldType.withLableOnly,
                hint: 'Enter about your emotions',
                label: "Write Anything",
                textInputAction: TextInputAction.next,
                maxLines: 5,
                minLines: 5,
              ),
              Space.yf(32),
              FormBuilderMoodSlider(name: _FormKeys.mood, title: 'Mood'),
              Space.yf(32),
              FormBuilderMoodSlider(
                name: _FormKeys.confidence,
                title: 'Confidence',
              ),
              Space.yf(32),
              FormBuilderMoodSlider(
                name: _FormKeys.socailEnergy,
                title: 'Social Energy',
              ),
              Space.yf(64),
              AppButton(
                label: 'Done',
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
