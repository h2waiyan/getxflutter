import 'package:flutter/material.dart';

class PizzaProvider extends ChangeNotifier {
  int pizza = 0;

  PizzaProvider({required this.pizza});

  void changeNoOfPizza() {
    pizza++;
    notifyListeners();
  }
}

// 1. Install Provider Package
// 2. Create Provider Class - notifyListener
// 3. Wrap the Material App - MultiProvider - providers : [ ]