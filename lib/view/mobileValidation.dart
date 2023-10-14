import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ulk_bazza/commoncomponent/Colors.dart';
import 'package:ulk_bazza/commoncomponent/String.dart';
import 'package:ulk_bazza/view/OtpValidation.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MobileValidation extends StatefulWidget {
  const MobileValidation({super.key});
  static String verifiy = '';

  @override
  State<MobileValidation> createState() => _MobileValidationState();
}

class _MobileValidationState extends State<MobileValidation> {

  final mobileController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.navigate_before,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
            // Navigator.pop(context);
          },
        ),
        title: const Text(
          StringResource.register,
          style: TextStyle(
              color: CommonColors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 120, left: 15, right: 30),
            child: TextFormField(
              keyboardType: TextInputType.phone,
              inputFormatters: [LengthLimitingTextInputFormatter(10)],
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(width: 3, color: CommonColors.grey)),
                  label: Text(
                    StringResource.mobile,
                    style: TextStyle(color: CommonColors.grey),
                  ),
                  errorStyle: TextStyle(color: CommonColors.red),
                  icon: Icon(
                    Icons.phone_android,
                    color: CommonColors.grey,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 120, left: 15, right: 30),
            child: TextFormField(
              keyboardType: TextInputType.phone,
              controller: mobileController,
              inputFormatters: [LengthLimitingTextInputFormatter(10), FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    // borderSide: BorderSide(
                    //   width: 3, color: CommonColors.grey
                    // ),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(10)),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 3, color: CommonColors.grey)),
                  label: Text(
                    StringResource.mobile,
                    style: TextStyle(color: CommonColors.grey),
                  ),
                  icon: Icon(
                    Icons.phone_android,
                    color: CommonColors.grey,
                  )),
                  validator: (value) {
                    if (value!.isEmpty){
                      return "Enter your Phone number";
                    }
                    return null;
                  },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(CommonColors.grey),
                ),
                onPressed: () async{
                  await FirebaseAuth.instance.verifyPhoneNumber(
                  phoneNumber: '+91'+'${mobileController.text}}',
                  verificationCompleted: (PhoneAuthCredential credential) {},
                  verificationFailed: (FirebaseAuthException e) {},
                  codeSent: (String verificationId, int? resendToken) {
                    MobileValidation.verifiy =verificationId;
                  },
                  codeAutoRetrievalTimeout: (String verificationId) {},
                );
                  Get.to(() => const OtpValidation(), arguments: '${mobileController.text}');
                },
                child: const Text(StringResource.otp)),
          )
        ],
      ),
    ));
  }
}
