part of 'configs.dart';

class AppText {
  static TextStyle? btn;

  // Headings

  static TextStyle? h1;
  static TextStyle? h1b;
  static TextStyle? h1bm;
  static TextStyle? h2;
  static TextStyle? h2b;
  static TextStyle? h2bm;
  static TextStyle? h3;
  static TextStyle? h3b;
  static TextStyle? h3bm;
  static TextStyle? h4;
  static TextStyle? h4b;
  static TextStyle? h4bm;

  // Body
  static TextStyle? b1;
  static TextStyle? b1b;
  static TextStyle? b1bm;
  static TextStyle? b2;
  static TextStyle? b2b;
  static TextStyle? b2bm;

  // Label
  static TextStyle? l1;
  static TextStyle? l1b;
  static TextStyle? l1bm;
  static TextStyle? l2;
  static TextStyle? l2b;
  static TextStyle? l2bm;

  /// Inter variants
  // ignore: library_private_types_in_public_api
  static _Inter inter = _Inter();

  static void init(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));

    _initStyles(fontFamily, (style) {
      h1 = style.h1;
      h1b = style.h1b;
      h1bm = style.h1bm;
      h2 = style.h2;
      h2b = style.h2b;
      h2bm = style.h2bm;
      h3 = style.h3;
      h3b = style.h3b;
      h3bm = style.h3bm;
      h4 = style.h4;
      h4b = style.h4b;
      h4bm = style.h4bm;
      b1 = style.b1;
      b1b = style.b1b;
      b1bm = style.b1bm;
      b2 = style.b2;
      b2b = style.b2b;
      b2bm = style.b2bm;
      l1 = style.l1;
      l1b = style.l1b;
      l1bm = style.l1bm;
      l2 = style.l2;
      l2b = style.l2b;
      l2bm = style.l2bm;
    });

    // Init Inter styles
    _initStyles('InterTight', (style) {
      inter.h1 = style.h1;
      inter.h1b = style.h1b;
      inter.h1bm = style.h1bm;
      inter.h2 = style.h2;
      inter.h2b = style.h2b;
      inter.h2bm = style.h2bm;
      inter.h3 = style.h3;
      inter.h3b = style.h3b;
      inter.h3bm = style.h3bm;
      inter.h4 = style.h4;
      inter.h4b = style.h4b;
      inter.h4bm = style.h4bm;
      inter.b1 = style.b1;
      inter.b1b = style.b1b;
      inter.b1bm = style.b1bm;
      inter.b2 = style.b2;
      inter.b2b = style.b2b;
      inter.b2bm = style.b2bm;
      inter.l1 = style.l1;
      inter.l1b = style.l1b;
      inter.l1bm = style.l1bm;
      inter.l2 = style.l2;
      inter.l2b = style.l2b;
      inter.l2bm = style.l2bm;
    });
  }

  static void _initStyles(String family, void Function(_StyleHolder) assign) {
    const b = FontWeight.bold;

    TextStyle base = TextStyle(
      fontFamily: family,
      color: AppTheme.c.text.shade800,
      fontWeight: FontWeight.w400,
      letterSpacing: family == 'InterTight' ? 0 : 0,
    );

    final s = _StyleHolder(
      h1: base.copyWith(fontSize: 40.h),
      h2: base.copyWith(fontSize: 36.h),
      h3: base.copyWith(fontSize: 24.h),
      h4: base.copyWith(fontSize: 20.h),
      b1: base.copyWith(fontSize: 16.h),
      b2: base.copyWith(fontSize: 14.h),
      l1: base.copyWith(fontSize: 12.h),
      l2: base.copyWith(fontSize: 10.h),
    );

    s.h1b = s.h1.copyWith(fontWeight: b);
    s.h1bm = s.h1.copyWith(fontWeight: FontWeight.w500);
    s.h2b = s.h2.copyWith(fontWeight: b);
    s.h2bm = s.h2.copyWith(fontWeight: FontWeight.w500);
    s.h3b = s.h3.copyWith(fontWeight: b);
    s.h3bm = s.h3.copyWith(fontWeight: FontWeight.w500);
    s.h4b = s.h4.copyWith(fontWeight: b);
    s.h4bm = s.h4.copyWith(fontWeight: FontWeight.w500);
    s.b1b = s.b1.copyWith(fontWeight: b);
    s.b1bm = s.b1.copyWith(fontWeight: FontWeight.w500);
    s.b2b = s.b2.copyWith(fontWeight: b);
    s.b2bm = s.b2.copyWith(fontWeight: FontWeight.w500);
    s.l1b = s.l1.copyWith(fontWeight: b);
    s.l1bm = s.l1.copyWith(fontWeight: FontWeight.w500);
    s.l2b = s.l2.copyWith(fontWeight: b);
    s.l2bm = s.l2.copyWith(fontWeight: FontWeight.w500);

    assign(s);
  }
}

class _StyleHolder {
  TextStyle h1, h2, h3, h4, b1, b2, l1, l2;
  TextStyle? hb, hbm, h1b, h1bm, h2b, h2bm, h3b, h3bm, h4b, h4bm;
  TextStyle? b1b, b1bm, b2b, b2bm, l1b, l1bm, l2b, l2bm;

  _StyleHolder({
    required this.h1,
    required this.h2,
    required this.h3,
    required this.h4,
    required this.b1,
    required this.b2,
    required this.l1,
    required this.l2,
  });
}

class _Inter {
  TextStyle? hb, hbm, h1, h1b, h1bm, h2, h2b, h2bm;
  TextStyle? h3, h3b, h3bm, h4, h4b, h4bm;
  TextStyle? b1, b1b, b1bm, b2, b2b, b2bm;
  TextStyle? l1, l1b, l1bm, l2, l2b, l2bm;
}
