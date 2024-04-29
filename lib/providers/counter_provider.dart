import 'package:flutter/cupertino.dart';

class CounterProvider extends ChangeNotifier{
  int data;
  CounterProvider({
    this.data = 0
  });
  void increment(){
    data++;
    notifyListeners();
  }
  void decrement(){
    data--;
    notifyListeners();
  }
}