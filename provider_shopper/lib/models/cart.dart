import 'package:flutter/foundation.dart';
import 'catalog.dart';

class CartModel extends ChangeNotifier {
  int _count = 0;

  int get count => _count;
  void increment() {
    _count++;
    notifyListeners();
  }
}
