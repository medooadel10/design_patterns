import 'payment_method.dart';

abstract class PaymentProcessor {
  // Factory Method -> so it lets the subclasses decides which class to be instantiate
  PaymentMethod createPaymentMethod();
  void processPayment(double amount) {
    try {
      final paymentMethod = createPaymentMethod();
      paymentMethod.pay(amount);
      saveTransaction();
      sendReceipt();
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  void saveTransaction() {
    print('Transactions is saved');
  }

  void sendReceipt() {
    print('Receipt is sent');
  }
}

class PaypalPaymentProcessor extends PaymentProcessor {
  @override
  PaymentMethod createPaymentMethod() {
    return PaypalPaymentMethod();
  }
}

class WalletPaymentProcessor extends PaymentProcessor {
  @override
  PaymentMethod createPaymentMethod() {
    return WalletPaymentMethod();
  }
}

class CreditPaymentProcessor extends PaymentProcessor {
  @override
  PaymentMethod createPaymentMethod() {
    return CreditPaymentMethod();
  }
}

class DepitPaymentProcessor extends PaymentProcessor {
  @override
  PaymentMethod createPaymentMethod() {
    return DepitCardPaymentMethod();
  }
}
