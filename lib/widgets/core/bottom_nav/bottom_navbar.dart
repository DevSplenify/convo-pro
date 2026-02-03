import 'dart:ui';

import 'package:convo_pro/configs/configs.dart';
import 'package:convo_pro/screens/education_hub/education_hub.dart';
import 'package:convo_pro/screens/home/home.dart';
import 'package:convo_pro/screens/mindfulness/mindfulness.dart';
import 'package:convo_pro/screens/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'content.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _currentIndex = 0;

  void _onTabTap(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      extendBody: true,
      body: navItems[_currentIndex].screen,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, bottomInset + 12.h),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24.r),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 17.4, sigmaY: 17.4),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 14.5.h, horizontal: 16.w),
              decoration: BoxDecoration(
                color: AppTheme.c.black!,
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(navItems.length, (index) {
                  final item = navItems[index];
                  final isSelected = _currentIndex == index;

                  return GestureDetector(
                    onTap: () => _onTabTap(index),
                    behavior: HitTestBehavior.translucent,
                    child: _NavItem(
                      item: item,
                      isSelected: isSelected,
                      index: index,
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final NavItem item;
  final bool isSelected;
  final int index;

  const _NavItem({
    required this.item,
    required this.isSelected,
    required this.index,
  });

  @override
  @override
  Widget build(BuildContext context) {
    final color = isSelected ? AppTheme.c.primary.main : AppTheme.c.white;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (index == 4)
          Container(
            height: 24.h,
            width: 24.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: color!, width: 1.w),
              image: DecorationImage(
                image: AssetImage(item.icon),
                fit: BoxFit.cover,
              ),
            ),
          )
        else
          SvgPicture.asset(
            (index == 0 && isSelected && item.selectedIcon != null)
                ? item.selectedIcon!
                : item.icon,
            height: 24.h,
            colorFilter: ColorFilter.mode(color!, BlendMode.srcIn),
          ),

        Space.yf(5),

        Text(
          item.label,
          style: AppText.inter.l2!.copyWith(
            color: color,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class Screen1 extends StatelessWidget {
  const Screen1({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text("Screen 1"));
}

class Screen2 extends StatelessWidget {
  const Screen2({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text("Screen 2"));
}

class Screen3 extends StatelessWidget {
  const Screen3({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text("Screen 3")));
}

class Screen4 extends StatelessWidget {
  const Screen4({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text("Screen 4"));
}

class Screen5 extends StatelessWidget {
  const Screen5({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text("Screen 5"));
}
