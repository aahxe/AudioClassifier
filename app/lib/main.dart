import 'package:flutter/material.dart';

void main() {
  runApp(ChirpCheckerApp());
}

class ChirpCheckerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChirpChecker',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChirpCheckPage(username: 'Username123'),
    );
  }
}

class ChirpCheckPage extends StatelessWidget {
  final String username;

  ChirpCheckPage({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomPaint(
            size: Size(40, 40), // Size of the bird icon
            painter: BirdShapePainter(),
          ),
        ),
        title: Text('Chirp Check'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                username,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Implement Chirp Check functionality here
              },
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(50),
                backgroundColor: Colors.green[900], // Microphone button color
              ),
              child: Icon(
                Icons.mic,
                size: 50.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Chirp Check',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.green[900],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green[700],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.green[300],
        currentIndex: 1, // Chirp Check page is selected
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mic),
            label: 'Chirp Check',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Sticker Dashboard',
          ),
        ],
        onTap: (int index) {
          switch (index) {
            case 0:
              // Navigate to Profile Page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage(username: username)),
              );
              break;
            case 1:
              // Chirp Check Page (current page)
              break;
            case 2:
              // Navigate to Sticker Dashboard
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StickerDashboardPage(username: username)),
              );
              break;
          }
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green[700],
              ),
              child: Text(
                'ChirpChecker Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                // Implement logout functionality here
                Navigator.popUntil(context, (route) => route.isFirst);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BirdShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Draw bird body (circle)
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 20, paint);

    // Draw bird wing (curved shape)
    Path wingPath = Path();
    wingPath.moveTo(size.width / 2 - 15, size.height / 2 + 5);
    wingPath.quadraticBezierTo(
      size.width / 2,
      size.height / 2 - 15,
      size.width / 2 + 15,
      size.height / 2 + 5,
    );
    wingPath.lineTo(size.width / 2, size.height / 2 + 10);
    wingPath.close();
    canvas.drawPath(wingPath, paint);

    // Draw bird beak (small triangle, more realistic shape)
    Path beakPath = Path();
    beakPath.moveTo(size.width / 2 + 20, size.height / 2 - 3);
    beakPath.lineTo(size.width / 2 + 25, size.height / 2 - 5);
    beakPath.lineTo(size.width / 2 + 25, size.height / 2 + 5);
    beakPath.close();
    paint.color = Colors.orange;
    canvas.drawPath(beakPath, paint);

    // Draw bird eye (small circle with eye highlight)
    paint.color = Colors.black;
    canvas.drawCircle(Offset(size.width / 2 + 10, size.height / 2 - 5), 2, paint);

    paint.color = Colors.white;
    canvas.drawCircle(Offset(size.width / 2 + 11, size.height / 2 - 6), 1, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class ProfilePage extends StatelessWidget {
  final String username;

  ProfilePage({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.green[700],
      ),
      body: Center(
        child: Text('Profile Page Content for $username'),
      ),
    );
  }
}

class StickerDashboardPage extends StatelessWidget {
  final String username;

  StickerDashboardPage({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sticker Dashboard'),
        backgroundColor: Colors.green[700],
      ),
      body: Center(
        child: Text('Sticker Dashboard Content for $username'),
      ),
    );
  }
}
