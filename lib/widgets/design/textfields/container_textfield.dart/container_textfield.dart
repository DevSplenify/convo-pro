import 'package:convo_pro/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'enums.dart';

class AppContainerTextField extends StatefulWidget {
  final String name;
  final String? hint;
  final String? label;

  final int? maxLength;
  final int maxLines;
  final bool enabled;
  final bool readOnly;

  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;

  /// Custom suffix widget (icons, buttons etc.)
  final Widget? suffix;
  final ContainerTextFieldType type;

  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final void Function()? onTap;
  final bool onTapOutside;

  const AppContainerTextField({
    super.key,
    required this.name,
    this.hint,
    this.label,
    this.maxLength,
    this.maxLines = 1,
    this.enabled = true,
    this.readOnly = false,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.sentences,
    this.suffix,
    this.validator,
    this.onChanged,
    this.onTap,
    this.type = ContainerTextFieldType.primary,
    this.onTapOutside = true,
  });

  @override
  State<AppContainerTextField> createState() => _AppContainerTextFieldState();
}

class _AppContainerTextFieldState extends State<AppContainerTextField> {
  late FocusNode _focusNode;
  String _text = '';

  int get _currentLength => _text.length;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode()..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(widget.label!, style: AppText.inter.b2b!.w(6)),
          Space.yf(10),
        ],

        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            color: _focusNode.hasFocus
                ? AppTheme.c.primary.shade100
                : AppTheme.c.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: _focusNode.hasFocus
                  ? AppTheme.c.primary.main!
                  : AppTheme.c.lightGrey.main!,
            ),
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: widget.maxLines > 1
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: FormBuilderTextField(
                      name: widget.name,
                      focusNode: _focusNode,
                      enabled: widget.enabled,
                      readOnly: widget.readOnly,
                      keyboardType: widget.keyboardType,
                      textInputAction: widget.textInputAction,
                      textCapitalization: widget.textCapitalization,
                      maxLines: widget.maxLines,
                      maxLength: widget.maxLength,
                      cursorColor: AppTheme.c.primary.main!,
                      style: AppText.inter.b2!.cl(AppTheme.c.text.shade800!),

                      validator: widget.validator,
                      onTap: widget.onTap,
                      onChanged: (value) {
                        setState(() {
                          _text = value ?? '';
                        });
                        widget.onChanged?.call(value);
                      },
                      onTapOutside: widget.onTapOutside
                          ? (_) => FocusScope.of(context).unfocus()
                          : null,
                      decoration: InputDecoration(
                        hintText: widget.hint,
                        hintStyle: AppText.inter.b2!.cl(AppTheme.c.text.main!),
                        border: InputBorder.none,
                        counterText: '', // hide default
                        contentPadding: EdgeInsets.symmetric(vertical: 16.h),
                      ),
                    ),
                  ),

                  if (widget.type == ContainerTextFieldType.withSuffix &&
                      widget.suffix != null) ...[
                    Space.xf(8),
                    widget.suffix!,
                  ],
                ],
              ),
              if (widget.maxLength != null) ...[
                Space.yf(6),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '$_currentLength/${widget.maxLength}',
                    style: AppText.inter.b2!.cl(
                      _currentLength >= widget.maxLength!
                          ? AppTheme.c.error.main!
                          : AppTheme.c.text.main!,
                    ),
                  ),
                ),
                Space.yf(16),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
