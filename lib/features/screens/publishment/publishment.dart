import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Freelanceri/core/const.dart';
import 'package:Freelanceri/main.dart';
import 'package:Freelanceri/features/screens/publishment/create_post.dart';


class Publishment extends StatefulWidget {
  const Publishment({
    super.key,
  });

  @override
  State<Publishment> createState() => _PublishmentState();
}

class _PublishmentState extends State<Publishment> {
  int selectedProfile = 3;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        elevation: 5,
        shadowColor: primaryBlue,
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => const Base()));
            },
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: primaryBlue,
            )),
        leadingWidth: 40,
        title: SvgPicture.asset(
          "assets/svg/submit_txt.svg",
          height: 45,
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                right: 0,
                bottom: 20,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedProfile = 0;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        height: size.height * 0.19,
                        width: size.width * 0.42,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 1, color: Colors.grey),
                            boxShadow: [
                              BoxShadow(
                                  color: selectedProfile == 0
                                      ? Colors.blueAccent
                                      : Colors.grey.shade300,
                                  spreadRadius: 2,
                                  blurRadius: 10)
                            ]),
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/images/freelancer.png",
                              height: 120,
                            ),
                            const Text(
                              "Pune afatshkurt",
                              style:
                                  TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedProfile=1;
                        });
                      },
                      child: Container(
                        margin:const EdgeInsets.all(10),
                        height: size.height * 0.19,
                        width: size.width*0.42,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 1,color: Colors.grey),
                            boxShadow: [
                              BoxShadow(
                                  color: selectedProfile==1?Colors.blueAccent:Colors.grey.shade300,
                                  spreadRadius: 1,
                                  blurRadius: 10
                              )
                            ]
                        ),
                        child: Column(
                          children: [
                            Image.asset("assets/images/office-building.png",height: 120,),
                            const Text("Pune afatgjate",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const CreatePost()));
                  },
                  child: Visibility(
                    visible: selectedProfile<3?true:false,
                    child: Entry.offset(
                      duration: const Duration(milliseconds: 500),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.width*0.1),
                        child: Container(
                          height: size.height*0.08,
                          width: size.width*0.85,
                          decoration: BoxDecoration(
                            color: primaryBlue,
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: const Center(
                              child:Text("Vazhdo",style: TextStyle(color: Colors.white,fontSize: 20),)
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
      ),

    );
  }
}
