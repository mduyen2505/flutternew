import 'package:HDTech/models/cart_model.dart';
class CheckoutDetails {
  final List<CartItem> products;
  final double totalPrice;
  final double vatOrder;
  final double shippingFee;
  final double orderTotal;

  CheckoutDetails({
    required this.products,
    required this.totalPrice,
    required this.vatOrder,
    required this.shippingFee,
    required this.orderTotal,
  });

  factory CheckoutDetails.fromJson(Map<String, dynamic> json) {
    return CheckoutDetails(
      products: (json['products'] as List)
          .map((item) => CartItem.fromJson(item))
          .toList(),
      totalPrice: json['totalPrice'].toDouble(),
      vatOrder: json['vatOrder'].toDouble(),
      shippingFee: json['shippingFee'].toDouble(),
      orderTotal: json['orderTotal'].toDouble(),
    );
  }
}
