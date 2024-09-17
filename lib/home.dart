import 'package:flutter/material.dart';
import 'package:flutter_application_1/Notifications.dart'; // Ensure you have this screen.
import 'package:flutter_application_1/orders.dart';
import 'package:flutter_application_1/payment.dart';
import 'package:flutter_application_1/personalcare.dart'; // Ensure you have this screen.
import 'package:flutter_application_1/setting.dart'; // Ensure you have this screen.
import 'package:flutter_application_1/services_page.dart'; // Import your services page.

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<ServiceCategory> categories = [
    ServiceCategory('Personal and Home Care Services', 'lib/asset/images/per.png'),
    ServiceCategory('Mobile Phone Services', 'lib/asset/images/phone.png'),
    ServiceCategory('Food and Dining Services', 'lib/asset/images/per.png'),
    ServiceCategory('Health and Wellness Services', 'lib/asset/images/per.png'),
    ServiceCategory('Education and Development Services', 'lib/asset/images/per.png'),
    ServiceCategory('Transportation Services', 'lib/asset/images/transportation.png'),
    ServiceCategory('Miscellaneous Services', 'lib/asset/images/per.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('FIXER'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationScreen()),
              );
            },
          
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Setting()),
              );
            },
            child: CircleAvatar(
              backgroundImage: AssetImage('lib/asset/images/logo.png'), // Replace with actual profile image
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search for service categories/services',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          ...categories.map((category) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CategoryCard(category: category),
              )),
          Container(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildCategoryTab("Home Services", const Color.fromARGB(255, 6, 5, 6)),
                _buildCategoryTab("Personal Services", Colors.purple),
                _buildCategoryTab("Security Services", Color.fromARGB(255, 184, 97, 199)),
                _buildCategoryTab("Home Services", Colors.purple),
                _buildCategoryTab("Personal Services", Colors.purple),
                _buildCategoryTab("Security Services", Color.fromARGB(255, 186, 88, 203)),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.ad_units_rounded), label: 'Order'),
        ],
        currentIndex: 0,
        onTap: (index) {
          // Handle navigation based on the selected tab
          if (index == 0) {
            // Stay on the Home screen
          } else if (index == 1) {
            // Navigate to Favorites screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PaymentScreen()), // Replace with your Favorite screen
            );
          } else if (index == 2) {
            // Navigate to Orders screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyOrdersScreen()),
            );
          }
        },
      ),
    );
  }

  // Define _buildCategoryTab here
  Widget _buildCategoryTab(String label, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Chip(
        label: Text(label, style: TextStyle(color: Colors.white)),
        backgroundColor: color,
      ),
    );
  }
}

class ServiceCategory {
  final String title;
  final String image;

  ServiceCategory(this.title, this.image);
}

class CategoryCard extends StatelessWidget {
  final ServiceCategory category;

  CategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to Services page when the entire card is clicked
        if (category.title == 'Personal and Home Care Services') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ServiceCategoriesScreen()),
          );
        }
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                // Navigate to Services page when the image is clicked
                if (category.title == 'Personal and Home Care Services') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ServiceCategoriesScreen()),
                  );
                }
              },
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.asset(
                  category.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 150,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () {
                  // Navigate to Services page when the text is clicked
                  if (category.title == 'Personal and Home Care Services') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ServiceCategoriesScreen()),
                    );
                  }
                },
                child: Text(
                  category.title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// MyOrdersScreen with bottom navigation
