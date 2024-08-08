import 'package:flutter/material.dart';
import 'package:mansar_mobile/components/ongoing_goal.dart';
import 'dart:math';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'NestEgg',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
              child: const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/images/avatar.png'),
              ),
            ),
          ),
        ],
        leading: Builder(
          builder: (context) => IconButton(
            padding: const EdgeInsets.only(left: 20.0),
            icon: const Icon(
              Icons.menu,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                // Navigate to home screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Navigate to settings screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                // Logout functionality
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(alignment: Alignment.center, children: [
              Positioned(
                bottom: 0,
                left: 190,
                child: Text('&',
                    style: TextStyle(
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 2
                        ..color = Colors.white,
                    )),
              ),
              const Column(
                children: [
                  Row(children: [
                    Text(
                      'SAVE',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'MONEY',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(177, 220, 98, 1),
                      ),
                    ),
                  ]),
                  Row(children: [
                    Text(
                      'GET YOUR',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'DREAM',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(177, 220, 98, 1),
                      ),
                    ),
                  ]),
                ],
              )
            ]),

            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey[400],
                      ),
                      filled: true,
                      fillColor: Colors.grey[600],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                SizedBox(
                  height: 55,
                  width: 55,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(177, 220, 98, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.all(12),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Color.fromRGBO(18, 18, 18, 1),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Tab Section
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    TabBar(
                      labelColor: const Color.fromRGBO(177, 220, 98, 1),
                      unselectedLabelColor: Colors.grey[600],
                      indicator: const UnderlineTabIndicator(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(177, 220, 98, 1),
                          width: 2,
                        ),
                      ),
                      tabs: const [
                        Tab(
                          child: SizedBox(
                              width: 250,
                              child: Center(
                                  child: Text(
                                'Going on',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ))),
                        ),
                        Tab(
                          child: SizedBox(
                              width: 250,
                              child: Center(
                                  child: Text(
                                'Resolved',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ))),
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          ContainerList(tabName: 'Going on'),
                          ContainerList(tabName: 'Resolved'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerList extends StatelessWidget {
  final String tabName;

  ContainerList({super.key, required this.tabName});

  final List<Map<String, dynamic>> products = [
    {"name": "VGA NVIDIA RTX", "price": 799.99},
    {"name": "Laptop Asus Rog", "price": 1299.99},
    {"name": "Headphones WH-1000", "price": 149.99},
    {"name": "Microsoft Surface Pro", "price": 249.99},
    {"name": "Samsung T7 SSD 1TB", "price": 499.99},
    {"name": "LG UltraGear 27GN950-B", "price": 399.99},
    {"name": "Razer Huntsman Elite", "price": 99.99},
    {"name": "DJI Mavic Air 2", "price": 579.99},
    {"name": "Logitech G Pro X", "price": 299.99},
    {"name": "iRobot Roomba i7+", "price": 749.99}
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: ListView.builder(
        itemCount: 10, // Replace with your actual data count
        itemBuilder: (context, index) {
          // Select a random product
          final random = Random();
          final randomProductIndex = random.nextInt(products.length);
          final selectedProduct = products[randomProductIndex];

          // Generate a random collected amount below the goal amount
          final collectedAmount =
              random.nextDouble() * selectedProduct['price'];

          Color cardColor = index % 2 == 0
              ? const Color.fromRGBO(177, 220, 98, 1)
              : Colors.white;

          return OngoingGoal(
            goalName: selectedProduct['name'],
            goalTargetAmount: selectedProduct['price'],
            dailyTarget: 50.0,
            collectedAmount: tabName == "Resolved"
                ? selectedProduct["price"]
                : collectedAmount,
            cardColor: cardColor,
          );
        },
      ),
    );
  }
}
