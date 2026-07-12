abstract class Button {
  final String title;
  final String color;

  Button({required this.title, required this.color});

  void onClick();

  void render();
}
