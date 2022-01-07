import 'package:everyday_mart/Pages/LoginPage/LoginPage.dart';
import 'package:everyday_mart/Pages/SignupPage/SignupPage.dart';
import 'package:everyday_mart/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool isCustomer = false;
  bool isStore = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/welcome_screen_image.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.only(top: 110, left: 20),
                color: Palette.blueColor.withOpacity(0.85),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "Welcome to ",
                        style: TextStyle(
                          fontSize: 25,
                          letterSpacing: 2,
                          color: Colors.yellow[700],
                        ),
                        children: [
                          TextSpan(
                            text: "Everyday Mart",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Login/Signup to Continue",
                      style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 120,
            child: Container(
              height: MediaQuery.of(context).size.height / 1.9,
              padding: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width - 40,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 15,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isStore = false;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              "CUSTOMER",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: !isStore
                                    ? Palette.activeColor
                                    : Palette.textColor1,
                              ),
                            ),
                            if (!isStore)
                              (Container(
                                margin: const EdgeInsets.only(top: 3),
                                height: 2,
                                width: 90,
                                color: Colors.orange,
                              )),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isStore = true;
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              "STORE",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: isStore
                                    ? Palette.activeColor
                                    : Palette.textColor1,
                              ),
                            ),
                            if (isStore)
                              (Container(
                                margin: const EdgeInsets.only(top: 3),
                                height: 2,
                                width: 55,
                                color: Colors.orange,
                              )),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  if (isStore) loginSignupPage(context),
                  if (!isStore) loginSignupPage(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column loginSignupPage(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 70,
          width: MediaQuery.of(context).size.width,
          child: IntlPhoneField(
            decoration: const InputDecoration(
              labelText: 'Phone Number',
              border: OutlineInputBorder(
                borderSide: BorderSide(),
              ),
            ),
            initialCountryCode: 'IN',
            onChanged: (phone) {},
          ),
        ),
        const SizedBox(height: 20),
        Stack(
          children: [
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Palette.blueColor.withOpacity(0.85),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupPage(isStore)),
                );
              },
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Signup using ",
                      style: TextStyle(
                        fontSize: 17,
                        letterSpacing: 1,
                        color: Colors.yellow[700],
                      ),
                      children: [
                        TextSpan(
                          text: "OTP",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),
        const Text(
          "Already have an account?",
          style: TextStyle(
            fontSize: 13,
            letterSpacing: 0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          },
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: const Center(
              child: Text(
                "Login",
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
        ),
      ],
    );
  }
}
