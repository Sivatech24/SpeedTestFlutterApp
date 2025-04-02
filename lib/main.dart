import 'package:flutter/material.dart';

void main() {
  runApp(SpeedTestApp());
}

class SpeedTestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    SpeedTestScreen(),
    AboutScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SpeedTestScreen()),
          );
        },
        child: Icon(Icons.speed),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class SpeedTestScreen extends StatefulWidget {
  @override
  _SpeedTestScreenState createState() => _SpeedTestScreenState();
}

class _SpeedTestScreenState extends State<SpeedTestScreen> {
  double downloadSpeed = 0.0;
  double uploadSpeed = 0.0;
  String progressText = "Press Start to Begin";

  void startSpeedTest() async {
    setState(() {
      progressText = "Testing Download Speed...";
    });

    // Simulate a speed test with dummy values
    await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        downloadSpeed = 50.0; // Dummy download speed
        progressText = "Testing Upload Speed...";
      });
    });

    await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        uploadSpeed = 20.0; // Dummy upload speed
        progressText = "Test Complete!";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Speed Test App")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                progressText,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                "Download: ${downloadSpeed.toStringAsFixed(2)} Mbps",
                style: TextStyle(fontSize: 18, color: Colors.blue),
              ),
              Text(
                "Upload: ${uploadSpeed.toStringAsFixed(2)} Mbps",
                style: TextStyle(fontSize: 18, color: Colors.green),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: startSpeedTest,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text("Start Test"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Speed Test App",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                "This app allows you to test your internet speed.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}