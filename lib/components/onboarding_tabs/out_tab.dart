import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class OutTab extends StatelessWidget {
  final Function next;

  const OutTab({super.key, required this.next});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: const AlignmentDirectional(0, -1),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(kIsWeb
                    ? 'images/ou_onboarding.png'
                    : 'assets/images/ou_onboarding.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 31),
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Color(0xFFF6F6F6),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 62,
                ),
                const Text(
                  'Tu veux sortir en boite de nuit ?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.282,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Ce soir ou dans la semaine ?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () => next(),
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(190, 45),
                    elevation: 0,
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'SUIVANT',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 65,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
