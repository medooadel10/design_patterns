import 'button.dart';

class WebButton extends Button {
  WebButton({required super.title, required super.color});

  @override
  void render() {
    print('Android Rendered');
  }

  @override
  void onClick() {
    print('Android On Clicked');
  }
}
