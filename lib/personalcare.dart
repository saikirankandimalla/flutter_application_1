import 'package:flutter/material.dart';
import 'package:flutter_application_1/category.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/setting.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ServiceCategoriesScreen(),
    );
  }
}

class ServiceCategoriesScreen extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {'name': 'Personal Services', 'image': 'lib/asset/images/on1.png'},
    {'name': 'Cleaning and Maintenance', 'image': 'lib/asset/images/clean.png'},
    {'name': 'Repairs and Handyman', 'image': 'lib/asset/images/handyman.png'},
    {'name': 'Security Services', 'image': 'assets/images/security_services.png'},
    {'name': 'Personal Fixer', 'image': 'lib/asset/images/fixer.png'},
    {'name': 'Childcare and Elder Care', 'image': 'lib/asset/images/child.png'},
  ];

  void onCategoryTap(BuildContext context, String categoryName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PersonalServicesApp()
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
          },
        ),
        title: Text('Service Categories'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for service categories...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 3 / 4,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => onCategoryTap(context, categories[index]['name']!),
                  child: ServiceCategoryCard(
                    name: categories[index]['name']!,
                    image: categories[index]['image']!,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ServiceCategoryCard extends StatelessWidget {
  final String name;
  final String image;

  const ServiceCategoryCard({
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black26),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              color: Colors.black.withOpacity(0.6),
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// New screen that shows the details for the selected category
