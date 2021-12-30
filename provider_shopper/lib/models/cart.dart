import 'package:flutter/foundation.dart';
import 'catalog.dart';

class CartModel extends ChangeNotifier {
  int _count = 0;
  List<int> _itemId = [];

  int get count => _count;
  List<int> get itemsId => _itemId;

  void increment() {
    _count++;
    notifyListeners();
  }

  void add(int id) {
    _itemId.add(id);
    notifyListeners();
  }

  void remove(int id) {
    _itemId.remove(id);
    notifyListeners();
  }
}
