abstract class PaymentService {
  String get name;
  bool pay(String token, double amount);
}

class FawryPaymentService extends PaymentService {
  @override
  bool pay(String token, double amount) {
    /// Payment Integration

    print('Paid ${amount + 10} via Fawry');
    return true;
  }

  @override
  String get name => "Fawry";
}

class BankPaymentService extends PaymentService {
  @override
  bool pay(String token, double amount) {
    /// Payment Integration

    print('Paid ${amount + 5} via Fawry');
    return true;
  }

  @override
  String get name => "Bank";
}
