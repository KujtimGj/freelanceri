import 'package:Freelanceri/core/const.dart';
import 'package:Freelanceri/features/providers/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Freelanceri/features/providers/postProvider.dart';
import 'package:Freelanceri/features/screens/AuthUi/login.dart';
import 'package:Freelanceri/features/screens/AuthUi/signup.dart';
import 'package:Freelanceri/features/screens/account/account.dart';
import 'package:Freelanceri/features/screens/bookmarks/bookmarks.dart';
import 'package:Freelanceri/features/screens/details/apply.dart';
import 'package:Freelanceri/features/screens/details/details.dart';
import 'package:Freelanceri/features/screens/home/home.dart';
import 'package:Freelanceri/features/screens/publishment/publishment.dart';
import 'package:Freelanceri/features/screens/search/search_page.dart';
import 'package:Freelanceri/splash.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs =await SharedPreferences.getInstance();
  var isLoggedIn = prefs.getBool("isLoggedIn") ?? false;
  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key,required this.isLoggedIn});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>PostProvider()),
        ChangeNotifierProvider(create: (_)=> UserProvider(),child: const LoginView(),)
      ],
      child: GetMaterialApp(
        color: const Color(0xfff3f3f3),
        title: 'Freelanceri',
        debugShowCheckedModeBanner: false,
        home:SplashScreen(isLoggedIn: isLoggedIn,),
        getPages: [
          GetPage(name: "/login", page: () => const LoginView()),
          GetPage(name: "/signup", page: () => const SignupView()),
          GetPage(name: "/apply", page: () => const Apply()),
          // GetPage(name: "/createpost", page: () => const CreatePost()),
        ],
      ),
    );
  }
}

class Base extends StatefulWidget {
  const Base({
    super.key,
  });

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  int selectedIndex = 0;
  static final List<Widget> widgetOptions = [
     Home(),
    const Search(),
    const Publishment(),
    const Bookmarks(),
    const Account()
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff3f3f3),
      body: widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar: Visibility(
        visible: selectedIndex == 2 ? false : true,
        child: SizedBox(
          height: 70,
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (int index) {
              if (selectedIndex == 2) {
                Navigator.of(context, rootNavigator: true).pushReplacement(
                    MaterialPageRoute(builder: (context) => Publishment()));
              }
              _onItemTapped(index);
            },
            type: BottomNavigationBarType.fixed,
            items: [
              const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_rounded,
                    size: 30,
                  ),
                  activeIcon: Icon(
                    Icons.home_rounded,
                    color: Color(0xff455BEF),
                    size: 30,
                  ),
                  label: ''),
              const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                    size: 30,
                  ),
                  activeIcon: Icon(
                    Icons.search,
                    size: 30,
                    color: Color(0xff455BEF),
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/svg/plus-circle.svg",
                    color: const Color(0xff455BEF),
                  ),
                  label: ''),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.bookmark_outline,size: 30,),
                  label: '',
                  activeIcon:Icon(Icons.bookmark,color: primaryBlue,size: 30,)),
              const BottomNavigationBarItem(
                  icon: Icon(
                    Icons.account_circle,
                    size: 30,
                  ),
                  activeIcon: Icon(
                    Icons.account_circle,
                    color: Color(0xff455BEF),
                    size: 30,
                  ),
                  label: '')
            ],
          ),
        ),
      ),
    );
  }
}
