import 'package:everyday_mart/Pages/CustomerHomePage/CustomerHomePage.dart';
import 'package:everyday_mart/Pages/StoreOwnerHomePage/StoreHomePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Everyday Mart",
      home: CustomerHomePage(),
    );
  }
}
