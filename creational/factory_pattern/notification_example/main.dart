import 'notification_factory.dart';

void main() {
  var notification = EmailNotificationFactory(
    receiver: 'Mohammed Adel',
    msg: 'Welcome mohammed',
  );
  notification.sendNotification();
}
