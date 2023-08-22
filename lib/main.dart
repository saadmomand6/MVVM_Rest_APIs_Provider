import 'package:flutter/material.dart';
import 'package:mmvm_rest_apis_provider/utilities/routes/route_names.dart';
import 'package:mmvm_rest_apis_provider/utilities/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: RoutesNames.login,
        onGenerateRoute: Routes.generateRoute);
  }
}
