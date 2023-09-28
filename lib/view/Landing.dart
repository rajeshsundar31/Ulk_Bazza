import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulk_bazza/commoncomponent/Colors.dart';
import 'package:ulk_bazza/commoncomponent/String.dart';
import 'package:ulk_bazza/view/mobileValidation.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
      children: [
        const Image(
          image: AssetImage("lib/assets/images/billing.jpg"),
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: SizedBox(
            width: 240,
            height: 50,
            child: ElevatedButton(
                onPressed: () {
                  Get.to(() => const MobileValidation());
                  // Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const MobileValidation()));
                },
                style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(CommonColors.grey),
                ),
                child: const Text(StringResource.register)),
          ),
        )
      ],
    )));
  }
}
