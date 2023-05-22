import 'package:flutter/material.dart';
import 'package:tpmproject/pages/home.dart';
import 'package:tpmproject/pages/kesran.dart';
import 'package:tpmproject/pages/profile.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  PageController pageController = PageController();
  List<Widget> pages = [const HomePage(), KesranPage(), const ProfilePage()];

  int selectedIndex = 0;
  void onPageChanged(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void onItemTapped(int selectedItems) {
    pageController.jumpToPage(selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: pages,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        onTap: onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_rounded,
              color: selectedIndex == 0 ? Colors.teal : Colors.grey,
            ),
            title: Text(
              "Home",
              style: TextStyle(
                color: selectedIndex == 0 ? Colors.teal : Colors.grey,
                fontSize: 15,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.wysiwyg_rounded,
              color: selectedIndex == 1 ? Colors.teal : Colors.grey,
            ),
            title: Text(
              "Kesan",
              style: TextStyle(
                color: selectedIndex == 1 ? Colors.teal : Colors.grey,
                fontSize: 15,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: selectedIndex == 2 ? Colors.teal : Colors.grey,
            ),
            title: Text(
              "Profile",
              style: TextStyle(
                color: selectedIndex == 2 ? Colors.teal : Colors.grey,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
