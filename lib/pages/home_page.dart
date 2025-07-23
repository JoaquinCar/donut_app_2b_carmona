import 'package:flutter/material.dart';
import 'package:donut_app_2b_carmona/pages/supermarket_page.dart';
import 'package:donut_app_2b_carmona/tabs/burger_tab.dart';
import 'package:donut_app_2b_carmona/tabs/donut_tab.dart';
import 'package:donut_app_2b_carmona/tabs/pancakes_tab.dart';
import 'package:donut_app_2b_carmona/tabs/pizza_tab.dart';
import 'package:donut_app_2b_carmona/tabs/smoothie_tab.dart';
import 'package:donut_app_2b_carmona/utils/my_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> myTabs = [
    MyTab(IconPath: 'lib/icons/donut.png'),
    MyTab(IconPath: 'lib/icons/burger.png'),
    MyTab(IconPath: 'lib/icons/smoothie.png'),
    MyTab(IconPath: 'lib/icons/pancakes.png'),
    MyTab(IconPath: 'lib/icons/pizza.png'),
  ];

  // Cart state
  List<Map<String, dynamic>> cartItems = [];
  double totalPrice = 0.0;

  // Function to add items to the cart
  void addToCart(String name, double price) {
    setState(() {
      cartItems.add({"name": name, "price": price});
      totalPrice += price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        // Drawer for navigation
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 218, 113, 148),
                ),
                child: Text(
                  'Menu',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.store),
                title: const Text('SuperMarket'),
                onTap: () {
                  Navigator.pop(context); // Close drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SuperMarketPage()),
                  );
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.grey[800]),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 24.0),
              child: Icon(Icons.person),
            )
          ],
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 36, vertical: 18),
              child: Row(
                children: [
                  Text(
                    "I want to ",
                    style: TextStyle(fontSize: 32),
                  ),
                  Text(
                    "Eat",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  )
                ],
              ),
            ),
            TabBar(tabs: myTabs),
            Expanded(
              child: TabBarView(
                children: [
                  DonutTab(addToCart: addToCart),
                  BurgerTab(addToCart: addToCart),
                  SmoothieTab(addToCart: addToCart),
                  PancakesTab(addToCart: addToCart),
                  PizzaTab(addToCart: addToCart),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 28),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${cartItems.length} Items | \$${totalPrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'Delivery Charges Included',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle cart view
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                        const Color.fromARGB(255, 218, 113, 148),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12)),
                    child: const Text(
                      'View Cart',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}