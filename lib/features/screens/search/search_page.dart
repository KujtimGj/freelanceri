import 'package:Freelanceri/core/const.dart';
import 'package:Freelanceri/core/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:Freelanceri/features/screens/home/home.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<dynamic> images = [
    {
      "image": "assets/professions/developer.jpg",
      "title": "Zhvillim\nSoftuerik"
    },
    {
      "image": "assets/professions/graphicdesign.jpg",
      "title": "Dizajn\nGrafik"
    },
    {
      "image": "assets/professions/content-writing.jpg",
      "title": "Content\nWriter"
    },
    {"image": "assets/professions/administrat.jpg", "title": "Administratë"},
    {"image": "assets/professions/puneditore.jpg", "title": "Punë\nditore"},
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        elevation: 3,
        shadowColor: primaryBlue,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/svg/freelanceri.svg",
              colorFilter: const ColorFilter.mode(primaryBlue, BlendMode.srcIn),
              height: 50,
            ),
            const SizedBox(width: 10),
            SvgPicture.asset("assets/svg/freelanceri_txt.svg")
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Center(
              child: Container(
            margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
            height: 60,
            width: size.width * 0.95,
            decoration: BoxDecoration(
              color: const Color(0xffF7F7F8),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(11.0),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.grey[600],
                  ),
                  hintText: 'Search...',
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  border: InputBorder.none,
                ),
              ),
            ),
          )),
          GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: getPhoneWitdth(context) / 1.6,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: primaryBlue,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage(images[index]['image']),
                            fit: BoxFit.cover)),
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                        Center(
                          child: Text(
                            images[index]['title'],
                            style:
                                const TextStyle(color: Colors.white, fontSize: 30),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ));
              }),
          SizedBox(
            height: getPhoneHeight(context) * 0.05,
          )
        ],
      )),
    );
  }
}
