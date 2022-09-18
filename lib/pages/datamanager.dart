import 'package:flutter_application_1/datamodel.dart';

class DataManager {
  List<Category>? _menu;
  List<ItemInCart> cart = [];

  cartAdd(Product p) {
    bool found = false;
    for (var item in cart) {
      if (item.product.id == p.id) {
        item.quantity++;
      }
      if (!found) {
        cart.add(ItemInCart(product: p, quantity: 1));
      }
    }
  }

  cartRemove(Product p) {
    cart.removeWhere((item) => item.product.id == p.id);
  }

  cartClear() {
    cart.clear();
  }

  double cartTotal() {
    double total = 0;
    for (var item in cart) {
      total += item.quantity * item.product.price;
    }
    return total;
  }
}
