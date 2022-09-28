import 'package:flutter/material.dart';
// import 'package:musicstore_app/screens/dashboard/dashboard_screen.dart';
import 'package:musicstore_app/user/user_local.dart';
import 'homepage_screen.dart';
import '../utils/sales_screen.dart';
import '../utils/menu_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedPage = 0; //determina a pagina inicial da lista
  List<Widget> pageList = []; // declaração da lista
  @override
  void initState() {
    pageList.add(const HomepageScreen());
    pageList.add(const SalesScreen());
    pageList.add(const MenuScreen());
    // pageList.add(const DashboardScreen());
    super.initState();
  }

  UserLocal userLocal =
      UserLocal(); // instanciação da classe user - dados do usuario -
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // parte superior - Appbar
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 161, 94, 18),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/static-edited.png",
              fit: BoxFit.fitHeight,
              height: 55,
            ),
          ],
        ),
      ),
      body: IndexedStack(
        children: pageList,
        index: _selectedPage,
      ),

      // Parte inferior = botton navigatio bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        type: BottomNavigationBarType.fixed,
        // backgroundColor: Colors.green.shade900,
        selectedItemColor: const Color.fromARGB(255, 233, 143, 21),
        unselectedItemColor: const Color.fromARGB(255, 73, 42, 6),
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopify_sharp), label: "Produtos"),
          // BottomNavigationBarItem(icon: Icon(Icons.school), label: "Academia"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
  }
}
