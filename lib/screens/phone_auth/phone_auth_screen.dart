import 'package:fip5/utils/ui/common_views.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({Key? key}) : super(key: key);

  @override
  State<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  String? myVerificationId;
  TextEditingController _otpController = TextEditingController();
  TextEditingController _numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonViews().getAppBar(title: "Phone Auth"),
      body: Column(children: [
        SizedBox(
          height: 10.h,
        ),
        CommonViews().createTextFormField(
            controller: _numberController,
            focusNode: FocusNode(),
            label: "Mobile number"),
        CommonViews().createButton(
            title: "SendOtp",
            onPressed: () {
              FirebaseAuth.instance.verifyPhoneNumber( // otp ONE-TIME-PIN
                  phoneNumber: "+962${_numberController.text}",// +962776511704
                  verificationCompleted: (AuthCredential credential) {
                    print("Verification Complete");
                  },
                  verificationFailed: (FirebaseAuthException exception) {
                    print("verificationFailed");
                    print(exception.message);
                  },
                  codeSent: (String verificationId,
                      [int? forceResendingToken]) {
                    try { // 12345
                      myVerificationId = verificationId.toString(); // 123
                      setState(() {});
                    } catch (error) {}
                  },
                  // timeout: const Duration(seconds: 120),
                  codeAutoRetrievalTimeout: (String verificationId) {
                    // code resend
                    print("time out");
                  });
            }),
        if (myVerificationId != null)
          CommonViews().createTextFormField(
              controller: _otpController, focusNode: FocusNode(), label: "OTP"),
        if (myVerificationId != null)
          CommonViews().createButton(
              title: "verify Otp",
              onPressed: () async {
                AuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: myVerificationId!,
                    smsCode: _otpController.text);
                // 123   165564
                  UserCredential result = await FirebaseAuth.instance
                      .signInWithCredential(credential); // 123   165564
                  print(result.user);
              }),
      ]),
    );
  }
}
