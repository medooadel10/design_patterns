import 'notification_service.dart';

abstract class NotificationFactory {
  final String receiver;
  final String msg;

  NotificationFactory({required this.receiver, required this.msg});

  NotificationService createNotification();

  void sendNotification() {
    var notificationService = createNotification();
    notificationService.send(receiver, msg);
    _saveNotificationInDB();
  }

  void _saveNotificationInDB() {
    print('Notification for $receiver is saved');
  }
}

class EmailNotificationFactory extends NotificationFactory {
  EmailNotificationFactory({required super.receiver, required super.msg});

  @override
  NotificationService createNotification() {
    return EmailNotificationService();
  }
}

class PushNotificationFactory extends NotificationFactory {
  PushNotificationFactory({required super.receiver, required super.msg});

  @override
  NotificationService createNotification() {
    return PushNotificationService();
  }
}

class SMSNotificationFactory extends NotificationFactory {
  SMSNotificationFactory({required super.receiver, required super.msg});

  @override
  NotificationService createNotification() {
    return SMSNotificationService();
  }
}
