import 'package:flutter/material.dart';
import 'package:Freelanceri/core/const.dart';

class ChangeAccountRole extends StatefulWidget {
  const ChangeAccountRole({Key? key}) : super(key: key);

  @override
  State<ChangeAccountRole> createState() => _ChangeAccountRoleState();
}

class _ChangeAccountRoleState extends State<ChangeAccountRole> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        backgroundColor: primaryBlue,
        centerTitle: true,
        title: const Text("Freelanceri"),
      ),
    );
  }
}
