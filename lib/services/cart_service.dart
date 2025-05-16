import 'package:guitar_haven/models/product_model.dart';

class CartItem {
  final Product product;
  final int quantity;
  final String? color;
  final String? size;

  CartItem(this.product, this.quantity, this.color, this.size);
}

class CartService {
  static final CartService _instance = CartService._internal();
  factory CartService() => _instance;
  CartService._internal();

  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addToCart(Product product, int quantity, String? color, String? size) {
    _cartItems.add(CartItem(product, quantity, color, size));
  }

  void removeFromCart(int index) {
    _cartItems.removeAt(index);
  }

  void clearCart() {
    _cartItems.clear();
  }
}
