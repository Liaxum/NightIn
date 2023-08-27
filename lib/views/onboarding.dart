import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/material.dart';
import 'package:night_in/components/onboarding_tabs/go_tab.dart';
import 'package:night_in/components/onboarding_tabs/out_tab.dart';
import 'package:night_in/components/onboarding_tabs/with_tab.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  double _index = 0;
  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _next() {
    setState(() {
      _index++;
    });
    _pageController.nextPage(
        duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            width: double.infinity,
            child: PageView(
              controller: _pageController,
              children: [
                OutTab(next: _next),
                WithTab(next: _next),
                const GoTab()
              ],
              onPageChanged: (index) => setState(() {
                _index = index.toDouble();
              }),
            ),
          ),
          CarouselIndicator(
            count: 3,
            index: _index.toInt(),
            color: const Color(0xFFEFEFF4),
            activeColor: Colors.black,
            height: 6,
            width: 30,
          ),
        ],
      ),
    );
  }
}
