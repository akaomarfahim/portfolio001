import 'package:flutter/material.dart';
import 'package:portfolio_final_omar/constants/routes.dart';
import 'package:portfolio_final_omar/ui/screens/admin/add_project.dart';
import 'package:portfolio_final_omar/widgets/widget_default/__button.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  TextStyle textStyle = const TextStyle(fontFamily: 'Rubik', fontSize: 24, color: Colors.white);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wrap(
        children: [
          myButton(
              action: () => Navigator.pushNamed(context, MyRoutes.newProject),
              width: 300,
              height: 200,
              label: Text('Add New Project', style: textStyle)),
          myButton(action: () {}, width: 300, height: 200, label: Text('Add New Blog', style: textStyle)),
          myButton(action: () {}, width: 300, height: 200, label: Text('Edit About', style: textStyle)),
          myButton(action: () => Navigator.pushNamed(context, MyRoutes.worksList), width: 300, height: 200, label: Text('Works List', style: textStyle)),
          // myButton(action: () {}, width: 300, height: 200, label: Text('', style: textStyle)),
          // myButton(action: () {}, width: 300, height: 200, label: Text('Add Post', style: textStyle)),
        ],
      ),
    );
  }
}
