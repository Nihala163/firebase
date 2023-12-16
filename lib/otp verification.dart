import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  var otp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black12,
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Pinput(
                animationCurve: Curves.bounceOut,
                   length: 6,
                onChanged: (value) =>
                    value=otp
              ),
                   

            ),
          ],
        ),
      ),
    );
  }
}
