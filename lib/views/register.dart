import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/material.dart';

import 'package:night_in/components/register_tabs/basic_infos.dart';
import 'package:night_in/components/register_tabs/code_verrif.dart';
import 'package:night_in/components/register_tabs/identity.dart';
import 'package:night_in/components/register_tabs/register_end.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key); // Constructor

  @override
  State<StatefulWidget> createState() => _RegisterState();
}

class _RegisterState extends State<Register> with TickerProviderStateMixin {
  final PageController _tabController = PageController(initialPage: 0);
  int _index = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  back() {
    if (_tabController.page == 0) {
      Navigator.of(context).pop();
    } else {
      _tabController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    }
  }

  next() {
    if (_tabController.page == 3) {
      Navigator.of(context).pushReplacementNamed('/home');
    } else {
      _tabController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5 - 180,
                ),
                Ink(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: InkWell(
                    onTap: () => back(),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 90,
                ),
                const Image(
                  image: AssetImage('images/big-guy.png'),
                  width: 67,
                  height: 67,
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            width: double.infinity,
            child: PageView(
              controller: _tabController,
              children: [
                BasicInfos(back: back, next: next),
                CodeVerrif(back: back, next: next),
                Identity(back: back, next: next),
                RegisterEnd(back: back, next: next),
              ],
              onPageChanged: (index) => setState(() {
                _index = index;
              }),
            ),
          ),
          CarouselIndicator(
            count: 4,
            index: _index,
            color: const Color(0xFFEFEFF4),
            activeColor: Colors.black,
            height: 6,
            width: 30,
          )
        ],
      ),
    );
  }
}
