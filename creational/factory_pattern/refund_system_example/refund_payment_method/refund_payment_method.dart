import '../entities/refund_request.dart';

abstract class RefundPaymentMethod {
  final RefundRequest refundRequest;

  RefundPaymentMethod(this.refundRequest);

  bool validate();

  bool refund();
}
