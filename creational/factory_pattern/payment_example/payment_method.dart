abstract class PaymentMethod {
  void pay(double amount);
}

class PaypalPaymentMethod extends PaymentMethod {
  @override
  void pay(double amount) {
    print('Paid by Paypal');
  }
}

class WalletPaymentMethod extends PaymentMethod {
  @override
  void pay(double amount) {
    print('Paid by Wallet');
  }
}

class CreditPaymentMethod extends PaymentMethod {
  @override
  void pay(double amount) {
    print('Paid by Credit');
  }
}

class DepitCardPaymentMethod extends PaymentMethod {
  @override
  void pay(double amount) {
    print('Paid by Depit');
  }
}
