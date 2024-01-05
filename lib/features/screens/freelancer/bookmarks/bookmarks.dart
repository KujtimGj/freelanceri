import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Freelanceri/core/const.dart';
import 'package:provider/provider.dart';

class Bookmarks extends StatelessWidget {
  const Bookmarks({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar:AppBar(
          shadowColor: primaryBlue,
          centerTitle: true,
          title: SvgPicture.asset("assets/svg/favorites.svg"),
          toolbarHeight: 75,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 3,
          // leading: GestureDetector(
          //     onTap: () {
          //       GestureDetectort.back();
          //     },
          //     child: const Icon(
          //       Icons.arrow_back_ios_new,
          //       color: primaryBlue,
          //     )),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [

            ],
          ),
        ),
      ),
    );
  }
}