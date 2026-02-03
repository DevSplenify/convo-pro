part of 'bottom_navbar.dart';

class NavItem {
  final String label;
  final String icon; // default / unselected
  final String? selectedIcon; // ONLY for items that need it
  final Widget screen;

  NavItem({
    required this.label,
    required this.icon,
    this.selectedIcon,
    required this.screen,
  });
}

final List<NavItem> navItems = [
  NavItem(
    label: 'Home',
    icon: 'assets/svgs/home.svg',
    selectedIcon: 'assets/svgs/home_selected.svg',
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
    screen: const MindfulnessScreen(),
  ),
  NavItem(
    label: 'Education',
    icon: 'assets/svgs/book.svg',
    screen: const EducationHubScreen(),
  ),
  NavItem(
    label: 'Profile',
    icon: 'assets/pngs/pp.png',
    screen: const ProfileScreen(),
  ),
];
