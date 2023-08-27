import 'package:flutter/material.dart';

class Identity extends StatefulWidget {
  final Function back;
  final Function next;

  const Identity({super.key, required this.back, required this.next});

  @override
  State<StatefulWidget> createState() => _IdentityState();
}

class _IdentityState extends State<Identity> {
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
            'Nous vérifions votre identité pour sécurisé\n le bien être de tout le monde.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 44,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(313, 49),
              elevation: 0,
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(
                  color: Color(0xFF979797),
                  width: 1,
                ),
              ),
            ),
            child: const Text(
              'Envoyer ma pièce d\'identité',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
          const Text(
            'jpeg/png (5MOo max)',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF979797),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(313, 49),
              elevation: 0,
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(
                  color: Color(0xFF979797),
                  width: 1,
                ),
              ),
            ),
            child: const Text(
              'Envoyer un selfie',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(text: 'Il faut que:\n'),
                TextSpan(text: '- votre visage soit découver et visible\n'),
                TextSpan(text: '- pad de filtres ou d\'effets\n'),
                TextSpan(text: '- pas de lunettes ou d\'objets\n'),
              ],
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFF979797),
              ),
            ),
          ),
          const SizedBox(
            height: 44,
          ),
          const Text(
            'Ces documents sont utilisés dans le cadre de la\nvérrification de vos informations. Afin de vous\ngarantire une sécurité lors de l\'utilisation de l\'application.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
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
              'ENVOYER',
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
