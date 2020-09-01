import 'package:flutter/material.dart';
import 'package:food_delivery_flutter_ui/provider/my_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Food delivery'),
        leading: Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: BackButton(
            color: Colors.grey[600],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 64),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<MyProvider>(builder: (context, numbersOfOrders, child) {
                return Text(
                  'the total price is \$${numbersOfOrders.totalNumber}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
