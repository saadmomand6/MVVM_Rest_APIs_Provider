import 'package:flutter/material.dart';
import 'package:mmvm_rest_apis_provider/utilities/routes/route_names.dart';
import 'package:mmvm_rest_apis_provider/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userpreference = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          InkWell(
              onTap: () {
                userpreference.removeUser().then((value) {
                  Navigator.pushNamed(context, RoutesNames.login);
                });
              },
              child: const Text('logout'))
        ]
      ),
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}
