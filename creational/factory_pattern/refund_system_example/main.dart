import 'entities/customer.dart';
import 'entities/customer_wallet.dart';
import 'entities/order.dart';
import 'entities/refund_request.dart';
import 'refund_processor/refund_processor.dart';

void main() {
  final wallet = CustomerWallet(123, 1000);
  final customer = Customer('Mohamed Adel', '1233255656', '', wallet: wallet);
  final order = Order('ORD1234', 1000, customer, PaymentMethodEnum.wallet);
  final refundRequest = RefundRequest(
    order,
    800,
    'The order is destroyed',
    '1/1/2026',
    PaymentMethodEnum.wallet,
  );
  final RefundProcessor refundProcessor = WalletRefundProcessor(refundRequest);
  refundProcessor.processRefund();
}
