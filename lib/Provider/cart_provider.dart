import 'package:flutter/material.dart';
import 'package:HDTech/models/computer_model.dart';
import 'package:provider/provider.dart'; // Đảm bảo đã import package provider
import 'package:intl/intl.dart';
final formatCurrency = NumberFormat.currency(locale: 'vi_VN', symbol: 'VNĐ'); // Format currency in VND



class CartProvider with ChangeNotifier {
  List<Computer> _cart = [];

  List<Computer> get cart => _cart;

  // Thêm sản phẩm vào giỏ hàng
void addToCart(Computer computer, {int quantity = 1}) {
  final index = _cart.indexWhere((item) => item.id == computer.id);
  
  if (index == -1) {
    // Nếu sản phẩm chưa có trong giỏ, thêm mới
    computer.quantity = quantity;
    _cart.add(computer);
  } else {
    // Nếu sản phẩm đã có, tăng số lượng lên
    _cart[index].quantity += quantity;
  }
  
  notifyListeners(); // Cập nhật UI
}

   // Tăng số lượng
  void incrementQtn(int index) {
    _cart[index].quantity++;
    notifyListeners();
  }

  // Giảm số lượng
  void decrementQtn(int index) {
    if (_cart[index].quantity > 1) {
      _cart[index].quantity--;
      notifyListeners();
    }
  }
  
  // Xóa sản phẩm khỏi giỏ hàng
  void removeFromCart(Computer computer) {
    _cart.remove(computer);
    notifyListeners();
  }

  // Tính tổng giá trị giỏ hàng
double get totalPrice {
  double total = 0;
  for (var item in _cart) {
    total += item.price * item.quantity;
  }
  return total;
}

  // Hàm giúp lấy CartProvider từ context
  static CartProvider of(BuildContext context) {
    return Provider.of<CartProvider>(context, listen: false);
  }
}
