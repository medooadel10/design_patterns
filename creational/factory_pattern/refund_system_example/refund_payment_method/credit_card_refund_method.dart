import '../../notification_example/notification_factory.dart';
import '../entities/order.dart';
import 'refund_payment_method.dart';

class CreditCardRefundMethod extends RefundPaymentMethod {
  CreditCardRefundMethod(super.refundRequest);

  @override
  bool refund() {
    // Refund operations
    return true;
  }

  @override
  void sendNotification() {
    NotificationFactory factory = SMSNotificationFactory(
      receiver: refundRequest.order.customer.name,
      msg: 'The refund has been completed',
    );
    factory.sendNotification();
    print('The notification sent by SMS');
  }

  @override
  bool validate() {
    if (refundRequest.order.paymentMethod != PaymentMethodEnum.credit) {
      print('The original order must have been paid by credit card');
      return false;
    } else if (refundRequest.order.customer.cardReference == null ||
        refundRequest.order.customer.cardReference?.isEmpty == true) {
      print('The card transaction reference must exist');
      return false;
    }
    return true;
  }
}
