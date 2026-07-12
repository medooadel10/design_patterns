import '../../notification_example/notification_factory.dart';
import '../entities/order.dart';
import 'refund_payment_method.dart';

class WalletRefundMethod extends RefundPaymentMethod {
  WalletRefundMethod(super.refundRequest);

  @override
  bool refund() {
    // Refund operations
    refundRequest.order.customer.wallet!.amount += refundRequest.refundAmount;
    print(
      'Your wallet balance now is:  ${refundRequest.order.customer.wallet!.amount}',
    );
    return true;
  }

  @override
  void sendNotification() {
    NotificationFactory factory = EmailNotificationFactory(
      receiver: refundRequest.order.customer.name,
      msg: 'The refund has been completed',
    );
    factory.sendNotification();
    print('The notification sent by Email');
  }

  @override
  bool validate() {
    if (refundRequest.paymentMethod != PaymentMethodEnum.wallet) {
      print('The original order must have been paid by wallet');
      return false;
    } else if (refundRequest.order.customer.wallet == null) {
      print('The customer must have a wallet');
      return false;
    }
    return true;
  }
}
