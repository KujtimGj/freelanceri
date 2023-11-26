import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Freelanceri/core/const.dart';
import 'package:Freelanceri/core/dimensions.dart';
import 'package:Freelanceri/features/model/postModel.dart';
import 'package:Freelanceri/features/screens/details/apply.dart';
import 'package:get/get.dart';

class Details extends StatelessWidget {
  final PostModel post;
  const Details({super.key,required this.post});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xfff8f8f8),
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: primaryBlue,
          ),
        ),
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        centerTitle: true,
        shadowColor: primaryBlue,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 5),
            SvgPicture.asset("assets/svg/details.svg")
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.03,
            ),
            Center(
              child: Container(
                height: size.height * 0.18,
                width: size.width * 0.93,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/postExample2.jpg",
                        ),
                        filterQuality: FilterQuality.high,
                        colorFilter: ColorFilter.mode(
                            Colors.white.withOpacity(0.3), BlendMode.modulate),
                        fit: BoxFit.cover)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            size: 30,
                            color: primaryBlue,
                          ),
                          const SizedBox(width: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Lokacioni",
                                style: TextStyle(
                                    color: primaryBlue,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Prishtina",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                        color: primaryBlue,
                                        fontWeight: FontWeight.w700),
                              )
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.access_time_outlined,
                            size: 30,
                            color: primaryBlue,
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Afati",
                                style: TextStyle(
                                    color: primaryBlue,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "20 ditë",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                        color: primaryBlue,
                                        fontWeight: FontWeight.w700),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex:5,
                    child: Row(
                      children: [
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: size.width * 0.03),
                          height: size.height * 0.14,
                          width: size.width * 0.14,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                             ),
                          child: Icon(Icons.account_circle_sharp,size: 50,color: Colors.grey[500],),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: getPhoneWitdth(context)*0.5,
                              child: Text(
                                post.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontSize: 20, fontWeight: FontWeight.w400),
                              ),
                            ),
                            Text(
                              "Filan Fisteku",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.grey[500]),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child:  Icon(
                      Icons.bookmark_outline,
                      color: primaryBlue,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.04, vertical: size.height * 0.01),
              child: const Text("Përshkrimi i punës",
                  style: TextStyle(
                    fontSize: 22,
                  )),
            ),
            Padding(
              padding:const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                post.description,
                style: const TextStyle(wordSpacing: 1.1, height: 1.4),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.03, vertical: 10),
              child: const Divider(
                height: 1.5,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.04, vertical: size.height * 0.005),
              child: const Text(
                "Kërkesat",
                style: TextStyle(fontSize: 22),
              ),
            ),
            Padding(
              padding:const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
              child: Text(
                post.requirements,
                style: const TextStyle(height: 1.4, wordSpacing: 1.1),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.03, vertical: size.height * 0.02),
              child: const Divider(
                height: 1.5,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.01, vertical: size.height * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kerkojmë",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      Text(
                        "${post.neededWorkers} freelancer",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                color: primaryBlue,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Container(
                    height: size.height * 0.06,
                    width: 1,
                    // margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: const BoxDecoration(color: primaryBlue),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kohëzgjatja",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      Text(
                        post.duration,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                color: primaryBlue,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Container(
                    height: size.height * 0.06,
                    width: 1,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: const BoxDecoration(color: primaryBlue),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bugjeti",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      Text(
                        '${post.budget.toString()}€',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                color: primaryBlue,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_)=> Apply(posts: post,)));
              },
              child: Center(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: size.height * 0.03),
                  height: size.height * 0.08,
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: primaryBlue),
                  child: const Center(
                    child: Text(
                      "Apliko",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                "Rreth punëdhenësit",
                style: TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.account_circle,size: 50,color: Colors.grey[400]),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Filan Fisteku",
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              "Individ",
                              style: TextStyle(
                                  color: Colors.grey[500], fontSize: 14),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Kontakti",
                        style: TextStyle(color: Colors.grey[400]),
                      ),
                      Text(
                        "gjokajkujtim9@gmail.com",
                        style: TextStyle(color: Colors.grey[400]),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.04,
                  right: size.width * 0.04,
                  top: size.height * 0.03,
                  bottom: size.height * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nga",
                        style: TextStyle(fontSize: 17, color: Colors.grey[400]),
                      ),
                      const Text(
                        "Prishtina, Kosovo",
                        style: TextStyle(fontSize: 18, color: Colors.black87),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Anëtar nga",
                        style: TextStyle(fontSize: 17, color: Colors.grey[400]),
                      ),
                      const Text(
                        "04/27/2023",
                        style: TextStyle(fontSize: 18, color: Colors.black87),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.03, vertical: size.height * 0.01),
              child: Divider(
                height: 1.5,
                color: Colors.grey[400],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.03,
                  top: size.height * 0.02,
                  bottom: size.height * 0.02),
              child: const Text(
                "Postime të ngjashme",
                style: TextStyle(fontSize: 17),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
