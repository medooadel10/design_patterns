import 'customer.dart';

class Order {
  final String orderNumber;
  final double amount;
  final Customer customer;
  final PaymentMethodEnum paymentMethod;

  Order(this.orderNumber, this.amount, this.customer, this.paymentMethod);
}

enum PaymentMethodEnum { credit, wallet, bank }
