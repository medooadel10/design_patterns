import 'order.dart';

class RefundRequest {
  final Order order;
  String? refundRequestNumber;
  final double refundAmount;
  final String refundReason;
  final String requestDate;
  final PaymentMethodEnum paymentMethod;
  RefundStatus refundStatus = RefundStatus.Requested;

  RefundRequest(
    this.order,
    this.refundAmount,
    this.refundReason,
    this.requestDate,
    this.paymentMethod,
  );
}

enum RefundStatus {
  Requested,
  Validating,
  Processing,
  Completed,
  Failed,
  Cancelled,
}
