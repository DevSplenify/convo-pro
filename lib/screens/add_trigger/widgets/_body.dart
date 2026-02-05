part of '../add_trigger.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final screenState = _ScreenState.s(context, true);
    return Scaffold(
      appBar: const CustomAppBar(
        type: AppBarType.withText,
        title: 'Add New Trigger',
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
              AppTextField(
                name: _FormKeys.triggerName,
                type: TextFieldType.withLableOnly,
                hint: 'Enter trigger name',
                label: 'Trigger Name',
              ),
              Space.yf(16),
              FormChoiceChips(
                name: _FormKeys.category,
                title: 'Category',
                options: [
                  'Social',
                  'Work',
                  'Health',
                  'Environment',
                  'Personal',
                ],
                initialValue: 'Social',
                multiSelect: false,
              ),

              Space.yf(16),

              // Intensity Slider
              const FormBuilderIntensitySlider(
                name: _FormKeys.intensity,
                title: 'How intense was it?',
                initialValue: 1.0,
              ),

              Space.yf(16),

              // Date Selector
              FormBuilderDateSelector(
                name: _FormKeys.date,
                title: 'Date',
                placeholder: 'Select Date',
                initialValue: DateTime.now(),
              ),
              Space.yf(16),
              AppTextField(
                name: _FormKeys.notes,
                type: TextFieldType.withLableOnly,
                hint:
                    'How is your day going? How has it affected your mood? Or anything else...',
                label: "Context & Thoughts",
                maxLines: 4,
                minLines: 4,
              ),
              Space.yf(24),
              AppButton(
                label: 'Save Trigger',
                onPressed: () {
                  if (screenState.formKey.currentState?.saveAndValidate() ??
                      false) {
                    if (kDebugMode) {
                      print(
                        'Form Values: ${screenState.formKey.currentState?.value}',
                      );
                    }
                    Navigator.pop(context);
                  } else {
                    if (kDebugMode) {
                      print('Form is not valid');
                    }
                  }
                },
                buttonType: ButtonType.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
