import '../../notification_example/notification_factory.dart';
import '../entities/refund_request.dart';
import '../refund_payment_method/bank_refund_method.dart';
import '../refund_payment_method/credit_card_refund_method.dart';
import '../refund_payment_method/refund_payment_method.dart';
import '../refund_payment_method/wallet_refund_method.dart';

abstract class RefundProcessor {
  final RefundRequest refundRequest;

  RefundProcessor(this.refundRequest);

  RefundPaymentMethod createRefund();
  NotificationFactory createNotification();

  void processRefund() {
    if (_validate()) {
      final refundPaymentMethod = createRefund();
      final refunded = refundPaymentMethod.refund();
      if (refunded) {
        refundRequest.refundRequestNumber = 'REF12434';
        refundRequest.refundStatus = RefundStatus.Completed;
        createNotification().sendNotification();
      } else {
        refundRequest.refundStatus = RefundStatus.Failed;
      }
    }
    _displayRefundRequestResponse();
  }

  bool _validate() {
    bool isValidated = true;
    refundRequest.refundStatus = RefundStatus.Validating;
    if (refundRequest.order.amount < refundRequest.refundAmount) {
      refundRequest.refundStatus = RefundStatus.Failed;
      print('The refund amount shoudn\'t be greater that the order amount');
      isValidated = false;
    } else if (refundRequest.refundReason.isEmpty) {
      refundRequest.refundStatus = RefundStatus.Failed;
      print('The refund reason is required');
      isValidated = false;
    } else if (!createRefund().validate()) {
      refundRequest.refundStatus = RefundStatus.Failed;
      isValidated = false;
    }
    return isValidated;
  }

  void _displayRefundRequestResponse() {
    print(
      'Refund Request: ${refundRequest.refundRequestNumber ?? 'N/A'}\nCustomer: ${refundRequest.order.customer.name}\nOrder: ${refundRequest.order.orderNumber}\nRefund Method: ${refundRequest.paymentMethod.name}\nStatus: ${refundRequest.refundStatus.name}',
    );
  }
}

class CreditCardRefundProcessor extends RefundProcessor {
  CreditCardRefundProcessor(super.refundRequest);

  @override
  RefundPaymentMethod createRefund() {
    return CreditCardRefundMethod(refundRequest);
  }

  @override
  NotificationFactory createNotification() {
    return SMSNotificationFactory(
      receiver: refundRequest.order.customer.name,
      msg: 'Refund has been completed by credit',
    );
  }
}

class BankRefundProcessor extends RefundProcessor {
  BankRefundProcessor(super.refundRequest);

  @override
  RefundPaymentMethod createRefund() {
    return BankRefundMethod(refundRequest);
  }

  @override
  NotificationFactory createNotification() {
    return SMSNotificationFactory(
      receiver: refundRequest.order.customer.name,
      msg: 'Refund has been completed by bank',
    );
  }
}

class WalletRefundProcessor extends RefundProcessor {
  WalletRefundProcessor(super.refundRequest);

  @override
  RefundPaymentMethod createRefund() {
    return WalletRefundMethod(refundRequest);
  }

  @override
  NotificationFactory createNotification() {
    return SMSNotificationFactory(
      receiver: refundRequest.order.customer.name,
      msg: 'Refund has been completed by wallet',
    );
  }
}
