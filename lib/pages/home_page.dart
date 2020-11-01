import 'package:flutter/material.dart';

import '../widgets/circle_icon.dart';
import './weight_page.dart';
import './dashboard.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  // Tab navigation
  int _selectedIndex = 0;
  final List<Widget> _tabs = [
    Dashboard(),
    WeightPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF4F7FB),
      appBar: _buildAppBar(),
      body: _tabs[_selectedIndex],
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Color(0xFFF4F7FB),
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 18.0),
        child: Image.asset(
          'images/menu.png',
          width: 44,
          height: 24,
        ),
      ),
      title: const Text(
        'Home',
        style: TextStyle(
          color: Color(0xFF1F2453),
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 18.0),
          child: IconButton(
            icon: CircleIcon(
              icon: Icons.add,
              fillColor: Color(0xFF97D749),
              iconColor: Colors.white,
              size: 28,
            ),
            onPressed: () => {},
          ),
        ),
      ],
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          activeIcon: Image.asset('images/home.png'),
          label: 'Home',
          backgroundColor: Color(0xFFF4F6FF),
          icon: Image.asset('images/home_i.png'),
        ),
        BottomNavigationBarItem(
          activeIcon: Image.asset('images/weight.png'),
          label: 'Weight',
          backgroundColor: Color(0xFFF4F6FF),
          icon: Image.asset('images/weight_i.png'),
        ),
        BottomNavigationBarItem(
          activeIcon: Image.asset('images/chat.png'),
          label: 'Chat',
          backgroundColor: Color(0xFFF4F6FF),
          icon: Image.asset('images/chat_i.png'),
        ),
        BottomNavigationBarItem(
          activeIcon: Image.asset('images/contests.png'),
          label: 'Contests',
          backgroundColor: Color(0xFFF4F6FF),
          icon: Image.asset('images/contests_i.png'),
        ),
        BottomNavigationBarItem(
          activeIcon: Image.asset('images/food.png'),
          label: 'Food',
          backgroundColor: Color(0xFFF4F6FF),
          icon: Image.asset('images/food_i.png'),
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}
