import 'package:flutter/material.dart';

import '../components/login_form.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key); // Constructor

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _signInVisible = false;

  toggleView() {
    setState(() {
      _signInVisible = !_signInVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height,
              color: Colors.black,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
            ),
          ),
          const Align(
            alignment: AlignmentDirectional(0.07, -0.4),
            child: Image(
              image: AssetImage('images/big-guy.png'),
              width: 336,
              height: 336,
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0, 0.55),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                setState(() {
                  _signInVisible = !_signInVisible;
                });
              },
              child: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Tu as déjà un com',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: ' pte ? Se connecter',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 13.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0, 0.7),
            child: SizedBox(
              height: 49,
              width: 313,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true)
                      .pushNamed('/register');
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                ),
                child: const Text(
                  'S\'INSCRIRE',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          if (_signInVisible)
            LoginForm(
              toggleView: toggleView,
            )
        ],
      ),
    );
  }
}
