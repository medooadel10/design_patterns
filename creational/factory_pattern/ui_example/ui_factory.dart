import 'button/android_button.dart';
import 'button/button.dart';
import 'button/ios_button.dart';
import 'button/web_button.dart';
import 'dialog/android_dialog.dart';
import 'dialog/dialog.dart';
import 'dialog/ios_dialog.dart';
import 'dialog/web_dialog.dart';

abstract class UiFactory {
  Button createButton(String title, String color);
  Dialog createdDialog(
    String title,
    String buttonActionTitle,
    String buttonActionColor,
  );
}

class AndroidUiFactory extends UiFactory {
  @override
  Button createButton(String title, String color) {
    return AndroidButton(title: title, color: color);
  }

  @override
  Dialog createdDialog(
    String title,
    String buttonActionTitle,
    String buttonActionColor,
  ) {
    return AndroidDialog(
      title: title,
      actionButton: createButton(buttonActionTitle, buttonActionColor),
    );
  }
}

class iOSUiFactory extends UiFactory {
  @override
  Button createButton(String title, String color) {
    return iOSButton(title: title, color: color);
  }

  @override
  Dialog createdDialog(
    String title,
    String buttonActionTitle,
    String buttonActionColor,
  ) {
    return iOSDialog(
      title: title,
      actionButton: createButton(buttonActionTitle, buttonActionColor),
    );
  }
}

class WebUiFactory extends UiFactory {
  @override
  Button createButton(String title, String color) {
    return WebButton(title: title, color: color);
  }

  @override
  Dialog createdDialog(
    String title,
    String buttonActionTitle,
    String buttonActionColor,
  ) {
    return WebDialog(
      title: title,
      actionButton: createButton(buttonActionTitle, buttonActionColor),
    );
  }
}
