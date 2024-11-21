import 'package:HDTech/models/cart_model.dart';

class CheckoutDetails {
  final List<CartItem> products;
  final double totalPrice;
  final double vatOrder;
  final double shippingFee;
  final double orderTotal;
  final String cartId;  
  final String userId;  

  CheckoutDetails({
    required this.products,
    required this.totalPrice,
    required this.vatOrder,
    required this.shippingFee,
    required this.orderTotal,
    required this.cartId,
    required this.userId,
  });

  factory CheckoutDetails.fromJson(Map<String, dynamic> json) {
    final basePrice = json['totalPrice'].toDouble();
    final calculatedVAT = basePrice * 0.1;
    final calculatedShippingFee = calculateShippingFee(basePrice);
    final calculatedOrderTotal = basePrice + calculatedVAT + calculatedShippingFee;

    return CheckoutDetails(
      products: (json['products'] as List)
          .map((item) => CartItem.fromJson(item))
          .toList(),
      totalPrice: basePrice,
      vatOrder: calculatedVAT,
      shippingFee: calculatedShippingFee,
      orderTotal: calculatedOrderTotal,
      cartId: json['cartId'],  
      userId: json['userId'],  
    );
  }

  static double calculateShippingFee(double totalPrice) {
    if (totalPrice >= 50000000) {
      return 0.0;
    } else if (totalPrice >= 20000000) {
      return 30000.0;
    } else {
      return 50000.0;
    }
  }
}
