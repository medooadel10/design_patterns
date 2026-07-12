import 'dialog.dart';

class iOSDialog extends Dialog {
  iOSDialog({required super.title, required super.actionButton});

  @override
  void render() {
    print('iOS Dialog rendered');
  }
}
