import 'package:pcos_app/features/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:pcos_app/features/health_insights.dart';
import 'package:pcos_app/widgets/AppDrawer.dart';

class HomePage extends StatefulWidget {
  static final String id = "HomePage";
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  final widgetOptions = [
    BlogSection(),
    ChatScreen(),
    Text('This feature is coming soon !', style: TextStyle(fontSize: 20)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PCOS Virago'),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb_outline),
            label: 'Health Insights',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Virago Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Expert Team',
          ),
        ],
        currentIndex: selectedIndex,
        fixedColor: Colors.lightBlue,
        onTap: onItemTapped,
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
