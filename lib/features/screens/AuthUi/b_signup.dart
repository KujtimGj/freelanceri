import 'package:flutter/material.dart';

import 'package:mongo_dart/mongo_dart.dart' as M;
import 'package:Freelanceri/features/model/userModel.dart';
import 'package:Freelanceri/features/providers/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Freelanceri/core/const.dart';
import 'package:Freelanceri/main.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class BusinessSignup extends StatefulWidget {
  const BusinessSignup({super.key});

  @override
  State<BusinessSignup> createState() => _BusinessSignupState();
}

class _BusinessSignupState extends State<BusinessSignup> {
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isValid = false;


  _onSignUpButtonPressed(UserProvider userProvider) async {
    String name = nameController.text.trim();
    String password = passwordController.text.trim();
    String lastName = lastNameController.text.trim();
    String email = emailController.text.trim();

    UserModel userModel = UserModel(
        id: M.ObjectId(),
        firstName: name,
        lastName: lastName,
        email: email,
        password: password,
        city: 'city',
        profession: ''
    );

    await userProvider.register(context, userModel);
  }


  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: size.width * 0.2, bottom: 20),
              child: Center(
                child: SvgPicture.asset(
                  "assets/svg/freelanceri.svg",
                  color: primaryBlue,
                ),
              ),
            ),
            Center(
                child: Text(
                  "Regjistrohu!",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: Colors.black87),
                )),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.05,
                  top: size.height * 0.03,
                  bottom: size.height * 0.01),
              child: Text(
                "Name",
                style: TextStyle(color: Colors.grey[500]),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.03,
                  bottom: size.height * 0.015,
                  right: size.width * 0.03),
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      const BorderSide(width: 0, color: Colors.transparent),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fillColor: Colors.grey[300],
                    hintText: 'Kujtim',
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey.withOpacity(0.2), width: 1),
                        borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: primaryBlue, width: 1),
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.05,
                  top: size.height * 0.03,
                  bottom: size.height * 0.01),
              child: Text(
                "Last name",
                style: TextStyle(color: Colors.grey[500]),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.03,
                  bottom: size.height * 0.015,
                  right: size.width * 0.03),
              child: TextFormField(
                controller: lastNameController,
                decoration: InputDecoration(
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      const BorderSide(width: 0, color: Colors.transparent),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fillColor: Colors.grey[300],
                    hintText: 'Gjokaj',
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey.withOpacity(0.2), width: 1),
                        borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: primaryBlue, width: 1),
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.05,
                  top: size.height * 0.015,
                  bottom: size.height * 0.01),
              child: Text(
                "E-mail",
                style: TextStyle(color: Colors.grey[500]),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.03,
                  bottom: size.height * 0.015,
                  right: size.width * 0.03),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      const BorderSide(width: 0, color: Colors.transparent),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fillColor: Colors.grey[300],
                    hintText: 'gjoka@gmail.com',
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey.withOpacity(0.2), width: 1),
                        borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: primaryBlue, width: 1),
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.05,
                  top: size.height * 0.015,
                  bottom: size.height * 0.01),
              child: Text(
                "Password",
                style: TextStyle(color: Colors.grey[500]),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.03,
                  bottom: size.height * 0.015,
                  right: size.width * 0.03),
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      const BorderSide(width: 0, color: Colors.transparent),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fillColor: Colors.grey[300],
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey.withOpacity(0.2), width: 1),
                        borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: primaryBlue, width: 1),
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            //
            GestureDetector(
              onTap: () async{
                await _onSignUpButtonPressed(provider);
              },
              child: Center(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  height: size.height * 0.07,
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: primaryBlue),
                  child: const Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed("/login");
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => const Base()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: RichText(
                    text: const TextSpan(children: [
                      TextSpan(
                          text: "I already have an account? ",
                          style: TextStyle(color: Colors.black87)),
                      TextSpan(
                          text: "Log In",
                          style: TextStyle(
                              color: primaryBlue, fontWeight: FontWeight.w700))
                    ]),
                  ),
                ),
              ),
            ),
            SvgPicture.asset(
              "assets/svg/signup_vector.svg",
              width: size.width,
            )
          ],
        ),
      ),
    );
  }
}
