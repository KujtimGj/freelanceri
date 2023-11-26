import 'package:Freelanceri/core/const.dart';
import 'package:Freelanceri/core/dimensions.dart';
import 'package:Freelanceri/core/failures.dart';
import 'package:Freelanceri/features/screens/AuthUi/login.dart';
import 'package:flutter/material.dart';

showFailureModal(BuildContext context,Failure f){

  var failure = f.runtimeType;
  if(failure == ServerFailure){
    getFailureModal(context, f.props.first.toString());
  }
  else if(failure == OfflineFailure){
    getFailureModal(context, f.props.first.toString());

  }
  else if(failure == WrongDataFailure){
    getFailureModal(context, f.props.first.toString());
  }
  else if(failure == UnauthorizedFailure){
    getFailureModal(context, f.props.first.toString(),logout: false);
  }
  else if(failure == UnfilledDataFailure){
    getFailureModal(context, f.props.first.toString());
  }
  else if(failure == DuplicateFailure){
    getFailureModal(context, f.props.first.toString());
  }
  else{
  }




}

getFailureModal(BuildContext context,String messageFailure,{bool? logout,bool? shouldPop}){
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
          child: Container(
            width: getPhoneWitdth(context),
            padding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    messageFailure,textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w500,color: Colors.black),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: getPhoneWitdth(context) * 0.5,
                        height: 42,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: primaryBlue),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Largo",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }).then((value) {
    if(logout != null && logout){

      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const LoginView()), (route) => false);
    }
  });
}
