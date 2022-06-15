import 'package:flutter/material.dart';
import 'package:musicstore_app/user/user_local.dart';

class HomepageScreenScreen extends StatefulWidget {
  const HomepageScreenScreen({Key? key}) : super(key: key);

  @override
  State<HomepageScreenScreen> createState() => _HomepageScreenPageState();
}

class _HomepageScreenPageState extends State<HomepageScreenScreen> {
  final UserLocal userLocal = UserLocal();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
            child: Column(
      children: [
        Row(
          children: const [
            SizedBox(
              height: 200,
              child: Text(
                'Bem vindo !',
              ),
            )
          ],
        )
      ],
    )));
  }
}
