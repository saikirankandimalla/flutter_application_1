import 'package:flutter/material.dart';
import 'package:flutter_application_1/booking.dart';
import 'package:url_launcher/url_launcher.dart';  // Add this line

void main() {
  runApp(MaterialApp(
    home: PaymentScreen(),
  ));
}

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool showUPI = false;
  bool showCardDetails = false;

  final String amount = '550'; // Your payment amount

  Future<void> _launchGooglePay() async {
    const url = 'upi://pay?pa=your-upi-id@bank&pn=Your Name&am=550'; // UPI URL for Google Pay
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch Google Pay';
    }
  }

  Future<void> _launchPhonePe() async {
    const url = 'phonepe://pay?pa=your-upi-id@bank&pn=Your Name&am=550'; // UPI URL for PhonePe
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch PhonePe';
    }
  }

  void _showCaseOnWorkAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Worker Confirmed"),
          content: Text("Your worker is confirmed and will start working soon."),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookingPage()),
                );
            // Handle back action
          },
        ),
        title: Text('Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Phone number: 9347834548',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage('lib/asset/images/cleanwork.png'), // Add your image URL
              ),
              title: Text('User ID: C045'),
              subtitle: Text('Rating: 4.5\nSkincare Treatments'),
            ),
            Divider(),
            Text('Estimated time: 20 min'),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.location_on),
                SizedBox(width: 5),
                Expanded(
                  child: Text(
                    'khammam/telangana/507123\nsriramnagar/house number1-21/B',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Handle edit location
                  },
                )
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Amount Payable'),
                Text('550₹', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Image.asset('lib/asset/images/googlepay.png', width: 40, height: 40),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: _launchGooglePay,
                  child: Text('Google Pay', style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Image.asset('lib/asset/images/phonepe.png', width: 40, height: 40),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: _launchPhonePe,
                  child: Text('PhonePe', style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
            ListTile(
              title: Text('UPI', style: TextStyle(fontSize: 18)),
              trailing: IconButton(
                icon: Icon(showUPI ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
                onPressed: () {
                  setState(() {
                    showUPI = !showUPI;
                  });
                },
              ),
            ),
            if (showUPI)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Enter UPI ID',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Handle UPI payment
                      },
                      child: Text('Pay'),
                    ),
                  ],
                ),
              ),
            ListTile(
              title: Text('Credit or Debit Card', style: TextStyle(fontSize: 18)),
              trailing: IconButton(
                icon: Icon(showCardDetails ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
                onPressed: () {
                  setState(() {
                    showCardDetails = !showCardDetails;
                  });
                },
              ),
            ),
            if (showCardDetails)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Card Number',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Name on Card',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'MM/YY',
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.datetime,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'CVV',
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Handle Card payment
                      },
                      child: Text('Make Payment'),
                    ),
                  ],
                ),
              ),
            ListTile(
              title: Text('Cash on Work', style: TextStyle(fontSize: 18)),
              trailing: Icon(Icons.work),
              onTap: _showCaseOnWorkAlert,
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Handle confirm action
              },
              child: Text('Confirm'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
