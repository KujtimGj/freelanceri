import 'package:Freelanceri/core/failures.dart';
import 'package:Freelanceri/features/controllers/registerController.dart';
import 'package:Freelanceri/features/model/userModel.dart';
import 'package:Freelanceri/features/screens/AuthUi/login.dart';
import 'package:Freelanceri/features/screens/widgets.dart';
import 'package:flutter/material.dart';

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
        // Handle failure, e.g., show an error message
        print('Login failed: $failure');
        return null;
      },
          (user) {
        _user = UserModel(email: email, password: password, firstName: user.firstName, lastName: user.lastName);
        notifyListeners();
        return _user;
      },
    );
  }


}
