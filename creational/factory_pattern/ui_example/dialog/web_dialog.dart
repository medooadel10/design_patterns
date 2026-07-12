import 'dialog.dart';

class WebDialog extends Dialog {
  WebDialog({required super.title, required super.actionButton});

  @override
  void render() {
    print('Web Dialog rendered');
  }
}
