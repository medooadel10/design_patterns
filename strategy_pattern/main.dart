import 'dart:io';

import 'payment_strategy.dart';

void main() {
  print('Enter the amount and select one of payment type');
  final type = stdin.readLineSync();
  final amount = stdin.readLineSync();
  PaymentType paymentType;
  switch (type) {
    case "0":
      paymentType = PaymentType.Fawry;
    case "1":
      paymentType = PaymentType.Bank;
    default:
      throw UnimplementedError();
  }

  final service = PaymentStrategy.getPaymentServiceByType(paymentType);
  service.pay("ASDGASD123562", double.parse(amount ?? ''));
}
