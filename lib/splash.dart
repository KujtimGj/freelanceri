import 'package:Freelanceri/features/screens/AuthUi/login.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_svg/svg.dart';
import 'package:Freelanceri/core/const.dart';
import 'package:Freelanceri/features/screens/home/home.dart';
import 'package:Freelanceri/main.dart';
import 'package:Freelanceri/features/screens/intro/onboarding.dart';

class SplashScreen extends StatefulWidget {
  final bool isLoggedIn;
  const SplashScreen({super.key,required this.isLoggedIn});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => widget.isLoggedIn?Base():LoginView()));
    });
   }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryBlue,
      body: Container(
        height: size.height,
        width: size.width,
        color: primaryBlue,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/svg/freelanceri.svg"),
              SizedBox(height: size.height * 0.1),
              const CircularProgressIndicator(
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
