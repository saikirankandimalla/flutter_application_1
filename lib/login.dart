import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/onbording.dart';
import 'package:flutter_application_1/sign.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SwipeToLoginPage(),
    );
  }
}

class SwipeToLoginPage extends StatefulWidget {
  @override
  _SwipeToLoginPageState createState() => _SwipeToLoginPageState();
}

class _SwipeToLoginPageState extends State<SwipeToLoginPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  bool _showLoginForm = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    _offsetAnimation = Tween<Offset>(
      begin: Offset(0.0, 0.0),
      end: Offset(0.0, 0.2),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onSwipeUp() {
    setState(() {
      _showLoginForm = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onVerticalDragEnd: (details) {
          if (details.primaryVelocity! < 0) {
            _onSwipeUp();
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo and text
              Image.asset(
                'lib/asset/images/logo.png', // Add your logo image here
                height: 100,
              ),
              SizedBox(height: 10),
              Text(
                'FIXER',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 28),

              // Swipe up animation
              if (!_showLoginForm)
                SlideTransition(
                  position: _offsetAnimation,
                  child: Column(
                    children: [
                      Icon(Icons.keyboard_arrow_up, color: Colors.white, size: 60),
                      Icon(Icons.keyboard_arrow_up, color: Colors.white, size: 60),
                      Icon(Icons.keyboard_arrow_up, color: Colors.white, size: 60),
                    ],
                  ),
                ),

              // Login Form
              if (_showLoginForm)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 28, vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'WELCOME TO FIXER',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          hintText: 'Email ID',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          hintText: 'Password',
                          suffixIcon: Icon(Icons.visibility_off),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                            Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()),
                );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black, // Button color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                            Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()),
                );
                        },
                        child: Text(
                          "Don't have an account? Sign up",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
