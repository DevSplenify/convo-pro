part of 'settings.dart';

class _ScreenState extends ChangeNotifier {
  static _ScreenState s(BuildContext context, [bool listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);

  bool notificationsEnabled = true;

  void toggleNotifications(bool value) {
    notificationsEnabled = value;
    notifyListeners();
  }
}
