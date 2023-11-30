import 'package:Freelanceri/core/failures.dart';
import 'package:Freelanceri/features/controllers/registerController.dart';
import 'package:Freelanceri/features/model/userModel.dart';
import 'package:Freelanceri/features/screens/AuthUi/login.dart';
import 'package:Freelanceri/features/screens/widgets.dart';
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;

class UserProvider extends ChangeNotifier {
  UserModel? _user;
  RegisterController? registerController;

  UserModel? getUser() => _user;

  UserProvider() {
    // Initialize registerController here or in the constructor
    registerController = RegisterController();
  }

  void signOut() {
    _user = null;
    notifyListeners();
  }

  Future<void> register(BuildContext context, UserModel model) async {
    registerController = RegisterController();
    var result = await registerController!.register(model);
    result.fold(
          (failure) => showFailureModal(context, failure),
          (user) {
        _user = user;
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginView()),
              (route) => false,
        );
      },
    );
  }

  Future<UserModel?> login(String email, String password) async {
    if (registerController == null) {
      print('RegisterController is null. Cannot perform login.');
      return null;
    }

    var result = await registerController!.login(email, password);

    return result.fold(
          (failure) {
        print('Login failed: $failure');
        return null;
      },
          (user) {
        _user = UserModel(id:M.ObjectId(),email: email, password: password, firstName: user.firstName, lastName: user.lastName);
        notifyListeners();
        print(_user);
        return _user;
      },
    );
  }


}
