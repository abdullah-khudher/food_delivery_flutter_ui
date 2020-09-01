import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  int _ordersNumber = 0;
  double _totalNumber = 0;
  int _selectedBNBItem = 0;
  int _selectedIndexOfMenuList = 0;
  int _amountOfFood = 1;

  void increaseOrderNumber() {
    _ordersNumber++;
    notifyListeners();
  }

  int get ordersNumber => _ordersNumber;

  void calculateTotalPrice(int amount, double price) {
    _totalNumber += amount * price;
    notifyListeners();
  }

  double get totalNumber => _totalNumber;

  void bnBItem(int index) {
    _selectedBNBItem = index;
    notifyListeners();
  }

  int get selectedBNBItem => _selectedBNBItem;

  void setSelectedIndex(int i) {
    _selectedIndexOfMenuList = i;
    notifyListeners();
  }

  int get selectedIndexOfMenuList => _selectedIndexOfMenuList;

  void increaseAmountOfFood() {
    _amountOfFood++;
    notifyListeners();
  }

  void decreaseAmountOfFood() {
    _amountOfFood--;
    notifyListeners();
  }

  int get amountOfFood => _amountOfFood;
}
