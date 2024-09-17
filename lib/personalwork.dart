import 'package:flutter/material.dart';
import 'package:flutter_application_1/Notifications.dart';
import 'package:flutter_application_1/booking.dart';
import 'package:flutter_application_1/setting.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ServiceProvidersScreen(),
    );
  }
}

class ServiceProvidersScreen extends StatefulWidget {
  @override
  _ServiceProvidersScreenState createState() => _ServiceProvidersScreenState();
}

class _ServiceProvidersScreenState extends State<ServiceProvidersScreen> {
  final List<Map<String, dynamic>> providers = [
    {
      'name': 'Monika',
      'image': 'lib/asset/images/cleanwork.png',
      'status': 'online',
      'isFavorite': false
    },
    {
      'name': 'Siri',
      'image': 'lib/asset/images/on1.png',
      'status': 'online',
      'isFavorite': false
    },
    {
      'name': 'Navya',
      'image': 'lib/asset/images/cleanwork.png',
      'status': 'online',
      'isFavorite': false
    },
    {
      'name': 'Provider 4',
      'image': 'lib/asset/images/on1.png',
      'status': 'offline',
      'isFavorite': false
    },
    {
      'name': 'Provider 5',
      'image': 'lib/asset/images/cleanwork.png',
      'status': 'online',
      'isFavorite': false
    },
    {
      'name': 'Provider 6',
      'image': 'lib/asset/images/on1.png',
      'status': 'offline',
      'isFavorite': false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () { Navigator.pop(context); },
        ),
        title: Text('Service Providers'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationScreen()),
              );},
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
                hintText: 'Search for service categories, services...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                ChoiceChip(
                  label: Text('Man'),
                  selected: false,
                  onSelected: (selected) {},
                ),
                SizedBox(width: 8),
                ChoiceChip(
                  label: Text('Woman'),
                  selected: true,
                  onSelected: (selected) {},
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.person_outline),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Available',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
              itemCount: providers.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookingPage(
                          //providerName: providers[index]['name'],
                          //providerImage: providers[index]['image'],
                        ),
                      ),
                    );
                  },
                  child: ServiceProviderCard(
                    name: providers[index]['name'],
                    image: providers[index]['image'],
                    status: providers[index]['status'],
                    isFavorite: providers[index]['isFavorite'],
                    onFavoriteToggle: () {
                      setState(() {
                        providers[index]['isFavorite'] = !providers[index]['isFavorite'];
                      });
                    },
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

class ServiceProviderCard extends StatelessWidget {
  final String name;
  final String image;
  final String status;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const ServiceProviderCard({
    required this.name,
    required this.image,
    required this.status,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.black26),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 8,
              left: 8,
              child: CircleAvatar(
                backgroundColor: status == 'online' ? Colors.green : Colors.black,
                radius: 8,
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.grey,
                ),
                onPressed: onFavoriteToggle,
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookingPage(
                 // providerName: name,
                 // providerImage: image,
                ),
              ),
            );
          },
          child: Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 4),
        Text(status, style: TextStyle(color: status == 'online' ? Colors.green : Colors.black)),
      ],
    );
  }
}

