import '../ui_factory.dart';

class SettingsScreen {
  final UiFactory uiFactory;

  SettingsScreen({required this.uiFactory});

  void buildUi() {
    final button = uiFactory.createButton('Submit', 'Red');
    button.render();
    button.onClick();
    final dialog = uiFactory.createdDialog(
      'Do u want to submit ?',
      'Submit',
      'Green',
    );
    dialog.render();
  }
}
