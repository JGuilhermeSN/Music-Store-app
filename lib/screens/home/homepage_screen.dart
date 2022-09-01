import 'package:flutter/material.dart';
import 'package:musicstore_app/user/user_local.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({Key? key}) : super(key: key);

  @override
  State<HomepageScreen> createState() => _HomepageScreenPageState();
}

class _HomepageScreenPageState extends State<HomepageScreen> {
  final UserLocal userLocal = UserLocal();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/pexels-jessica-lewis-creative.jpg',
              ),
              fit: BoxFit.cover)),
    ));
  }
}
