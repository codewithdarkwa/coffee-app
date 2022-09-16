import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/menupage.dart';
import 'package:flutter_application_1/pages/offerspage.dart';
import 'package:flutter_application_1/pages/orderpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Coffee Masters',
        theme: ThemeData(
          primarySwatch: Colors.brown,
        ),
        home: const Home());
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget currentWidgetPage = const Text('!!!!');

    switch (selectedIndex) {
      case 0:
        currentWidgetPage = const MenuPage();
        break;
      case 1:
        currentWidgetPage = const OffersPage();
        break;
      case 2:
        currentWidgetPage = const OrderPage();
        break;
    }
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('images/logo.png'),
        centerTitle: true,
      ),
      body: currentWidgetPage,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Colors.yellow.shade400,
          unselectedItemColor: Colors.brown.shade50,
          items: const [
            BottomNavigationBarItem(label: "Menu", icon: Icon(Icons.coffee)),
            BottomNavigationBarItem(
                label: "Offers", icon: Icon(Icons.local_offer)),
            BottomNavigationBarItem(
                label: "My Order",
                icon: Icon(Icons.shopping_cart_checkout_outlined)),
          ]),
    );
  }
}
