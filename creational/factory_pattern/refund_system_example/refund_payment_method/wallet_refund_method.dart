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
  bool validate() {
    if (refundRequest.order.customer.wallet == null) {
      print('The customer must have a wallet');
      return false;
    }
    return true;
  }
}
