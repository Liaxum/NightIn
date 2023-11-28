import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:night_in/components/home_tabs/default.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key); // Constructor

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _pageController = PageController(initialPage: 2);
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: const Duration(milliseconds: 200),
        backgroundColor: Colors.transparent,
        color: Colors.grey.shade200,
        key: _bottomNavigationKey,
        items: const <Widget>[
          Icon(Icons.search, size: 30),
          Icon(Icons.explore, size: 30),
          Icon(Icons.home_outlined, size: 30),
          Icon(Icons.comment_outlined, size: 30),
          Icon(Icons.account_circle_outlined, size: 30),
        ],
        index: _pageController.initialPage,
        onTap: (index) {
          setState(() {
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeIn,
            );
          });
        },
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.green,
          ),
          const Default(),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.purple,
          ),
        ],
      ),
    );
  }
}
