import 'dialog.dart';

class AndroidDialog extends Dialog {
  AndroidDialog({required super.title, required super.actionButton});

  @override
  void render() {
    print('Android Dialog rendered');
  }
}
