class Delivery {
  final String productName;
  final String status;
  bool received;

  Delivery({
    required this.productName,
    required this.status,
    this.received = false,
  });
}
