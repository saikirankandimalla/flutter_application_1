import 'package:flutter/material.dart';

void main() {
  runApp(MyOrdersApp());
}

class MyOrdersApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyOrdersScreen(),
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 227, 225, 228),
      ),
    );
  }
}

class MyOrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders', style: TextStyle(fontSize: 24)),
        backgroundColor: const Color.fromARGB(255, 240, 238, 238),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Phone number: 9347834548',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('lib/asset/images/on1.png'), // Replace with actual image asset path
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'USER.ID : 0345',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Rating : 4.3',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Skincare Treatments',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    showAlertDialog(context, 'Success', 'Your order is canceled.');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: Text('cancel', style: TextStyle(fontSize: 16),selectionColor: Color.fromARGB(240, 225, 225, 226),),
                ),
              ],
            ),
            Divider(color: Colors.grey, thickness: 1,),
            buildOrderItem(context, 'Cleaning and Maintenance Services', '9347834549'),
            buildOrderItem(context, 'Skincare Treatments', '9347834549'),
            buildOrderItem(context, 'Cleaning and Maintenance Services', '9347834549'),
            buildOrderItem(context, 'Skincare Treatments', '9347834549'),
          ],
        ),
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
              MaterialPageRoute(builder: (context) => MyOrdersScreen()), // Replace with your Favorite screen
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
    
  }

  Widget buildOrderItem(BuildContext context, String serviceTitle, String phoneNumber) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('lib/asset/images/on1.png'), // Replace with actual image asset path
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                serviceTitle,
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
              Text(
                'Phone Number: $phoneNumber',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () {
              showAlertDialog(context, 'Success', 'Your order is confirmed.');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            child: Text('Re Services', style: TextStyle(fontSize: 14)),
          ),
        ],
      ),
    );
  }
  

  void showAlertDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

