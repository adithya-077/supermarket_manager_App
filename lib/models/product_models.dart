class Products {
  final String productName;
  final String productUid;
  final String productQantity;

  Products(
      {required this.productName,
      required this.productQantity,
      required this.productUid});

  Map<String, dynamic> tojson() {
    return {
      'productName': productName,
      'productQantity': productQantity,
      'productUid': productUid,
    };
  }
}
