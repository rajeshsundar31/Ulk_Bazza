import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:ulk_bazza/commoncomponent/Colors.dart';
import 'package:ulk_bazza/view/Base.dart';
import 'package:ulk_bazza/view/mobileValidation.dart';

class OtpValidation extends StatefulWidget {
  const OtpValidation({super.key});

  @override
  State<OtpValidation> createState() => _OtpValidationState();
}

class _OtpValidationState extends State<OtpValidation> {
  var argu = Get.arguments;

  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: CommonColors.white,
        title: const Text('Enter Valid Otp',
        style: TextStyle(
          color: CommonColors.black,
          fontWeight: FontWeight.w400
        ),
        ),
        leading:  IconButton(
          icon: const Icon(Icons.navigate_before, color: CommonColors.black,), 
        onPressed: () {
          Get.back();
        },
      )),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 40),
          child: Text(
            "OTP has Sent to +91 $argu this Number",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 160, right: 20, left: 20),
            child: OTPTextField(
              length: 5,
              width: MediaQuery.of(context).size.width,
              fieldWidth: 20,
              style: const TextStyle(fontSize: 20),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.underline,
              onCompleted: (pin) async{
                PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: MobileValidation.verifiy, smsCode: pin);

                // Sign the user in (or link) with the credential
                await auth.signInWithCredential(credential);
                if (pin.length == 5){
                  Get.to(() => const ProductBase());
                }
                
                print("Completed: " + pin);
              },
            ),
          ),
        ],
      ),
    ));
  }
}
