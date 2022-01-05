import 'package:everyday_mart/Pages/StoreOwnerHomePage/StoreHomePage.dart';
import 'package:everyday_mart/utils/Colors.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 100),
          const Text(
            "Verification Code",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            "Please, enter the OTP sent on\nyour register mobile number.",
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.all(20),
            width: 500,
            child: OTPTextField(
              length: 5,
              width: MediaQuery.of(context).size.width,
              fieldWidth: 50,
              style: const TextStyle(fontSize: 17),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.box,
              onCompleted: (pin) {
                print("Completed: " + pin);
              },
            ),
          ),
          const SizedBox(height: 20),
          RichText(
            text: TextSpan(
              text: "Didn't receive the OTP? ",
              style: TextStyle(
                fontSize: 15,
                letterSpacing: 1,
                color: Colors.grey[700],
              ),
              children: [
                TextSpan(
                  text: "Resent OTP",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow[700],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const StoreHomePage()),
              );
            },
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: const Center(
                    child: Text(
                      "Signup",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFBC02D),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Palette.blueColor.withOpacity(0.85),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
