part of 'create_journal.dart';

class _ScreenState extends ChangeNotifier {
  static _ScreenState s(BuildContext context, [bool listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);

  final formKey = GlobalKey<FormBuilderState>();

  bool isPrivacyOn = false;
  void togglePrivacy(bool value) {
    isPrivacyOn = value;
    notifyListeners();
  }
}
