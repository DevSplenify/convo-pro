part of 'ai_conversation.dart';

class _ScreenState extends ChangeNotifier {
  static _ScreenState s(BuildContext context, [bool listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);

  bool _showChat = false;
  bool _isRecording = false;

  bool get showChat => _showChat;
  bool get isRecording => _isRecording;

  set showChat(bool value) {
    _showChat = value;
    notifyListeners();
  }

  void toggleRecording() {
    _isRecording = !_isRecording;
    notifyListeners();
  }
}
