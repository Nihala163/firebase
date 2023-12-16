import 'package:firebase/otp%20verification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class PhoneNumber extends StatefulWidget {
  const PhoneNumber({super.key});
  static String verify="";

  @override
  State<PhoneNumber> createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  var phonenumber=" ";

  Future<void> otpnumber() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
  phoneNumber: '+91$phonenumber',
  verificationCompleted: (PhoneAuthCredential credential) {},
  verificationFailed: (FirebaseAuthException e) {},
  codeSent: (String verificationId, int? resendToken) {
PhoneNumber.verify=verificationId;
  },
  codeAutoRetrievalTimeout: (String verificationId) {},
);
  }
  Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
        body: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
               decoration: InputDecoration(
                fillColor: Colors.white,filled: true,
                 hintText: 'Phone Number',
                 border: OutlineInputBorder(
                   borderRadius:  BorderRadius.circular(10),
                 ),
               ),
               onChanged: (value) => phonenumber=value,
               
              ),
            ),
             Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(onPressed: (){
            otpnumber();
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return Otp();
            }));
          }, child: Text('verify otp'),
          style: ElevatedButton.styleFrom(
            fixedSize: Size.fromWidth(200)
          ),),
        ),
          Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(onPressed: (){
           signInWithGoogle();
          }, child: Text('email'),
          style: ElevatedButton.styleFrom(
            fixedSize: Size.fromWidth(200)
          ),),
        )
          ],
        ),
    );
  }
}
