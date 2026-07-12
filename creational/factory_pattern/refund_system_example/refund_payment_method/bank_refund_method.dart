import 'refund_payment_method.dart';

class BankRefundMethod extends RefundPaymentMethod {
  BankRefundMethod(super.refundRequest);

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
  bool validate() {
    if (refundRequest.order.customer.bacnAccNumber == null) {
      print('The customer must have an account number');
      return false;
    } else if (refundRequest.refundAmount < 100) {
      print('The amount must be at least 100 EGP');
      return false;
    }
    return true;
  }
}
