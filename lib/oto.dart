import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/sign.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VerificationScreen(),
      debugShowCheckedModeBanner: false, // Removes the debug banner
    );
  }
}

class VerificationScreen extends StatelessWidget {
  final TextEditingController _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()),
                );
            // Action to go back
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 100,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Main text
            Text(
              'Enter code sent to your mobile number.',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            // Subtext
            Text(
              'We sent you a confirmation code to your mobile number for sign up.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 40),
            // TextField for entering code
            TextField(
              controller: _codeController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly, // Only allows digits
                LengthLimitingTextInputFormatter(6), // Limits input to 6 digits
              ],
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 176, 166, 166), // Light grey background color
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 16),
                hintText: 'Enter Code',
                hintStyle: TextStyle(
                  color: Colors.black26,
                  fontSize: 20,
                ),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            // Resend button
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Action to resend code
                },
                child: Text(
                  'Resend',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            // Continue button
            Center(
              child: ElevatedButton(
                onPressed: () {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
                  // Action to continue
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Black background color
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
