import 'payment_processor.dart';

void main() {
  var paymentProcessor = CreditPaymentProcessor();
  paymentProcessor.processPayment(1000);
}
