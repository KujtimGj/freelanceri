import 'package:Freelanceri/core/const.dart';
import 'package:Freelanceri/core/dimensions.dart';
import 'package:Freelanceri/features/screens/AuthUi/login.dart';
import 'package:flutter/material.dart';

class ChooseRole extends StatelessWidget {
  const ChooseRole({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBlue.withOpacity(0.9),
      body: SingleChildScrollView(
        child: SizedBox(
          height: getPhoneHeight(context),
          width: getPhoneWitdth(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>const LoginView()));
                },
                child: Container(
                  height: getPhoneHeight(context)*0.07,
                  width: getPhoneWitdth(context)*0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Center(
                    child: Text("Freelancer",style: TextStyle(fontSize: 20),),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: getPhoneHeight(context)*0.07,
                width: getPhoneWitdth(context)*0.9,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: const Center(
                  child: Text("Business",style: TextStyle(fontSize: 20),),
                ),
              ),
              const SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}
