import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_flutter_ui/model/product_model.dart';
import 'package:food_delivery_flutter_ui/provider/my_provider.dart';
import 'package:provider/provider.dart';

import 'card_screen.dart';

class ProductPage extends StatelessWidget {
  ProductPage(this.itemOfFood);

  final FoodProduct itemOfFood;

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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 32.0, top: 16),
            child: Container(
              height: 50,
              width: 50,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF0C143),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      height: 22,
                      width: 22,
                      child: Center(
                        child: Consumer<MyProvider>(
                            builder: (context, numberOfOrders, child) {
                          return Text(
                            numberOfOrders.ordersNumber.toString(),
                            style: TextStyle(color: Colors.black),
                          );
                        }),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => CartPage(),
                          ),
                        );
                      },
                      child: Image.asset(
                        'images/cart icon2.png',
                        height: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Image.asset(
              itemOfFood.pathOfImage,
              height: 300,
              width: 400,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 40,
              width: 130,
              decoration: BoxDecoration(
                color: Color(0xFFF0C143),
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Provider.of<MyProvider>(context, listen: false)
                            .decreaseAmountOfFood();
                      },
                      child: Icon(
                        Icons.remove,
                        size: 28,
                        color: Colors.grey[900],
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Consumer<MyProvider>(
                        builder: (context, numbersOfOrders, child) {
                      return Text(
                        numbersOfOrders.amountOfFood.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                          color: Colors.grey[900],
                        ),
                      );
                    }),
                    SizedBox(
                      width: 3,
                    ),
                    GestureDetector(
                      onTap: () {
                        Provider.of<MyProvider>(context, listen: false)
                            .increaseAmountOfFood();
                      },
                      child: Icon(
                        Icons.add,
                        size: 28,
                        color: Colors.grey[900],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 200,
                        child: Text(
                          itemOfFood.describeFood,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w600),
                        ),
                      ),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: '\$',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFF4D479),
                            ),
                          ),
                          TextSpan(
                            text: itemOfFood.price,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Row(
                    children: [
                      Text(
                        itemOfFood.stars,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        itemOfFood.calories,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        itemOfFood.time,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Details',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text(
                    itemOfFood.details,
                    style: TextStyle(fontSize: 16, color: Colors.grey[400]),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Ingredients',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      itemOfFood.ingredients,
                      style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[500]),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: Container(
        child: Consumer<MyProvider>(builder: (context, numbersOfOrders, child) {
          return FloatingActionButton(
            backgroundColor: Color(0xFFFFCC2E),
            onPressed: () {
              numbersOfOrders.increaseOrderNumber();
              numbersOfOrders.calculateTotalPrice(
                  numbersOfOrders.amountOfFood, double.parse(itemOfFood.price));
            },
            child: Container(
              child: Icon(
                Icons.add,
                size: 32,
                color: Colors.black,
              ),
            ),
            elevation: 7,
          );
        }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
