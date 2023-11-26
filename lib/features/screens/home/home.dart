import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Freelanceri/core/const.dart';
import 'package:Freelanceri/core/dimensions.dart';
import 'package:Freelanceri/features/model/postModel.dart';
import 'package:Freelanceri/features/providers/postProvider.dart';
import 'package:Freelanceri/features/screens/details/details.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  List<PostModel>? postModel;
   Home({Key? key,this.postModel}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool fetchingPosts = false;

  getPosts()async{
    setState(() =>fetchingPosts=true);
    var provider = Provider.of<PostProvider>(context,listen: false);
    await provider.getAllPosts(context);
    setState(() => fetchingPosts=false);
  }




  @override
  void initState() {
    super.initState();
    getPosts();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // final provider = Provider.of<PostProvider>(context);
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
              color: primaryBlue,
              height: 50,
            ),
            const SizedBox(width: 10),
            SvgPicture.asset("assets/svg/freelanceri_txt.svg")
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: postModel.length,
                itemBuilder: (context, index) {
                  PostModel posts = postModel[index];
                  return Entry.offset(
                    duration: Duration(seconds: index == 0 ? 1 : index + 1),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Details(post: posts,)));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                          width: size.width * 0.95,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: getPhoneHeight(context)*0.25,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  borderRadius:  BorderRadius.only(topRight: Radius.circular(10),topLeft:Radius.circular(10) ),
                                  image: DecorationImage(
                                    image: AssetImage("assets/postExample2.jpg"),fit: BoxFit.cover)
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          height:50,
                                          width: 50,
                                          child:Icon(Icons.account_circle_sharp,size: 50,color: Colors.grey[500],)
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: size.width * 0.55,
                                                child: Text(
                                                  postModel[index].title,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(fontSize: 17),
                                                  overflow: TextOverflow.clip,
                                                ),
                                              ),
                                              const SizedBox(height: 5),
                                              Text(
                                              "Filan Fisteku",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    GestureDetector(
                                        onTap: () {},
                                        child:const Icon(
                                       Icons.bookmark_outline,
                                          size: 30,
                                          color: primaryBlue,
                                        ))
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 5),
                                child: Divider(
                                  height: 1,
                                  color: Colors.grey,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                child: Text(
                                  postModel[index].description,
                                  style: const TextStyle(
                                      height: 1.2, wordSpacing: 1.3,fontSize: 13),
                                  maxLines: 3,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.04,
                                    vertical: size.height * 0.01),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Punëtorë",
                                          style: TextStyle(
                                              color: Colors.grey[600],fontSize: 14),
                                        ),
                                        Text(
                                         postModel[index].neededWorkers.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall!
                                              .copyWith(
                                                  color: primaryBlue,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Kohëzgjatja",
                                          style: TextStyle(
                                              color: Colors.grey[600],fontSize: 14),
                                        ),
                                        Text(
                                          postModel[index].duration,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall!
                                              .copyWith(
                                                  color: primaryBlue,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Bugjeti",
                                          style: TextStyle(
                                              color: Colors.grey[600],fontSize: 14),
                                        ),
                                        Text(
                                          "${postModel[index].budget}€",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall!
                                              .copyWith(
                                                  color: primaryBlue,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: size.height * 0.07,
                                width: size.width,
                                decoration: const BoxDecoration(
                                    color: primaryBlue,
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(15),
                                        bottomLeft: Radius.circular(15))),
                                child: const Center(
                                  child: Text(
                                    "Apliko",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
