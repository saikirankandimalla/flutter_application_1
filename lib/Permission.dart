import 'package:flutter/material.dart';
import 'package:flutter_application_1/setting.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SettingsScreen(),
    );
  }
}

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool allowNotification = false;
  bool permissionToggle = false;
  bool batteryUsageToggle = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SETTING", style: TextStyle(letterSpacing: 2)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Setting()),
                );
            // Logic to go back
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SwitchListTile(
              title: Text("allow notification", style: TextStyle(fontSize: 18)),
              value: allowNotification,
              onChanged: (bool value) {
                setState(() {
                  allowNotification = value;
                });
              },
            ),
            Divider(),
            SwitchListTile(
              title: Text("permission", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              value: permissionToggle,
              onChanged: (bool value) {
                setState(() {
                  permissionToggle = value;
                });
              },
            ),
            if (permissionToggle)
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("CAMERA", style: TextStyle(fontSize: 16)),
                    SizedBox(height: 8),
                    Text("LOCATION", style: TextStyle(fontSize: 16)),
                    SizedBox(height: 8),
                    Text("PHONE", style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            Divider(),
            Text("NEARBY DEVICES", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Divider(),
            SwitchListTile(
              title: Text("BATTERY USAGE", style: TextStyle(fontSize: 18)),
              value: batteryUsageToggle,
              onChanged: (bool value) {
                setState(() {
                  batteryUsageToggle = value;
                });
              },
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("storage usage", style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic)),
                  Text("130MB", style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
