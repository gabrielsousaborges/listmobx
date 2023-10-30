import 'package:flutter/material.dart';
import 'package:listamobx/screens/login_screen.dart';
import 'package:listamobx/stores/login_store.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<LoginStore>(
      create: (_) => LoginStore(),
      child: MaterialApp(
        title: 'Lista MobX',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blueAccent,
          cardColor: Colors.blueAccent,
          scaffoldBackgroundColor: Colors.blueAccent,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
