import 'payment_service.dart';

class PaymentStrategy {
  static final List<PaymentService> paymentServices = [
    FawryPaymentService(),
    BankPaymentService(),
  ];

  static PaymentService getPaymentServiceByType(PaymentType type) {
    switch (type) {
      case PaymentType.Fawry:
        return FawryPaymentService();
      case PaymentType.Bank:
        return BankPaymentService();
    }
  }
}

enum PaymentType { Fawry, Bank }
