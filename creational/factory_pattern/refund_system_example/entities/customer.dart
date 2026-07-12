import 'customer_wallet.dart';

class Customer {
  final String name;
  final String? cardReference;
  final String? bacnAccNumber;
  final CustomerWallet? wallet;

  Customer(this.name, this.cardReference, this.bacnAccNumber, {this.wallet});
}
