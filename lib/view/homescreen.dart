import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthcare/view/feedback.dart';
import 'package:healthcare/view/healthplan.dart';
import 'care_plan.dart';
import 'login.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _HomeState();
}

class _HomeState extends State<home> {
  final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;

  List<String> imageList = [
    'asset/banner1.jpg',
    'asset/banner2.jpg',
    'asset/banner3.jpg',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        print("Home Clicked");
        break;
      case 1:
        print("Message Clicked");
        break;
      case 2:
        print("Support Clicked");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.volunteer_activism_outlined,
            size: 35,
            color: Colors.orangeAccent,
          ),
        ),
        title: const Text(
          '365 Care',
          style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(15),
            child: CarouselSlider.builder(
              itemCount: imageList.length,
              options: CarouselOptions(
                enlargeCenterPage: true,
                height: 100,
                autoPlay: false,
                reverse: false,
                aspectRatio: 5.0,
              ),
              itemBuilder: (context, i, id) {
                return GestureDetector(
                  onTap: () {
                    var url = imageList[i];
                    print(url.toString());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.white),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        imageList[i],
                        width: 500,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.orange[50]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('asset/user.png'),
                    backgroundColor: Colors.white,
                  ),
                  const SizedBox(height: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'New User',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 60),
                    child: Icon(CupertinoIcons.right_chevron),
                  )
                ],
              ),
            ),
            _drawerItem(Icons.category, "Product Category",
                () => Navigator.pop(context)),
            _drawerItem(Icons.monitor_heart, "View Vital Health",
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddressScreen()),
                  );
                }),
            _drawerItem(Icons.volunteer_activism_outlined, "View Care Plan",
                () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HealthPlan()),
              );
            }),
            _drawerItem(Icons.list_outlined, "Booking Detail", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FeedbackScreen()),
              );
            }),
            _drawerItem(Icons.headset_mic, "Support Request",
                () => Navigator.pop(context)),
            _drawerItem(Icons.bar_chart, "Level Information",
                () => Navigator.pop(context)),
            _drawerItem(Icons.exit_to_app, "Logout", () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => login()),
              );
            }),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.orangeAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.support),
            label: 'Support',
          ),
        ],
      ),
    );
  }

  // Drawer Item Helper Function
  Widget _drawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }
}
