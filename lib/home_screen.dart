import 'package:flutter/material.dart';
import 'package:food_delivery_flutter_ui/product_screen.dart';
import 'package:food_delivery_flutter_ui/provider/my_provider.dart';
import 'package:provider/provider.dart';

import 'model/product_model.dart';

class HomePage extends StatelessWidget {
  final List<String> listOfMenu = [
    '🍔 Foot food',
    '🍅 Fruit item',
    '🥒 vegetables item'
  ];
  final List<FoodProduct> listOfFood = [
    FoodProduct(
        nameOfFood: 'Egg Pasta',
        describeFood: 'spicy chicken pasta',
        calories: '🔥 78 calories',
        pathOfImage: 'images/2.png',
        price: '6.99',
        details:
            'chicken Dimsum Recipe is the delicious evening snack during the winters and monsoons',
        ingredients: '🥩     🍅     🥕     🍆',
        time: '⏰ 30-40 min',
        stars: '⭐ 4.5'),
    FoodProduct(
        nameOfFood: 'chicken Dimsum',
        describeFood: 'Spicy chicken Dimsum',
        calories: '🔥 65 calories',
        pathOfImage: 'images/1.png',
        price: '6.99',
        details:
            'chicken Dimsum Recipe is the delicious evening snack during the winters and monsoons',
        ingredients: '🥩     🍅     🥕     🍆',
        time: '⏰ 20-30 min',
        stars: '⭐ 2.6'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Food Delivery',
          style: TextStyle(
              color: Colors.black87, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            padding: const EdgeInsets.only(left: 18),
            icon: Image.asset('images/more icon.png'),
            onPressed: null),
        actions: [
          Container(
            height: 40,
            width: 50,
            decoration: BoxDecoration(
                color: Color(0xFFF0C143),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                )),
            child: Stack(
              children: [
                Positioned(
                    bottom: 3,
                    right: 5,
                    child: GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        'images/profile icon.png',
                        height: 40,
                        width: 40,
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(0xFFFAF9FA),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 32.0, top: 32),
              child: Text(
                'Let\'s eat \nQuality food 😋',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32.0, top: 32, right: 32),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Color(0xFFFCFBFC),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.search,
                              size: 34,
                            ),
                          ),
                          Expanded(
                              child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search food..',
                              hintStyle: TextStyle(
                                  fontSize: 14, color: Colors.grey[600]),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                            ),
                          )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Color(0xFFFFCC2E),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset('images/search icon.png'),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32.0, top: 32),
              child: Container(
                height: 65,
                child: ListView.builder(
                    itemCount: listOfMenu.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, i) {
                      return Consumer<MyProvider>(
                          builder: (context, numbersOfOrders, child) {
                        return GestureDetector(
                          onTap: () {
                            numbersOfOrders.setSelectedIndex(i);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFFFFCC2E),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    offset: Offset(0, 0),
                                  )
                                ],
                                color:
                                    numbersOfOrders.selectedIndexOfMenuList !=
                                                null &&
                                            numbersOfOrders
                                                    .selectedIndexOfMenuList ==
                                                i
                                        ? Color(0xFFFFCC2E)
                                        : Colors.white,
                                border: Border.all(
                                  color: Color(0xFFFFCC2E),
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    listOfMenu[i],
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                    }),
              ),
            ),
            Container(
              height: 400,
              child: ListView.builder(
                  itemCount: listOfFood.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ProductPage(listOfFood[i]),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 250,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  listOfFood[i].pathOfImage,
                                  height: 200,
                                  width: 200,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  listOfFood[i].nameOfFood,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  listOfFood[i].describeFood,
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  listOfFood[i].calories,
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.red),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                    text: '\$',
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: Color(0xFFF4D479),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: listOfFood[i].price,
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ]))
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Consumer<MyProvider>(
                builder: (context, numbersOfOrders, child) {
              return IconButton(
                  icon: Icon(
                    Icons.home,
                    size: 32,
                    color: numbersOfOrders.selectedBNBItem == 0
                        ? Color(0xFFFFCC2E)
                        : Colors.grey[500],
                  ),
                  onPressed: () {
                    numbersOfOrders.bnBItem(0);
                  });
            })),
            Expanded(child: Consumer<MyProvider>(
                builder: (context, numbersOfOrders, child) {
              return IconButton(
                  icon: Icon(
                    Icons.airport_shuttle,
                    size: 32,
                    color: numbersOfOrders.selectedBNBItem == 1
                        ? Color(0xFFFFCC2E)
                        : Colors.grey[500],
                  ),
                  onPressed: () {
                    numbersOfOrders.bnBItem(1);
                  });
            })),
            Expanded(child: Text('')),
            Expanded(child: Consumer<MyProvider>(
                builder: (context, numbersOfOrders, child) {
              return IconButton(
                  icon: Icon(
                    Icons.bookmark_border,
                    size: 32,
                    color: numbersOfOrders.selectedBNBItem == 2
                        ? Color(0xFFFFCC2E)
                        : Colors.grey[500],
                  ),
                  onPressed: () {
                    numbersOfOrders.bnBItem(2);
                  });
            })),
            Expanded(
              child: Consumer<MyProvider>(
                builder: (context, numbersOfOrders, child) {
                  return IconButton(
                      icon: Icon(
                        Icons.alarm,
                        size: 32,
                        color: numbersOfOrders.selectedBNBItem == 3
                            ? Color(0xFFFFCC2E)
                            : Colors.grey[500],
                      ),
                      onPressed: () {
                        numbersOfOrders.bnBItem(3);
                      });
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 80,
        width: 60,
        child: Stack(
          children: [
            Positioned(
              bottom: 15,
              left: 2,
              child: FloatingActionButton(
                backgroundColor: Color(0xFFFFCC2E),
                onPressed: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => CartPage(),
                  //   ),
                  // );
                },
                tooltip: 'increment',
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ),
                elevation: 5,
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 4),
                    color: Color(0xFFFFCC2E),
                    shape: BoxShape.circle),
                child: Consumer<MyProvider>(
                    builder: (context, numbersOfOrders, child) {
                  return Center(
                    child: Text(numbersOfOrders.ordersNumber.toString()),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
