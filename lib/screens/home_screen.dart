import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitch_clone/provider/user_provider.dart';
import 'package:twitch_clone/screens/go_live_screen.dart';
import 'package:twitch_clone/utils/colors.dart';
import 'package:twitch_clone/screens/feed_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/homeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> pages = [
    const FeedScreen(),
    const GoLiveScreen(),
    const Center(
      child: Text('Browser'),
    )
  ];
  int _page = 0;
  void onPageChange(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          leading: const Icon(Icons.gamepad),
          title: const Text('Signup'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: buttonColor,
          unselectedItemColor: primaryColor,
          backgroundColor: backgroundColor,
          elevation: 0.0,
          currentIndex: _page,
          unselectedFontSize: 12,
          onTap: onPageChange,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'following',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_rounded),
              label: 'Go live',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.copy),
              label: 'Browsing',
            ),
          ],
        ),
        body: pages[_page],
      ),
    );
  }
}
