import 'package:flutter/material.dart';
import 'package:flutter_application_1/date.dart';
import 'package:flutter_application_1/payment.dart';
import 'package:flutter_application_1/setting.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BookingPage(),
    );
  }
}

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  bool showReviews = false; // To toggle review visibility
  String selectedService = 'FACE'; // Default selected service
  int totalPrice = 250; // Default price for FACE

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Booking',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('lib/asset/images/cleanwork.png'), // Replace with actual service image
                    radius: 40,
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('USER.ID : 0345',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('Rating : 4.3'),
                        Text('Skincare Treatments'),
                        Text('Personal Services'),
                        Text('Phone number: 9347834548'),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ScheduleScreen()),
              );},
                    child: Text('Change'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildDateTimeSelector('DATE', '10/04/2025'),
                  _buildDateTimeSelector('TIME', '10:20 AM'),
                ],
              ),
              SizedBox(height: 20),
              _buildServiceOption('FULL BODY', 500),
              _buildServiceOption('FACE', 250),
              Divider(),
              _buildTotalRow(),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentScreen()),
                );},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colors.black),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                  child: Text(
                    'Continue',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'reviews',
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(showReviews
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down),
                    onPressed: () {
                      setState(() {
                        showReviews = !showReviews;
                      });
                    },
                  ),
                ],
              ),
              if (showReviews) _buildReview(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateTimeSelector(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 16)),
        SizedBox(height: 5),
        Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildServiceOption(String serviceName, int price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Radio(
              value: serviceName,
              groupValue: selectedService,
              onChanged: (value) {
                setState(() {
                  selectedService = value as String;
                  totalPrice = price; // Update total price based on selected service
                });
              },
            ),
            Text(serviceName),
          ],
        ),
        Text('${price}₹', style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildTotalRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Total', style: TextStyle(fontWeight: FontWeight.bold)),
        Text('${totalPrice}₹', style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildReview() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('lib/asset/images/logo.png'), // Replace with actual reviewer image
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('shivakiran93@gmail.com',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Row(
                  children: List.generate(4, (index) {
                    return Icon(Icons.star, color: Colors.yellow, size: 18);
                  })
                    ..add(Icon(Icons.star_border, size: 18)),
                ),
                SizedBox(height: 5),
                Text(
                  'I recently had my house cleaned by Lokesh, and I couldn\'t be more satisfied with the results. He was thorough, efficient, and paid attention to every detail. My home feels refreshed and spotless, and I appreciate the care and professionalism Lokesh brought to the job. Highly recommend his services for anyone in need of top-notch cleaning!',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

