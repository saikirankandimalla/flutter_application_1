import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Add this package in pubspec.yaml
import 'dart:io';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Controllers for text fields
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController secondNumberController = TextEditingController();

  // Variables to hold selected gender and marital status
  String? selectedGender;
  String? maritalStatus;

  // Variables to hold data until saved
  String? savedMobile;
  String? savedEmail;
  String? savedPassword;
  String? savedName;
  String? savedBirthday;
  String? savedGender;
  String? savedMaritalStatus;
  String? savedSecondNumber;

  File? _imageFile;
  File? _savedImageFile; // Holds the saved image

  // Function to show an alert dialog to save changes
  void _showSaveAlertDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Save Changes"),
        content: Text("Do you want to save the changes?"),
        actions: [
          TextButton(
            onPressed: () {
              // Save data
              setState(() {
                savedMobile = mobileController.text;
                savedEmail = emailController.text;
                savedPassword = passwordController.text;
                savedName = nameController.text;
                savedBirthday = birthdayController.text;
                savedGender = selectedGender;
                savedMaritalStatus = maritalStatus;
                savedSecondNumber = secondNumberController.text;
                _savedImageFile = _imageFile; // Save the image
              });
              Navigator.of(context).pop();
            },
            child: Text("Yes"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("No"),
          ),
        ],
      ),
    );
  }

  // Function to pick an image from gallery or camera
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  // Function to show the bottom sheet for camera and gallery options
  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.camera),
              title: Text("Camera"),
              onTap: () {
                Navigator.of(context).pop();
                _pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_album),
              title: Text("Gallery"),
              onTap: () {
                Navigator.of(context).pop();
                _pickImage(ImageSource.gallery);
              },
            ),
          ],
        );
      },
    );
  }

  // Function to pick a date using a date picker
  Future<void> _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        birthdayController.text = "${pickedDate.toLocal()}".split(' ')[0]; // Format date
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // Load saved data
    mobileController.text = savedMobile ?? '';
    emailController.text = savedEmail ?? '';
    passwordController.text = savedPassword ?? '';
    nameController.text = savedName ?? '';
    birthdayController.text = savedBirthday ?? '';
    selectedGender = savedGender;
    maritalStatus = savedMaritalStatus;
    secondNumberController.text = savedSecondNumber ?? '';
    _imageFile = _savedImageFile;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: _imageFile != null ? FileImage(_imageFile!) : null,
              child: _imageFile == null ? Icon(Icons.person, size: 40) : null,
            ),
            SizedBox(height: 8),
            TextButton(
              onPressed: _showBottomSheet, // Show bottom sheet when clicked
              child: Text("Change", style: TextStyle(color: Colors.black)),
            ),
            TextField(
              controller: mobileController,
              decoration: InputDecoration(labelText: 'Mobile Number'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email Address'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Personal Details (Optional)',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            TextField(
              controller: birthdayController,
              readOnly: true,
              onTap: _pickDate, // Show DatePicker on tap
              decoration: InputDecoration(
                labelText: 'Birthday',
                suffixIcon: Icon(Icons.calendar_today),
              ),
            ),
            DropdownButtonFormField<String>(
              value: selectedGender,
              items: ['Male', 'Female', 'Other'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedGender = newValue;
                });
              },
              decoration: InputDecoration(labelText: 'Gender'),
            ),
            DropdownButtonFormField<String>(
              value: maritalStatus,
              items: ['Married', 'Unmarried'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  maritalStatus = newValue;
                });
              },
              decoration: InputDecoration(labelText: 'Marital Status'),
            ),
            TextField(
              controller: secondNumberController,
              decoration: InputDecoration(labelText: 'Second Number'),
            ),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  _showSaveAlertDialog(); // Show alert and save if confirmed
                },
                child: Text("Edit", style: TextStyle(color: Colors.black)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
