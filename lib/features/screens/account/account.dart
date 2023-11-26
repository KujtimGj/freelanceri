import 'package:Freelanceri/features/providers/userProvider.dart';
import 'package:Freelanceri/features/screens/AuthUi/login.dart';
import 'package:flutter/material.dart';
import 'package:Freelanceri/core/const.dart';
import 'package:Freelanceri/core/dimensions.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {


  String? firstName;
  String? lastName;

  getUserData()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      firstName = prefs.getString("firstName");
      lastName = prefs.getString("lastName");
    });
  }

  logout()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("firstName");
    prefs.remove("lastName");
    prefs.remove("token");
    prefs.setBool("isLoggedIn", false);
  }

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return SafeArea(
      top: true,
      child: Scaffold(
        body: ListView(
          children: [
            SizedBox(
              height: getPhoneHeight(context) * 0.3,
              width: getPhoneWitdth(context),
              child: Stack(
                children: [
                  Opacity(
                    opacity: 0.4,
                    child: Container(
                      height: getPhoneHeight(context) * 0.25,
                      width: getPhoneWitdth(context),
                      decoration: const BoxDecoration(
                        color: primaryBlue,
                      ),
                      child: Image.asset("assets/Free.png",fit: BoxFit.fitWidth,),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      alignment: Alignment.center,
                      height: getPhoneHeight(context) * 0.35,
                      width: getPhoneWitdth(context) * 0.35,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("assets/user_kgj.png"))),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    "$firstName $lastName",
                    style:const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  const Text(
                    "Flutter & Back-End Developer",
                    style: TextStyle(fontSize: 19),
                  ),
                  const SizedBox(height: 20),
                  const Text("Universum College",
                      style: TextStyle(fontSize: 18)),
                  Text("Prishtina, Kosova",
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]))
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: getPhoneWitdth(context),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  border: Border.symmetric(
                      horizontal:
                          BorderSide(width: 1, color: Colors.grey[300]!))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Experience",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w500),
                      ),
                      Icon(
                        Icons.add,
                        size: 25,
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Image.asset(
                        "assets/algo.png",
                        height: 75,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Programming Trainer",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500)),
                          Text("Algoritmics Prishtina - Full Time"),
                          Text("Nov 2022 - Present")
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Divider(
                    height: 1,
                    color: Colors.grey[300],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        padding: const EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/cacttus_logo.jpg")
                            )
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Mobile App Developer",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500)),
                          Text("Cacttus - Full Time"),
                          Text("Aug 2022 - Nov 2023")
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  Divider(
                    height: 1,
                    color: Colors.grey[300],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Image.asset(
                        "assets/uni.png",
                        height: 75,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Students' Union President",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500)),
                          Text("Universum International College - Full Time"),
                          Text("Dec 2022 - Present")
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                userProvider.signOut();
                logout();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginView()),
                    (route) => false);
              },
              child: Center(
                  child: Text("Sign out",
                      style: TextStyle(fontSize: 17, color: Colors.grey[600]))),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
