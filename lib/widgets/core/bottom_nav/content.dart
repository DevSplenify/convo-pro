part of 'bottom_navbar.dart';

class NavItem {
  final String label;
  final String icon;
  final Widget screen;

  NavItem({required this.label, required this.icon, required this.screen});
}

final List<NavItem> navItems = [
  NavItem(
    label: 'Home',
    icon: 'assets/svgs/home.svg',
    screen: const HomeScreen(),
  ),
  NavItem(
    label: 'Journaling',
    icon: 'assets/svgs/journaling.svg',
    screen: const Screen2(),
  ),
  NavItem(
    label: 'Mindfulness',
    icon: 'assets/svgs/brain.svg',
    screen: const Screen3(),
  ),
  NavItem(
    label: 'Education',
    icon: 'assets/svgs/book.svg',
    screen: const Screen4(),
  ),
  NavItem(
    label: 'Profile',
    icon: 'assets/pngs/pp.png',
    screen: const Screen5(),
  ),
];
