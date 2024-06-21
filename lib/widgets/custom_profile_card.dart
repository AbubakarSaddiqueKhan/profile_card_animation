import 'package:flutter/material.dart';

class CustomProfileCard extends StatelessWidget {
  const CustomProfileCard({super.key, required this.elevationValue});
  final double elevationValue;

  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Material(
      elevation: elevationValue,
      borderRadius: BorderRadius.circular(15),
      color: const Color(0xFF8B8B8D).withAlpha(225),
      child: SizedBox(
        height: height * 0.325,
        width: width * 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              width: width * 0.225,
              height: width * 0.225,
              decoration: const BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("assets/images/bakar.jpg"),
                      fit: BoxFit.contain)),
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Text(
                "Abubakar Aziz",
                style: TextStyle(
                    color: Color(0xFFFFC107),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Center(
              child: Text(
                "Flutter Developer \n at \n MASK Group Of \n Companies",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromARGB(255, 252, 189, 2), fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/**
 * 
 * const primaryColor = Color(0xFFFFC107);
const secondaryColor = Color(0xFF242430);
const darkColor = Color(0xFF191923);
const bodyTextColor = Color(0xFF8B8B8D);
const bgColor = Color(0xFF1E1E28);
 */
