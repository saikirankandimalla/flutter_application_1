import 'package:flutter/material.dart';
import 'package:flutter_application_1/Permission.dart';
import 'package:flutter_application_1/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation UI',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Setting(),
    );
  }
}

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('profile setting'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage("lib/asset/images/on1.png"), // Replace with your image link
            ),
            
            
            SizedBox(height: 20),
            IconButton(
              icon: Icon(Icons.edit, color: Colors.black),
              onPressed: () { Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
                // Handle profile editing logic
              },
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.black),
              title: Text('SETTING'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.payment, color: Colors.black),
              title: Text('payment'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.book_online, color: Colors.black),
              title: Text('Bookings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookingsPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.feedback, color: Colors.black),
              title: Text('Feedback'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FeedbackPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.support_agent, color: Colors.black),
              title: Text('customer care'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CustomerCarePage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}



class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Page'),
      ),
      body: Center(
        child: Text('Payment Page'),
      ),
    );
  }
}

class BookingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookings Page'),
      ),
      body: Center(
        child: Text('Bookings Page'),
      ),
    );
  }
}

class FeedbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback Page'),
      ),
      body: Center(
        child: Text('Feedback Page'),
      ),
    );
  }
}

class CustomerCarePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Care Page'),
      ),
      body: Center(
        child: Text('Customer Care Page'),
      ),
    );
  }
}
