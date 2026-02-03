part of 'live_session.dart';

class _ScreenState extends ChangeNotifier {
  static _ScreenState s(BuildContext context, [bool listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);

  bool isSessionsEmpty = true;

  void toggleSessionsEmpty() {
    isSessionsEmpty = !isSessionsEmpty;
    notifyListeners();
  }
}
