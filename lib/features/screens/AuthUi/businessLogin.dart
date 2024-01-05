import 'package:Freelanceri/features/model/userModel.dart';
import 'package:Freelanceri/features/providers/userProvider.dart';
import 'package:Freelanceri/features/screens/AuthUi/b_signup.dart';
import 'package:Freelanceri/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/const.dart';
import '../../../core/dimensions.dart';

class BusinessLogin extends StatefulWidget {
  const BusinessLogin({Key? key}) : super(key: key);

  @override
  State<BusinessLogin> createState() => _BusinessLoginState();
}

class _BusinessLoginState extends State<BusinessLogin> {
  bool isChecked = false;

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return primaryBlue;
    }
    return Colors.white;
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool eye = true;
  String? uuid;

  login(UserProvider userProvider) async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    UserModel? user = await userProvider.login(email, password);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (user != null) {
      // Navigate to the home page or perform other actions upon successful login
      print(user);
      Navigator.push(context, MaterialPageRoute(builder: (_) => const Base()));
      prefs.setBool("isLoggedIn", true);
      setState(() {
        uuid=prefs.getString("uuid");
      });
    } else {
      // Handle login failure, e.g., show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login failed. Please check your credentials.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: SafeArea(
        top: true,
        child: ListView(
          children: [
            SizedBox(height: 20),
            Center(
                child: Text(
                  "Login",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: Colors.black87),
                )),
            Center(
                child: Text(
                  "Miresevini ne platformen Freelanceri",
                  style: TextStyle(fontSize: 17, color: Colors.grey[500]),
                )),
            Container(
              height: getPhoneHeight(context)*0.3,
              width: getPhoneWitdth(context)*0.9,
              margin: EdgeInsets.symmetric(horizontal: getPhoneWitdth(context)*0.05,vertical: 10),
              decoration:const BoxDecoration(
                  color: primaryBlue,
                  image: DecorationImage(
                      image: AssetImage("assets/images/loginImg.png"),
                      fit: BoxFit.cover
                  )
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.05,
                  top: size.height * 0.04,
                  bottom: size.height * 0.01),
              child: Text(
                "E-mail",
                style: TextStyle(color: Colors.grey[500]),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.03,
                  bottom: size.height * 0.03,
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
                    hintText: 'example@email.com',
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
                  // top: size.height * 0.007,
                  bottom: size.height * 0.02),
              child: Text(
                "Password",
                style: TextStyle(color: Colors.grey[500]),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.03,
                  bottom: size.height * 0.005,
                  right: size.width * 0.03),
              child: TextFormField(
                obscureText: eye,
                controller: passwordController,
                decoration: InputDecoration(
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      const BorderSide(width: 0, color: Colors.transparent),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fillColor: Colors.grey[300],
                    suffixIcon:GestureDetector(
                      onTap: () {
                        setState(() {
                          eye = !eye; // Fix this line
                        });
                      },
                      child: Icon(
                        eye ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey[500],
                      ),
                    ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                        fillColor: MaterialStateColor.resolveWith(getColor),
                        checkColor: primaryBlue,
                        focusColor: primaryBlue,
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        }),
                    Text(
                      "Remember Me",
                      style: TextStyle(color: Colors.grey[800]),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Text(
                    "Forget password?",
                    style: TextStyle(color: Colors.grey[800]),
                  ),
                )
              ],
            ),
            Center(
              child: GestureDetector(
                onTap: ()async {
                  login(userProvider);
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  height: size.height * 0.07,
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: primaryBlue),
                  child: const Center(
                    child: Text(
                      "Sign In",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_)=>const BusinessSignup()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: RichText(
                    text: const TextSpan(children: [
                      TextSpan(
                          text: "You don't have an account?",
                          style: TextStyle(color: Colors.black87)),
                      TextSpan(
                          text: " Sign up",
                          style: TextStyle(
                              color: primaryBlue, fontWeight: FontWeight.w700))
                    ]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
