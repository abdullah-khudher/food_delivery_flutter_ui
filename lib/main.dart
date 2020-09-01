import 'package:flutter/material.dart';
import 'package:food_delivery_flutter_ui/provider/my_provider.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => MyProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food delivery',
      home: HomePage(),
    );
  }
}
