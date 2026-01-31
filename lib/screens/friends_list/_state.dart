part of 'friends_list.dart';

class _ScreenState extends ChangeNotifier {
  static _ScreenState s(BuildContext context, [bool listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);

  String selectedTab = 'Friends';
  final List<String> tabs = ['Friends', 'Shared Meals'];
  void selectTab(String tab) {
    selectedTab = tab;
    notifyListeners();
  }
}
