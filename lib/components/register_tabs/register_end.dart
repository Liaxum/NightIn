import 'package:flutter/material.dart';

class RegisterEnd extends StatefulWidget {
  final Function back;
  final Function next;

  const RegisterEnd({super.key, required this.back, required this.next});

  @override
  State<StatefulWidget> createState() => _RegisterEndState();
}

class _RegisterEndState extends State<RegisterEnd> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 31),
      child: Column(
        children: [
          const SizedBox(
            height: 58,
          ),
          const Text(
            'Félicitations ! Ton Inscription est términée.\nNous allons anayser tes informations.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Image(
            image: AssetImage('images/checked.png'),
            width: 336,
            height: 336,
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              widget.next();
            },
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(313, 49),
              elevation: 0,
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'TERMINER',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(
            height: 46,
          ),
        ],
      ),
    );
  }
}
