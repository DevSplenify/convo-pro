import 'package:convo_pro/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class FormBuilderDateSelector extends StatelessWidget {
  final String name;
  final String title;
  final DateTime? initialValue;
  final String placeholder;
  final DateTime? firstDate;
  final DateTime? lastDate;

  const FormBuilderDateSelector({
    super.key,
    required this.name,
    required this.title,
    this.initialValue,
    this.placeholder = 'Select Date',
    this.firstDate,
    this.lastDate,
  });

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return FormBuilderField<DateTime>(
      name: name,
      initialValue: initialValue,
      builder: (FormFieldState<DateTime?> field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppText.inter.b2!.w(6)),
            Space.yf(8),
            GestureDetector(
              onTap: () async {
                final DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: field.value ?? DateTime.now(),
                  firstDate: firstDate ?? DateTime(2000),
                  lastDate: lastDate ?? DateTime(2100),
                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: ColorScheme.light(
                          primary: AppTheme.c.primary.main!,
                          onPrimary: AppTheme.c.white!,
                          surface: AppTheme.c.white!,
                          onSurface: AppTheme.c.text.main!,
                        ),
                      ),
                      child: child!,
                    );
                  },
                );

                if (pickedDate != null) {
                  field.didChange(pickedDate);
                }
              },
              child: Container(
                padding: Space.all(16),
                decoration: BoxDecoration(
                  color: AppTheme.c.white!,
                  borderRadius: UIProps.buttonRadius,
                  border: Border.all(
                    color: AppTheme.c.lightGrey.main!,
                    width: 1.w,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      field.value != null
                          ? _formatDate(field.value!)
                          : placeholder,
                      style: AppText.inter.b2!.cl(
                        field.value != null
                            ? AppTheme.c.text.shade800!
                            : AppTheme.c.text.main!,
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/svgs/calendar.2svg.svg',
                      width: 24.w,
                      height: 24.h,
                    ),
                  ],
                ),
              ),
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

  String _formatDate(DateTime date) {
    // Format: Dec 21, 2025
    return DateFormat('MMM dd, yyyy').format(date);
  }
}
