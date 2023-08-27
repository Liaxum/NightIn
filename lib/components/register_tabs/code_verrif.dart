import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class CodeVerrif extends StatefulWidget {
  final Function back;
  final Function next;

  const CodeVerrif({super.key, required this.back, required this.next});

  @override
  State<StatefulWidget> createState() => _CodeVerrifState();
}

class _CodeVerrifState extends State<CodeVerrif> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 31),
      child: Column(
        children: [
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  widget.back();
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(40, 40),
                  backgroundColor: Colors.black,
                ),
                child: const Icon(Icons.arrow_back_ios),
              ),
            ],
          ),
          const SizedBox(
            height: 58,
          ),
          const Text(
            'Nous vous avons envoyer un code\n de vérification sur le numéros :\n',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 28,
          ),
          Pinput(
            defaultPinTheme: PinTheme(
              height: 74,
              width: 63,
              textStyle: const TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 60,
                fontWeight: FontWeight.w600,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF979797)),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onCompleted: (String pin) {
              print(pin);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {},
            child: const Text(
              'Vous n\'avez pas reçu le code ? Renvoyer le code',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 12,
              ),
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
              'CONTINUER',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(
            height: 56,
          ),
        ],
      ),
    );
  }
}
