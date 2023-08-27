import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class BasicInfos extends StatefulWidget {
  final Function back;
  final Function next;

  const BasicInfos({super.key, required this.back, required this.next});

  @override
  State<StatefulWidget> createState() => _BasicInfosState();
}

class _BasicInfosState extends State<BasicInfos> {
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
          TextField(
            decoration: InputDecoration(
              labelText: 'E-mail',
              hintStyle: const TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xFF898A8D),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(
            height: 36,
          ),
          IntlPhoneField(
            decoration: const InputDecoration(
              labelText: 'Phone Number',
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                ),
              ),
            ),
            initialCountryCode: 'FR',
            onChanged: (phone) {
              print(phone.completeNumber);
            },
          ),
          const SizedBox(
            height: 29,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Mot de passe',
              hintStyle: const TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xFF898A8D),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          RichText(
            text: const TextSpan(
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              children: [
                TextSpan(text: 'Doit contenir au moins :\n'),
                TextSpan(text: ' - 1 Majuscule\n'),
                TextSpan(text: ' - 1 Chiffre\n'),
                TextSpan(text: ' - 1 Caractère spécial\n'),
                TextSpan(text: ' - 8 caractères\n'),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Confirmation du mot de passe',
              hintStyle: const TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xFF898A8D),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
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
