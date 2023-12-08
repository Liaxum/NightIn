import 'package:flutter/material.dart';
import 'package:night_in/components/login_register_tabs/basic_infos.dart';
import 'package:night_in/components/login_register_tabs/login_tab.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key); // Constructor

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Ink(
                  child: InkWell(
                    onTap: () => _pageController.animateToPage(
                      0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    ),
                    child: Text(
                      'Connexion',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        decoration: _currentPage == 0
                            ? TextDecoration.underline
                            : TextDecoration.none,
                        color: _currentPage == 0
                            ? Colors.black
                            : const Color(0xFF898A8D),
                      ),
                    ),
                  ),
                ),
                Ink(
                  child: InkWell(
                    onTap: () => _pageController.animateToPage(
                      1,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    ),
                    child: Text(
                      'Inscrtiption',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        decoration: _currentPage == 1
                            ? TextDecoration.underline
                            : TextDecoration.none,
                        color: _currentPage == 1
                            ? Colors.black
                            : const Color(0xFF898A8D),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 25),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.85,
              width: MediaQuery.of(context).size.width,
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: const [
                  LoginTab(),
                  BasicInfos(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
