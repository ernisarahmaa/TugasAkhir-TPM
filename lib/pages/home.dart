import 'package:flutter/material.dart';
import 'package:tpmproject/pages/currency.dart';
import 'package:tpmproject/pages/favorite.dart';
import 'package:tpmproject/pages/kesran.dart';
import 'package:tpmproject/pages/list.dart';
import 'package:tpmproject/pages/login.dart';
import 'package:tpmproject/pages/profile.dart';
import 'package:tpmproject/pages/time.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      appBar: AppBar(
        title: const Text('Dashboard'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              minWidth: 200,
              height: 42,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PageListCharacter(),
                  ),
                );
              },
              color: Colors.teal,
              child: const Text(
                'Rick n Morty',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15),
            ),
            MaterialButton(
              minWidth: 200,
              height: 42,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavoritePage(),
                  ),
                );
              },
              color: Colors.teal,
              child: const Text(
                'Favorite Character',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15),
            ),
            MaterialButton(
              minWidth: 200,
              height: 42,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CurrencyPage(),
                  ),
                );
              },
              color: Colors.teal,
              child: const Text(
                'Currency Conversion',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15),
            ),
            MaterialButton(
              minWidth: 200,
              height: 42,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TimePage(),
                  ),
                );
              },
              color: Colors.teal,
              child: const Text(
                'Time Conversion',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ),
              (Route<dynamic> route) => false);
        },
        tooltip: 'Logout',
        child: const Icon(Icons.logout_rounded),
        backgroundColor: Colors.teal,
      ),
    );
  }
}
