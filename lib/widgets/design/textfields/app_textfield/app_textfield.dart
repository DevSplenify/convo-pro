import 'package:convo_pro/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'enums.dart';

class AppTextField extends StatefulWidget {
  final String name;
  final TextEditingController? controller;
  final String? hint;
  final bool? isPass;
  final bool? enabled;
  final double? width;
  final String? label;
  final String? helperText;
  final String? topHelperIcon;
  final String? labelHelperText;

  final bool? autoFocus;
  final FocusNode? node;

  final bool readOnly;

  final TextFieldType type;

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? initialValue;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;

  final String? errorText;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final void Function()? onEditComplete;
  final List<TextInputFormatter>? inputformatters;

  final void Function()? onTap;

  final int? maxLines;
  final int? minLines;

  final Color? fillColor;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final bool gradientOnFocusOnly;
  final TextStyle? labelStyle;
  final int? maxLength;

  final bool onTapOutside;

  const AppTextField({
    super.key,
    this.node,
    this.label,
    this.controller,
    this.enabled,
    this.errorText,
    this.autoFocus,
    this.prefixIcon,
    this.onChanged,
    this.onEditComplete,
    this.initialValue,
    this.validator,
    this.suffixIcon,
    this.onTap,
    required this.name,
    this.hint,
    this.readOnly = false,
    this.isPass = false,
    this.textInputType,
    this.inputformatters,
    this.width = double.infinity,
    this.textInputAction = TextInputAction.done,
    this.textCapitalization = TextCapitalization.sentences,
    this.maxLines,
    this.minLines = 1,
    this.type = TextFieldType.primary,
    this.helperText,
    this.topHelperIcon,
    this.labelHelperText,
    this.fillColor,
    this.style,
    this.hintStyle,
    this.gradientOnFocusOnly = true,
    this.labelStyle,
    this.maxLength,
    this.onTapOutside = true,
  });

  @override
  AppTextFieldState createState() => AppTextFieldState();
}

class AppTextFieldState extends State<AppTextField> {
  bool show = false;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    show = widget.isPass ?? false;
    _focusNode = widget.node ?? FocusNode();

    _focusNode.addListener(() {
      setState(() {}); // 🔥 forces rebuild on focus change
    });
  }

  @override
  void dispose() {
    if (widget.node == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);
    ScreenUtil.init(context, designSize: const Size(375, 812));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if ((widget.label != null &&
                widget.type == TextFieldType.withLableOnly) ||
            widget.type == TextFieldType.withLabelAndIcon) ...[
          Row(
            children: [
              Text(
                widget.label!,
                style: widget.labelStyle ?? AppText.inter.b2b!.w(6),
              ),
              if (widget.labelHelperText != null) ...[
                Space.xf(4),
                Text(
                  widget.labelHelperText!,
                  style: AppText.b2bm!.cl(AppTheme.c.text.shade800!),
                ),
              ],
              if (widget.topHelperIcon != null) ...[
                Space.xf(4),
                SvgPicture.asset(
                  widget.topHelperIcon!,
                  width: 16.w,
                  height: 16.h,
                ),
              ],
            ],
          ),
          Space.yf(8),
        ],

        FormBuilderTextField(
          name: widget.name,
          controller: widget.controller,
          focusNode: _focusNode,
          maxLength: widget.maxLength,
          minLines: widget.minLines,
          maxLines: widget.maxLines ?? 1,
          enabled: widget.enabled ?? true,
          readOnly: widget.readOnly,
          autofocus: widget.autoFocus ?? false,
          keyboardType: widget.textInputType,
          textInputAction: widget.textInputAction,
          textCapitalization: widget.textCapitalization,
          inputFormatters: widget.inputformatters,
          initialValue: widget.initialValue,
          obscureText: show,
          style:
              widget.style ?? AppText.inter.b2!.cl(AppTheme.c.text.shade800!),
          cursorColor: AppTheme.c.primary.main!,
          onTap: widget.onTap,
          onTapOutside: widget.onTapOutside
              ? (_) => FocusScope.of(context).unfocus()
              : null,
          validator: widget.validator,
          onChanged: widget.onChanged,
          onEditingComplete: widget.onEditComplete,

          decoration: InputDecoration(
            errorText: widget.errorText,
            hintText: widget.hint,
            hintStyle:
                widget.hintStyle ?? AppText.inter.b2!.cl(AppTheme.c.text.main!),

            prefixIcon: widget.prefixIcon,
            constraints: BoxConstraints(
              minWidth: widget.prefixIcon != null ? 20.w : 0,
              minHeight: widget.prefixIcon != null ? 20.h : 0,
            ),
            suffixIcon:
                widget.suffixIcon ??
                (widget.isPass!
                    ? IconButton(
                        padding: Space.hf(6).copyWith(left: 0),
                        splashRadius: AppDimensions.normalize(8),
                        onPressed: () => setState(() => show = !show),
                        icon: SvgPicture.asset(
                          show
                              ? 'assets/svgs/eye-disabled.svg'
                              : 'assets/svgs/eye-open.svg',
                          width: 24.w,
                          height: 24.h,
                          colorFilter: AppTheme.c.text.main != null
                              ? ColorFilter.mode(
                                  AppTheme.c.text.main!,
                                  BlendMode.srcIn,
                                )
                              : null,
                        ),
                      )
                    : null),

            filled: true,

            // ✅ DIFFERENT FILL COLORS
            fillColor: _focusNode.hasFocus
                ? AppTheme.c.primary.shade100
                : (widget.fillColor ?? AppTheme.c.white),

            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 16.h,
            ),

            // ✅ UNFOCUSED BORDER
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: AppTheme.c.lightGrey.main!,
                width: 1,
              ),
            ),

            // ✅ FOCUSED BORDER
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: AppTheme.c.primary.main!, width: 1),
            ),

            // ✅ ERROR BORDER
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: AppTheme.c.error.main!, width: 1),
            ),

            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: AppTheme.c.error.main!, width: 1),
            ),
          ),
        ),

        if (widget.helperText != null) ...[
          Space.yf(6),
          Text(
            widget.helperText!,
            style: AppText.l2!.cl(AppTheme.c.text.main!),
          ),
        ],
      ],
    );
  }
}
