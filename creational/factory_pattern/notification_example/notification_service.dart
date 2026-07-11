abstract class NotificationService {
  void send(String receiver, String msg);
}

class EmailNotificationService implements NotificationService {
  @override
  void send(String receiver, String msg) {
    print('Notification is sent to email');
  }
}

class PushNotificationService implements NotificationService {
  @override
  void send(String receiver, String msg) {
    print('Notification is sent to mobile app');
  }
}

class SMSNotificationService implements NotificationService {
  @override
  void send(String receiver, String msg) {
    print('Notification is sent to sms');
  }
}
