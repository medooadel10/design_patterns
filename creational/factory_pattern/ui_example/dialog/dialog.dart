import '../button/button.dart';

abstract class Dialog {
  final String title;
  final Button actionButton;
  Dialog({required this.title, required this.actionButton});
  void render() {}
}
