import 'button.dart';

class iOSButton extends Button {
  iOSButton({required super.title, required super.color});

  @override
  void render() {
    print('iOS Rendered');
  }

  @override
  void onClick() {
    print('iOS On Clicked');
  }
}
