import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScheduleScreen(),
    );
  }
}

class ScheduleScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  DateTime _selectedDate = DateTime.now();
  String _selectedTime = '';

  void _selectDateAndTime(BuildContext context, DateTime date, String time) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Selection"),
          content: Text("You selected:\nDate: ${date.toLocal()}\nTime: $time"),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                setState(() {
                  _selectedDate = date;
                  _selectedTime = time;
                });
                Navigator.of(context).pop();
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
          onPressed: () {
            // Navigate back or any other action
          },
        ),
        title: Text("Change"),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              // Navigate to profile page
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Calendar
            CalendarDatePicker(
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
              onDateChanged: (date) {
                // Handle date change
                setState(() {
                  _selectedDate = date;
                });
              },
            ),
            SizedBox(height: 16),
            // Time slots
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: [
                _buildTimeSlot(context, "06:00-07:00"),
                _buildTimeSlot(context, "07:00-08:00"),
                _buildTimeSlot(context, "08:00-09:00"),
                _buildTimeSlot(context, "09:00-10:00"),
                _buildTimeSlot(context, "10:00-11:00"),
                _buildTimeSlot(context, "11:00-12:00"),
                _buildTimeSlot(context, "12:00-13:00"),
                _buildTimeSlot(context, "13:00-14:00"),
                _buildTimeSlot(context, "14:00-15:00"),
                _buildTimeSlot(context, "15:00-16:00"),
                _buildTimeSlot(context, "16:00-17:00"),
                _buildTimeSlot(context, "17:00-18:00"),
                _buildTimeSlot(context, "18:00-19:00"),
                _buildTimeSlot(context, "19:00-20:00"),
                _buildTimeSlot(context, "20:00-21:00"),
                _buildTimeSlot(context, "21:00-22:00"),
                _buildTimeSlot(context, "22:00-23:00"),
                _buildTimeSlot(context, "23:00-00:00"),
              ],
            ),
            SizedBox(height: 16),
            // Continue button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.0), backgroundColor: const Color.fromARGB(255, 193, 184, 195), // Button color
                  textStyle: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  // Handle continue action
                },
                child: Center(
                  child: Text("Continue"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeSlot(BuildContext context, String time) {
    return GestureDetector(
      onTap: () {
        _selectDateAndTime(context, _selectedDate, time);
      },
      child: Chip(
        label: Text(time),
      ),
    );
  }
}
