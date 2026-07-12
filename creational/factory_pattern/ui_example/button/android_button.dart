import 'button.dart';

class AndroidButton extends Button {
  AndroidButton({required super.title, required super.color});

  @override
  void render() {
    print('Android Rendered');
  }

  @override
  void onClick() {
    print('Android On Clicked');
  }
}
