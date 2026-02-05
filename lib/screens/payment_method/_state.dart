part of 'payment_method.dart';

class _ScreenState extends ChangeNotifier {
  static _ScreenState s(BuildContext context, [bool listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);

  // Initial value should match one of the titles in your list
  String _selectedMethod = '********8468';
  String get selectedMethod => _selectedMethod;

  void setPaymentMethod(String method) {
    _selectedMethod = method;
    notifyListeners(); // This triggers the UI to rebuild
  }
}
