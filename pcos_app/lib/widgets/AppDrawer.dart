import 'package:flutter/material.dart';
import 'package:pcos_app/Quiz/WelcomePCOSQuiz.dart';
import 'package:pcos_app/homepage.dart';
import 'package:pcos_app/login_screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      height: 90,
                      width: 130,
                      child: CircleAvatar(
                        radius: 80,
                        backgroundImage: AssetImage("assets/images/profile.jpg"),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Text(
                        "Sakshi Oswal",
                        style: TextStyle(
                          fontFamily: 'SegoeUI-Bold',
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3.0),
                      child: Text(
                        "@sakshi_17",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 12, decoration: TextDecoration.none),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: ListView(
              children: [
                DrawerListItem(
                  icon: Icons.home,
                  title: "Home",
                  id: HomePage.id,
                ),
                DrawerListItem(
                  icon: Icons.assignment_ind,
                  title: "PCOS Diagnosis",
                  id: WelcomePCOSQuiz.id,
                ),
                DrawerListItem(
                  icon: Icons.person_outline,
                  title: "PCOS Assistant",
                  id: null,
                ),
                DrawerListItem(
                  icon: Icons.list,
                  title: "PCOS Tracking and Ovulation",
                  id: null,
                ),
                DrawerListItem(
                  icon: Icons.info_outline,
                  title: "About Us",
                  id: null,
                ),
                DrawerListItem(
                  icon: Icons.exit_to_app,
                  title: "Log Out",
                  id: WelcomeScreen.id,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerListItem extends StatelessWidget {
  final IconData icon;
  final String? id; // Mark the id parameter as nullable
  final String title;
  final _auth = FirebaseAuth.instance;

  DrawerListItem({
    required this.icon, // Use the required keyword
    required this.id,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      onTap: () {
        if (id == WelcomeScreen.id) {
          _auth.signOut();
          Navigator.pushNamedAndRemoveUntil(context, WelcomeScreen.id, (route) => false);
        } else if (id != null) {
          Navigator.pushReplacementNamed(context, id!);
        }
      },
    );
  }
}
