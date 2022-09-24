import 'package:flutter/material.dart';
import 'package:v1douvery/models/order.dart';
import 'package:v1douvery/models/user.dart';

class OrderProvider extends ChangeNotifier {
  // ignore: prefer_final_fields
  Order _order = Order(
    id: '',
    address: '',
    products: [],
    orderedAt: int.fromEnvironment(''),
    quantity: [],
    status: int.fromEnvironment(''),
    totalPrice: double.infinity,
    userId: '',
  );
  Order get order => _order;

  void setUser(String order) {
    _order = Order.fromJson(order);
    notifyListeners();
  }

  void setUserFromModel(Order order) {
    _order = order;
    notifyListeners();
  }
}
