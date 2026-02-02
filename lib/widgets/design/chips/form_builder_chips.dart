import 'package:convo_pro/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormChoiceChips extends StatelessWidget {
  final String name;
  final String title;
  final List<String> options;
  final String? initialValue;
  final bool multiSelect;

  const FormChoiceChips({
    super.key,
    required this.name,
    required this.title,
    required this.options,
    this.initialValue,
    this.multiSelect = false,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<dynamic>(
      name: name,
      initialValue: multiSelect ? <String>[] : initialValue,
      builder: (FormFieldState<dynamic> field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppText.inter.b2!.w(6)),
            Space.yf(8),
            Wrap(
              spacing: 12.w,
              runSpacing: 8.h,
              children: options.map((option) {
                final isSelected = multiSelect
                    ? (field.value as List<String>).contains(option)
                    : field.value == option;

                return _CustomChoiceChip(
                  label: option,
                  isSelected: isSelected,
                  onTap: () {
                    if (multiSelect) {
                      final currentList = List<String>.from(
                        field.value as List<String>,
                      );
                      if (currentList.contains(option)) {
                        currentList.remove(option);
                      } else {
                        currentList.add(option);
                      }
                      field.didChange(currentList);
                    } else {
                      field.didChange(option);
                    }
                  },
                );
              }).toList(),
            ),
            if (field.errorText != null)
              Padding(
                padding: EdgeInsets.only(top: 6.h),
                child: Text(
                  field.errorText!,
                  style: TextStyle(color: Colors.red, fontSize: 12.sp),
                ),
              ),
          ],
        );
      },
    );
  }
}

class _CustomChoiceChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _CustomChoiceChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: Space.all(22, 10),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.c.primary.main : AppTheme.c.white,
          borderRadius: UIProps.radiusM,
          border: Border.all(
            color: isSelected
                ? AppTheme.c.primary.main!
                : AppTheme.c.lightGrey.main!,
            width: 1.w,
          ),
        ),
        child: Text(
          label,
          style: AppText.inter.b2!.cl(
            isSelected ? AppTheme.c.white! : AppTheme.c.text.main!,
          ),
        ),
      ),
    );
  }
}
