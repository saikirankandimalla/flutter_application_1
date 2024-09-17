import 'package:flutter/material.dart';
import 'package:flutter_application_1/personalcare.dart';
import 'package:flutter_application_1/personalwork.dart';
import 'package:flutter_application_1/setting.dart';

void main() {
  runApp(PersonalServicesApp());
}

class PersonalServicesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PersonalServicesScreen(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    );
  }
}

class PersonalServicesScreen extends StatelessWidget {
  // Services list
  final List<ServiceItem> services = [
    ServiceItem('Personal Care', 'lib/asset/images/on1.png'),
    ServiceItem('Skincare Treatments', 'lib/asset/images/on1.png'),
    ServiceItem('Haircutting and Styling', 'lib/asset/images/on1.png'),
    ServiceItem('Massage Therapy', 'lib/asset/images/on1.png'),
    ServiceItem('Personal Training', 'lib/asset/images/on1.png'),
    ServiceItem('Meditation Coaching', 'lib/assets/images/meditation.png'),
    ServiceItem('Life Coaching', 'lib/assets/images/life_coaching.png'),
    ServiceItem('Weight Loss Coaching', 'lib/assets/images/weight_loss.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Services', style: TextStyle(fontSize: 24)),
        backgroundColor: Color.fromARGB(255, 238, 234, 234),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Implement navigation to the previous page
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Implement navigation to the notifications page
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
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
           Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 3 / 4,
              ),
                // Instead of categories, use services as it is already initialized
                itemCount: services.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => onCategoryTap(context, services[index].title),
                    child: ServiceCategoryCard(
                      name: services[index].title,
                      image: services[index].image,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onCategoryTap(BuildContext context, String category) {
    // Handle the category tap action
  }
}

class ServiceItem {
  final String title;
  final String image;

  ServiceItem(this.title, this.image);
}

class ServiceCategoryCard extends StatelessWidget {
  final String name;
  final String image;

  ServiceCategoryCard({required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              height: 100,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
