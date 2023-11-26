import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Freelanceri/core/const.dart';
import 'package:Freelanceri/main.dart';
import 'package:Freelanceri/features/screens/AuthUi/login.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  late PageController _pageController;
  int initialPage = 0;
  double currentPageValue = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: initialPage,
    );
    _pageController.addListener(() {
      setState(() {
        currentPageValue = _pageController.page!;

      });
    });
  }
  bool onLastPage = false;

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Positioned(
              top: size.height * 0.4,
              left: 35,
              right: 35,
              child: Row(
                children: [
                  SvgPicture.asset("assets/svg/freelanceri.svg",
                      color: primaryBlue, height: 50),
                  SizedBox(width: size.width * 0.04),
                  const Text("Freelanceri",
                      style: TextStyle(color: primaryBlue, fontSize: 20))
                ],
              ),
            ),
            Positioned(
              top: size.height * 0.50,
              left: 35,
              right: 35,
              child: SizedBox(
                width: size.width,
                height: size.height * 0.35,
                child: PageView(
                    controller: _pageController,
                    physics: const ClampingScrollPhysics(),
                    onPageChanged: (index){
                  setState(() {
                    onLastPage = (index==2);
                  });
                    },
                    children: [
                  SizedBox(
                    height: size.height * 0.3,
                    width: size.width * 0.6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Për punëkërkues",
                          style: TextStyle(fontSize: 23),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.03),
                          child: Text(
                            "Ofron një mundësi të shkëlqyer për të shfaqur aftësitë tuaja dhe për të rritur karrierën tuaj. Ndërtoni reputacionin tuaj duke marrë vlerësime pozitive nga klientët e kënaqur.",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey[500],
                                height: 1.5),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.3,
                    width: size.width * 0.6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Për punëdhënes",
                          style: TextStyle(fontSize: 23),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.03),
                          child: Text(
                            "Do të keni akses në një grup të madh profesionistësh të pavarur të talentuar, me aftësi dhe ekspertizë të ndryshme, me çmime konkurruese.",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey[500],
                                height: 1.5),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.3,
                    width: size.width * 0.6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Për punëdhënes",
                          style: TextStyle(fontSize: 23),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.03),
                          child: Text(
                            "Do të keni akses në një grup të madh profesionistësh të pavarur të talentuar, me aftësi dhe ekspertizë të ndryshme, me çmime konkurruese.",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey[500],
                                height: 1.5),
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
              ),
            ),
            Positioned(
              bottom: size.height*0.15,
              left: size.width*0.1,
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: const ExpandingDotsEffect(
                    dotHeight: 10,
                    dotColor: Colors.grey,
                    dotWidth: 10,
                    activeDotColor: primaryBlue),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: GestureDetector(
                onTap: (){
                  if(onLastPage==false){
                    currentPageValue+=1;
                    _pageController.animateToPage(currentPageValue.toInt(),
                        duration:const Duration(milliseconds: 50), curve: Curves.fastOutSlowIn);
                  }
                  if(onLastPage==true){
                    Navigator.push(context,MaterialPageRoute(builder: (_)=> const LoginView()));
                  }
                },
                child: Container(
                  height: size.height * 0.08,
                  width: size.width * 0.9,
                  margin: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                  decoration: BoxDecoration(
                    color: primaryBlue,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      onLastPage==true?"Continue":'Next',
                      style:const TextStyle(color: Colors.white, fontSize: 17),
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
